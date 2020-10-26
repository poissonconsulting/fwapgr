#' FWA nearest stream
#'
#' Provided a point (x, y, srid), return stream(s) nearest to the point within specified tolerance.
#'
#' @param x A number of the x coordinate.
#' @param y A number of the y coordinate.
#' @param srid An integer of the srid of the coordinate (e.g. epsg).
#' @param tolerance A number of the tolerance.
#' @param num_features An integer of the maximum number of features to return.
#' @param epsg An integer of the epsg to transform results to.
#' @return A sf object
#' @export
#' @examples
#' fwa_nearest_stream(x = -132.26, y = 53.36, srid = 4326)
fwa_nearest_stream <- function(x, y, srid,
                               tolerance = 5000,
                               num_features = 1,
                               epsg = srid){
  chk_number(x)
  chk_number(y)
  chk_number(tolerance)
  chk_whole_number(num_features)
  chk_whole_number(srid)
  chk_whole_number(epsg)

  path <- "fwapg/functions/fwa_neareststream/items.json"
  query <- list(x = x,
                y = y,
                srid = srid,
                tolerance = tolerance,
                num_features = num_features)
  resp <- fwa_api(path, query)
  read_feature(resp, epsg)
}

#' FWA watershed at downstream route measure
#'
#' Provided a location as blue_line_key and downstream_route_measure,
#' return the entire watershed boundary upstream of the location.
#'
#' @inheritParams fwa_collection
#' @param blue_line_key An integer of the stream blue line key.
#' @param downstream_route_measure An integer of the downstream route measure.
#' @return A sf object
#' @export
#' @examples
#' fwa_watershed_at_measure(356308001, downstream_route_measure = 10000)
fwa_watershed_at_measure <- function(blue_line_key, downstream_route_measure = 0, epsg = 4326){
  chk_whole_number(blue_line_key)
  chk_number(downstream_route_measure)
  chk_whole_number(epsg)

  path <- "fwapg/functions/fwa_watershedatmeasure/items.json"
  query <- list(blue_line_key = blue_line_key,
                downstream_route_measure = downstream_route_measure)
  resp <- fwa_api(path, query)
  read_feature(resp, epsg)
}

#' FWA stream at downstream route measure
#'
#' Provided a location as blue_line_key and downstream_route_measure, return stream segments upstream, within the same first order watershed.
#'
#' @inheritParams fwa_collection
#' @param blue_line_key An integer of the stream blue line key.
#' @param downstream_route_measure An integer of the downstream route measure.
#' @return A sf object
#' @export
#' @examples
#' fwa_stream_at_measure(356308001, downstream_route_measure = 10000)
fwa_stream_at_measure <- function(blue_line_key, downstream_route_measure = 0, epsg = 4326){
  chk_whole_number(blue_line_key)
  chk_number(downstream_route_measure)
  chk_whole_number(epsg)

  path <- "fwapg/functions/fwa_watershedstream/items.json"
  query <- list(blue_line_key = blue_line_key,
                downstream_route_measure = downstream_route_measure)
  resp <- fwa_api(path, query)
  read_feature(resp, epsg)
}

#' FWA watershed hex
#'
#' Provided a location as blue_line_key and downstream_route_measure, return a 25m hexagon grid covering first order watershed in which location lies.
#'
#' @inheritParams fwa_collection
#' @param blue_line_key An integer of the stream blue line key.
#' @param downstream_route_measure An integer of the downstream route measure.
#' @return A sf object
#' @export
#' @examples
#' fwa_watershed_hex(356308001, downstream_route_measure = 10000)
fwa_watershed_hex <- function(blue_line_key, downstream_route_measure = 0, epsg = 4326){
  chk_whole_number(blue_line_key)
  chk_number(downstream_route_measure)
  chk_whole_number(epsg)

  path <- "fwapg/functions/fwa_watershedhex/items.json"
  query <- list(blue_line_key = blue_line_key,
                downstream_route_measure = downstream_route_measure)
  resp <- fwa_api(path, query)
  read_feature(resp, epsg)
}


