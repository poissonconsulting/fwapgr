#' FWA list layers
#'
#' List available layers. \lifecycle{defunct}
#'
#' @return A tibble
#' @export
#' @examples
#' \dontrun{
#' fwa_list_layers()
#' }
fwa_list_layers <- function(){

  deprecate_stop("0.1.0",
                 what = "fwa_list_layers()",
                 with = "fwa_list_tables()",
                 details = "The API at 'hillcrestgeo.ca/fwa' is no longer active and has been replaced with 'hillcrestgeo.ca/fwapg'.")

  path <- "fwa/v1/list_layers"
  query <- list(a = NULL)

  resp <- fwa_api(path, query)

  df <- jsonlite::fromJSON(resp)
  tibble::as_tibble(df)
}

#' FWA feature
#'
#' Get features from table. \lifecycle{defunct}
#'
#' @param table A character string of the table name.
#' @param filter A character string of the SQL WHERE statement to filter features by.
#' @param columns A vector of strings of the column names to include.
#' @param bounds A vector of numbers indicating bounding box to limit output features to, e.g. `c(sw.lng, sw.lat, ne.lng, ne.lat)`.
#' @param geom_column A character string of the name of the geometry column of the table.
#' @param epsg An integer of the epsg to transform features to.
#' @param schema A character string of the schema. Default 'whse_basemapping' is used for most layers.
#' @return A sf object
#' @export
#' @examples
#' \dontrun{
#' fwa_feature("fwa_stream_networks_sp", filter = "gnis_name = 'Sangan River'")
#' }
fwa_feature <- function(table, filter = NULL, columns = NULL,
                        bounds = NULL, geom_column = "geom",
                        epsg = 4326, schema = "whse_basemapping"){

  deprecate_stop("0.1.0",
                 what = "fwa_feature()",
                 with = "fwa_collection()",
                 details = "The API at 'hillcrestgeo.ca/fwa' is no longer active and has been replaced with 'hillcrestgeo.ca/fwapg'.")

  chk_string(table)
  chk_string(geom_column)
  chk_null_or(columns, chk_character)
  chk_null_or(filter, chk_string)
  chk_bounds(bounds)
  chk_whole_number(epsg)
  chk_string(schema)

  table <- add_schema(table, schema)
  columns <- format_columns(columns)
  bounds <- format_bounds(bounds)

  path <- glue("fwa/v1/geojson/{table}")
  query <- list(filter = filter,
                columns = columns,
                bounds = bounds,
                geom_column = geom_column)

  resp <- fwa_api(path, query)

  read_feature(resp, epsg)
}

#' FWA watershed
#'
#' Get watershed upstream of a location on a stream. \lifecycle{defunct}
#'
#' @inheritParams fwa_feature
#' @param blue_line_key An integer of the stream blue line key.
#' @param downstream_route_measure An integer of the downstream route measure.
#' @return A sf object
#' @export
#' @examples
#' \dontrun{
#' fwa_watershed(356308001)
#' }
fwa_watershed <- function(blue_line_key, downstream_route_measure = 0, epsg = 4326){
  deprecate_stop("0.1.0",
                 what = "fwa_watershed()",
                 with = "fwa_watershed_at_measure()",
                 details = "The API at 'hillcrestgeo.ca/fwa' is no longer active and has been replaced with 'hillcrestgeo.ca/fwapg'.")

  chk_whole_number(blue_line_key)
  chk_whole_number(downstream_route_measure)
  chk_whole_number(epsg)

  path <- glue("fwa/v1/watershed/{blue_line_key}")
  query <- list(downstream_route_measure = downstream_route_measure)
  resp <- fwa_api(path, query)
  read_feature(resp, epsg)
}

#' FWA stream network
#'
#' Get stream network features from gnis_name. \lifecycle{defunct}
#'
#' @inheritParams fwa_feature
#' @param gnis_name A character string of the gnis_name.
#' @param named_streams A flag indicating whether to get data from the 'fwa_named_streams' layer.
#'  If FALSE, the 'fwa_stream_networks_sp' layer is used.
#' @return A sf object
#' @export
#' @examples
#' \dontrun{
#' fwa_gnis_streams('Sangan River')
#' }
fwa_gnis_streams <- function(gnis_name,
                             columns = NULL,
                             bounds = NULL,
                             geom_column = "geom",
                             epsg = 4326,
                             named_streams = FALSE){

  deprecate_stop("0.1.0",
                 what = "fwa_gnis_streams()",
                 with = "fwa_stream_gnis()",
                 details = "The API at 'hillcrestgeo.ca/fwa' is no longer active and has been replaced with 'hillcrestgeo.ca/fwapg'.")


  chk_string(gnis_name)
  table <- "fwa_stream_networks_sp"
  if(named_streams)
    table <- "fwa_named_streams"
  filter <- filter_gnis(gnis_name)

  fwa_feature(table = table, filter = filter, columns = columns,
              bounds = bounds, geom_column = geom_column,
              epsg = epsg)
}

#' BBox
#'
#' Get bounding box of feature(s). \lifecycle{defunct}
#'
#' @inheritParams fwa_feature
#' @return A sf object
#' @export
#' @examples
#' \dontrun{
#' fwa_bbox("fwa_stream_networks_sp", filter = "gnis_name = 'Cowichan River'")
#' }
fwa_bbox <- function(table, filter = NULL, geom_column = "geom",
                     epsg = 4326, schema = "whse_basemapping"){

  deprecate_stop("0.1.0",
                 what = "fwa_bbox()",
                 details = "The API at 'hillcrestgeo.ca/fwa' is no longer active and has been replaced with 'hillcrestgeo.ca/fwapg'.")

  chk_string(table)
  chk_null_or(filter, chk_string)
  chk_string(geom_column)
  chk_whole_number(epsg)
  chk_string(schema)

  table <- add_schema(table, schema)

  path <- glue("fwa/v1/bbox/{table}")
  query <- list(filter = filter,
                geom_column = geom_column)
  resp <- fwa_api(path, query)
  parse_bbox(resp)
}
