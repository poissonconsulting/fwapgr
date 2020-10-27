#' FWA function
#'
#' General function API call
#'
#' @inheritParams fwa_collection
#' @param function_id A character string of the function id
#' @param parameters A named list of the parameters and values for a specific function.
#' @return A sf object
#' @seealso \href{https://www.hillcrestgeo.ca/fwapg/functions.html}{API documentation}

fwa_function <- function(function_id,
                            parameters,
                            limit = 10000,
                            offset = 0,
                            bbox = NULL,
                            properties = NULL,
                            transform = NULL,
                            epsg = 4326){

  chk_string(function_id)
  chk_list(parameters)
  chk_named(parameters)
  chk_whole_number(limit)
  chk_whole_number(offset)
  chk_bbox(bbox)
  chk_null_or(properties, chk_character)
  chk_null_or(transform, chk_string)
  chk_whole_number(epsg)

  path <- glue("fwapg/functions/{function_id}/items.json")
  query <- c(parameters, list(
                limit = limit,
                offset = offset,
                bbox = bbox,
                properties = properties,
                transform = transform))

  resp <- fwa_api(path, query)
  read_feature(resp, epsg)
}

#' FWA index point
#'
#' Provided a point (x, y, srid), return the point along a stream(s) nearest to the point provided within specified tolerance.
#'
#' @inheritParams fwa_collection
#' @param x A number of the x coordinate.
#' @param y A number of the y coordinate.
#' @param srid An integer of the srid of the coordinate (e.g. epsg).
#' @param tolerance A number of the tolerance.
#' @param num_features An integer of the maximum number of features to return.
#' @return A sf object
#' @seealso \href{https://www.hillcrestgeo.ca/fwapg/functions/fwa_indexpoint.html}{fwa_indexpoint API documentation}
#' @export
#' @examples
#' \dontrun{fwa_index_point(x = -132.26, y = 53.36, srid = 4326)}
fwa_index_point <- function(x, y, srid,
                            tolerance = 5000,
                            num_features = 1,
                            limit = 10000,
                            offset = 0,
                            bbox = NULL,
                            properties = NULL,
                            transform = NULL,
                            epsg = srid){
  chk_number(x)
  chk_number(y)
  chk_number(tolerance)
  chk_whole_number(num_features)
  chk_whole_number(srid)

  parameters <- list(x = x,
                     y = y,
                     srid = srid,
                     tolerance = tolerance,
                     num_features = num_features)

  fwa_function("fwa_indexpoint",
               parameters = parameters,
               limit = limit,
               offset = offset,
               bbox = bbox,
               properties = properties,
               transform = transform,
               epsg = epsg)
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
#' @seealso \href{https://www.hillcrestgeo.ca/fwapg/functions/fwa_watershedatmeasure.html}{fwa_watershedatmeasure API documentation}
#' @export
#' @examples
#' \dontrun{fwa_watershed_at_measure(356308001, downstream_route_measure = 10000)}
fwa_watershed_at_measure <- function(blue_line_key,
                                     downstream_route_measure = 0,
                                     limit = 10000,
                                     offset = 0,
                                     bbox = NULL,
                                     properties = NULL,
                                     transform = NULL,
                                     epsg = 4326){
  chk_whole_number(blue_line_key)
  chk_number(downstream_route_measure)

  parameters <- list(blue_line_key = blue_line_key,
                     downstream_route_measure = downstream_route_measure)

  fwa_function("fwa_watershedatmeasure",
               parameters = parameters,
               limit = limit,
               offset = offset,
               bbox = bbox,
               properties = properties,
               transform = transform,
               epsg = epsg)
}

#' FWA watershed stream
#'
#' Provided a location as blue_line_key and downstream_route_measure, return stream segments upstream, within the same first order watershed.
#'
#' @inheritParams fwa_collection
#' @param blue_line_key An integer of the stream blue line key.
#' @param downstream_route_measure An integer of the downstream route measure.
#' @return A sf object
#' @seealso \href{https://www.hillcrestgeo.ca/fwapg/functions/fwa_watershedstream.html}{fwa_watershedstream API documentation}
#' @export
#' @examples
#' \dontrun{fwa_watershed_stream(356308001, downstream_route_measure = 10000)}
fwa_watershed_stream<- function(blue_line_key,
                                  downstream_route_measure = 0,
                                  limit = 10000,
                                  offset = 0,
                                  bbox = NULL,
                                  properties = NULL,
                                  transform = NULL,
                                  epsg = 4326){
  chk_whole_number(blue_line_key)
  chk_number(downstream_route_measure)

  parameters <- list(blue_line_key = blue_line_key,
                     downstream_route_measure = downstream_route_measure)

  fwa_function("fwa_watershedstream",
               parameters = parameters,
               limit = limit,
               offset = offset,
               bbox = bbox,
               properties = properties,
               transform = transform,
               epsg = epsg)
}

#' FWA watershed hex
#'
#' Provided a location as blue_line_key and downstream_route_measure, return a 25m hexagon grid covering first order watershed in which location lies.
#'
#' @inheritParams fwa_collection
#' @param blue_line_key An integer of the stream blue line key.
#' @param downstream_route_measure An integer of the downstream route measure.
#' @return A sf object
#' @seealso \href{https://www.hillcrestgeo.ca/fwapg/functions/fwa_watershedhex.html}{fwa_watershedhex API documentation}
#' @export
#' @examples
#' \dontrun{fwa_watershed_hex(356308001, downstream_route_measure = 10000)}
fwa_watershed_hex <- function(blue_line_key,
                              downstream_route_measure = 0,
                              limit = 10000,
                              offset = 0,
                              bbox = NULL,
                              properties = NULL,
                              transform = NULL,
                              epsg = 4326){
  chk_whole_number(blue_line_key)
  chk_number(downstream_route_measure)

  parameters <- list(blue_line_key = blue_line_key,
                     downstream_route_measure = downstream_route_measure)

  fwa_function("fwa_watershedhex",
               parameters = parameters,
               limit = limit,
               offset = offset,
               bbox = bbox,
               properties = properties,
               transform = transform,
               epsg = epsg)
}

#' FWA locate along
#'
#' Provided a location as blue_line_key and downstream_route_measure, return a point.
#'
#' @inheritParams fwa_collection
#' @param blue_line_key An integer of the stream blue line key.
#' @param downstream_route_measure An integer of the downstream route measure.
#' @return A sf object
#' @seealso \href{https://www.hillcrestgeo.ca/fwapg/functions/fwa_locatealong.html}{fwa_locatealong API documentation}
#' @export
#' @examples
#' \dontrun{fwa_locate_along(356308001, downstream_route_measure = 10000)}
fwa_locate_along <- function(blue_line_key,
                             downstream_route_measure = 0,
                             limit = 10000,
                             offset = 0,
                             bbox = NULL,
                             properties = NULL,
                             transform = NULL,
                             epsg = 4326){
  chk_whole_number(blue_line_key)
  chk_number(downstream_route_measure)

  parameters <- list(blue_line_key = blue_line_key,
                     downstream_route_measure = downstream_route_measure)

  fwa_function("fwa_locatealong",
               parameters = parameters,
               limit = limit,
               offset = offset,
               bbox = bbox,
               properties = properties,
               transform = transform,
               epsg = epsg)
}

#' FWA locate along interval
#'
#' Provided a blue_line_key and starting downstream distance, return a set of points along an interval.
#'
#' @inheritParams fwa_collection
#' @param blue_line_key An integer of the stream blue line key.
#' @param interval_length An integer of the interval distance in meters.
#' @param start An integer of the distance in meters upstream from the river mouth to start from.
#' @return A sf object
#' @seealso \href{https://www.hillcrestgeo.ca/fwapg/functions/fwa_locatealonginterval.html}{fwa_locatealonginterval API documentation}
#' @export
#' @examples
#' \dontrun{fwa_locate_along_interval(356308001, interval_length = 10, start = 0)}
fwa_locate_along_interval <- function(blue_line_key,
                                      interval_length = 1000,
                                      start = 0,
                                      limit = 10000,
                                      offset = 0,
                                      bbox = NULL,
                                      properties = NULL,
                                      transform = NULL,
                                      epsg = 4326){
  chk_whole_number(blue_line_key)
  chk_whole_number(interval_length)
  chk_whole_number(start)

  parameters <- list(blue_line_key = blue_line_key,
                     start = start,
                     interval_length = interval_length)

  fwa_function("fwa_locatealonginterval",
               parameters = parameters,
               limit = limit,
               offset = offset,
               bbox = bbox,
               properties = properties,
               transform = transform,
               epsg = epsg)
}



