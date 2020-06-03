#' FWA feature
#'
#' Get features from table.
#'
#' @param table A character string of the table name.
#' @param filter A character string of the SQL WHERE statement to filter features by.
#' @param columns A vector of strings of the column names to include.
#' @param bounds A vector of numbers indicating bounding box to limit output features to, e.g. `c(sw.lng, sw.lat, ne.lng, ne.lat)`.
#' @param geom_column A character string of the name of the geometry column of the table.
#' @param epsg An integer of the epsg to transform features to.
#' @return A sf object
#' @export
#' @examples
#' fwa_feature("fwa_stream_networks_sp", filter = "gnis_name = 'Sangan River'")
fwa_feature <- function(table, filter = NULL, columns = NULL,
                        bounds = NULL, geom_column = "geom", epsg = 4326){

  chk_string(table)
  chk_string(geom_column)
  chkor(chk_character(columns), chk_null(columns))
  chkor(chk_string(filter), chk_null(filter))
  chk_bounds(bounds)
  chk_whole_number(epsg)

  table <- add_schema(table)
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
#' Get watershed upstream of a location on a stream.
#'
#' @inheritParams fwa_feature
#' @param blue_line_key An integer of the stream blue line key.
#' @param downstream_route_measure An integer of the downstream route measure.
#' @return A sf object
#' @export
#' @examples
#' fwa_watershed(356308001)
fwa_watershed <- function(blue_line_key, downstream_route_measure = 0, epsg = 4326){
  chk_whole_number(blue_line_key)
  chk_whole_number(downstream_route_measure)
  chk_whole_number(epsg)

  path <- glue("fwa/v1/watershed/{blue_line_key}")
  query <- list(downstream_route_measure = downstream_route_measure)
  resp <- fwa_api(path, query)
  read_feature(resp, epsg)
}

#' BBox
#'
#' Get bounding box of feature(s)
#'
#' @inheritParams fwa_feature
#' @return A sf object
#' @export
#' @examples
#' fwa_bbox("fwa_stream_networks_sp", filter = "gnis_name = 'Cowichan River'")
fwa_bbox <- function(table, filter = NULL, geom_column = "geom", epsg = 4326){
  chk_string(table)
  chkor(chk_string(filter), chk_null(filter))
  chk_string(geom_column)
  chk_whole_number(epsg)

  table <- add_schema(table)

  path <- glue("fwa/v1/bbox/{table}")
  query <- list(filter = filter,
                geom_column = geom_column)
  resp <- fwa_api(path, query)
  parse_bbox(resp)
}

