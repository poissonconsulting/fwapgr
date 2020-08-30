#' FWA list collections
#'
#' List available collections.
#'
#' @return A tibble
#' @export
#' @examples
#' fwa_list_collections()
fwa_list_tables <- function(){

  path <- glue("fwapg/collections")
  query <- list(a = NULL)

  resp <- fwa_api(path, query)

  df <- jsonlite::fromJSON(resp)$collections
  df$table <- sapply(strsplit(df$id, "\\."), function(x) x[2])
  df$schema <- sapply(strsplit(df$id, "\\."), function(x) x[1])
  df$collection_id <- df$id
  df <- df[c("table", "schema", "collection_id", "extent")]
  tibble::as_tibble(df)
}

#' FWA list columns
#'
#' List columns in a table.
#'
#' @return A tibble
#' @inheritParams fwa_feature
#' @export
#' @examples
#' fwa_list_columns("fwa_stream_networks_sp")
fwa_list_columns <- function(table, schema = "whse_basemapping"){

  collection <- add_schema(table, schema)
  path <- glue("fwapg/collections/{collection}")
  query <- list(a = NULL)

  resp <- fwa_api(path, query)

  df <- jsonlite::fromJSON(resp)$properties
  tibble::as_tibble(df)
}

#' FWA feature
#'
#' Get features from table.
#'
#' @param collection_id A character string of the table name.
#' @param filter A named vector or list of the filter(s) to apply, where the list
#' names correspond to column names and the list values correspond to the desired
#' value, e.g. `list(gnis_name = "Sangan River")`.
#' @param bbox A vector of numbers indicating bounding box to limit output
#' features to, e.g. `c(minLon, minLat, maxLon, maxLat)`.
#' @param columns A vector of strings of the column names to include.
#' @param epsg A positive whole number of the epsg to transform features to.
#' @param limit A positive whole number indicating the maximum number of features to return.
#' @param offset A positive whole number indicating the offset of start of returned results.
#' @param schema A character string of the schema to prepend to collection_id.
#' Possible values include 'whse_basemapping', 'usgs', 'hydrosheds' and NULL. If NULL, nothing is prepended.
#' @return A sf object
#' @export
#' @examples
#' fwa_feature("fwa_stream_networks_sp", filter = "gnis_name = 'Sangan River'")
fwa_feature <- function(collection_id,
                        filter = NULL,
                        bbox = NULL,
                        columns = NULL,
                        epsg = 4326,
                        limit = 10000,
                        offset = 0,
                        schema = "whse_basemapping"){

  chk_string(collection_id)
  chkor(chk_is(filter, "vector"), chk_is(filter, "list"), chk_null(filter))
  chkor(chk_named(filter), chk_null(filter))
  chkor(chk_character(columns), chk_null(columns))
  chkor(chk_bbox(bbox), chk_null(bbox))
  chk_whole_number(epsg)
  chk_whole_number(limit)
  chk_whole_number(offset)
  chkor(chk_subset(schema, c("whse_basemapping", "usgs", "hydrosheds")),
        chk_null(schema))

  collection_id <- add_schema(collection_id, schema)
  columns <- format_columns(columns)
  bbox <- format_bounds(bbox)

  path <- glue("fwapg/collections/{collection_id}/items.json")
  query <- c(filter,
             list(bbox = bbox,
                  properties = columns,
                  limit = limit,
                  offset = offset))

  resp <- fwa_api(path, query)

  read_feature(resp, epsg)
}
