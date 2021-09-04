#' Freshwater Atlas Index Point
#'
#' Gets the nearest point on a stream as the crow flies to the coordinates (within the tolerance).
#'
#' To also return the second nearest point on a stream as the crow flies (within the tolerance)
#' set `limit = 2`.
#'
#' @inherit internal
#' @family functions
#' @seealso [API documentation](https://www.hillcrestgeo.ca/fwapg/functions/fwa_indexpoint.html)
#' @export
#' @examples
#' fwa_index_point(x = -132.26, y = 53.36)
fwa_index_point <- function(x, y, srid = 4326,
                            tolerance = 5000,
                            limit = 1,
                            bbox = NULL,
                            properties = NULL,
                            transform = NULL,
                            epsg = 4326) {
  chk_number(x)
  chk_number(y)
  chk_whole_number(srid)
  chk_gt(srid)
  chk_number(tolerance)
  chk_gt(tolerance)
  chk_whole_number(limit)
  chk_gt(limit)

  parameters <- list(
    x = x,
    y = y,
    srid = srid,
    tolerance = tolerance,
    num_features = limit
  )

  fwa_function("fwa_indexpoint",
               parameters = parameters,
               limit = limit,
               bbox = bbox,
               properties = properties,
               transform = transform,
               epsg = epsg
  )
}


#' Freshwater Atlas Locate Along
#'
#' Gets the point on a stream corresponding to the river metre
#' (downstream route measure).
#'
#' @inherit internal
#' @family functions
#' @seealso [API documentation](https://www.hillcrestgeo.ca/fwapg/functions/fwa_locatealong.html)
#' @export
#' @examples
#' fwa_locate_along(356308001, downstream_route_measure = 10000)
fwa_locate_along <- function(blue_line_key,
                             downstream_route_measure = 0,
                             bbox = NULL,
                             properties = NULL,
                             transform = NULL,
                             epsg = 4326) {
  chk_whole_number(blue_line_key)
  chk_gt(blue_line_key)
  chk_number(downstream_route_measure)
  chk_gte(downstream_route_measure)

  parameters <- list(
    blue_line_key = blue_line_key,
    downstream_route_measure = downstream_route_measure
  )

  fwa_function("fwa_locatealong",
               parameters = parameters,
               limit = 1,
               bbox = bbox,
               properties = properties,
               transform = transform,
               epsg = epsg
  )
}

#' Freshwater Atlas Locate Along Interval
#'
#' Gets a regularly spaced set of points between two river metres.
#'
#' @inherit internal
#' @family functions
#' @seealso [API documentation](https://www.hillcrestgeo.ca/fwapg/functions/fwa_locatealonginterval.html)
#' @export
#' @examples
#' fwa_locate_along_interval(356308001, interval_length = 10, start_measure = 0)
fwa_locate_along_interval <- function(blue_line_key,
                                      interval_length = 100,
                                      start_measure = 0,
                                      end_measure = NULL,
                                      limit = 100,
                                      offset = 0,
                                      bbox = NULL,
                                      properties = NULL,
                                      transform = NULL,
                                      epsg = 4326) {
  chk_whole_number(blue_line_key)
  chk_gt(blue_line_key)
  chk_whole_number(interval_length)
  chk_gt(interval_length)
  chk_whole_number(start_measure)
  chk_gte(start_measure)
  chk_null_or(end_measure, vld = vld_whole_number)
  if (!is.null(end_measure)) chk_gt(end_measure, start_measure)

  if (!is.null(end_measure)) {
    lim <- ceiling((end_measure - start_measure) / interval_length)
    if (lim > limit + offset) {
      chk::abort_chk("`limit + offset` must be greater than ",
                     "(`end_measure` - `start_measure`) / `interval_length` (",
                     lim, ") not ", limit + offset, ".")
    }
  }

  parameters <- list(
    blue_line_key = blue_line_key,
    start_measure = start_measure,
    interval_length = interval_length,
    end_measure = end_measure
  )

  fwa_function("fwa_locatealonginterval",
               parameters = parameters,
               limit = limit,
               offset = offset,
               bbox = bbox,
               properties = properties,
               transform = transform,
               epsg = epsg
  )
}

#' Freshwater Atlas Watershed at Downstream Route Measure
#'
#' Gets a polygon of the watershed at a specified river metre.
#'
#' The function selects and aggregate all the fundamental watershed polygons
#' upstream of the fundamental watershed in which the point lies.
#'
#' Depending on where the point is in the fundamental watershed one of four
#' things can happen to the fundamental watershed.
#'
#' 1. If the point is < 50 m upstream from the bottom of the fundamental
#' watershed then the fundamental watershed is included in the aggregation
#' (recorded as KEEP in the refine_method property).
#'
#' 2. Else if the point is < 100m downstream from the top of the fundamental
#' watershed then the fundamental watershed is not included in the aggregation
#' (recorded as DROP in the refine_method property).
#'
#' 3. Else if the point is on a polygonal river/canal the fundamental watershed
#' is cut across the banks of the river before being included in the aggregation
#' (recorded as CUT in the refine_method property).
#'
#' 4. Otherwise something else happens (recorded as DEM in the refine_method
#' property).
#'
#' @inherit internal
#' @family functions
#' @seealso [API documentation](https://www.hillcrestgeo.ca/fwapg/functions/fwa_watershedatmeasure.html)
#'
#' @export
#' @examples
#' fwa_watershed_at_measure(356308001, downstream_route_measure = 10000)
fwa_watershed_at_measure <- function(blue_line_key,
                                     downstream_route_measure = 0,
                                     bbox = NULL,
                                     properties = NULL,
                                     transform = NULL,
                                     epsg = 4326) {
  chk_whole_number(blue_line_key)
  chk_gt(blue_line_key)
  chk_number(downstream_route_measure)
  chk_gte(downstream_route_measure)

  parameters <- list(
    blue_line_key = blue_line_key,
    downstream_route_measure = downstream_route_measure
  )

  fwa_function("fwa_watershedatmeasure",
               parameters = parameters,
               limit = 1,
               bbox = bbox,
               properties = properties,
               transform = transform,
               epsg = epsg
  )
}

#' Freshwater Atlas Watershed Stream
#'
#' Gets the upstream stream segment within the fundamental watershed.
#'
#' This is useful for adding stream network that was not included in the
#' watershed at measure.
#'
#' @inherit internal
#' @family functions
#' @seealso [API documentation](https://www.hillcrestgeo.ca/fwapg/functions/fwa_watershedstream.html)
#' @export
#' @examples
#' fwa_watershed_stream(356308001, downstream_route_measure = 10000)
fwa_watershed_stream <- function(blue_line_key,
                                 downstream_route_measure = 0,
                                 bbox = NULL,
                                 properties = NULL,
                                 transform = NULL,
                                 epsg = 4326) {
  chk_whole_number(blue_line_key)
  chk_gt(blue_line_key)
  chk_number(downstream_route_measure)
  chk_gte(downstream_route_measure)

  parameters <- list(
    blue_line_key = blue_line_key,
    downstream_route_measure = downstream_route_measure
  )

  fwa_function("fwa_watershedstream",
               parameters = parameters,
               bbox = bbox,
               properties = properties,
               transform = transform,
               epsg = epsg
  )
}

#' Freshwater Atlas Watershed Hex
#'
#' Gets a 25m hexagon grid covering the fundamental watershed in which the river metre lies.
#'
#' @inherit internal
#' @family functions
#' @seealso [API documentation](https://www.hillcrestgeo.ca/fwapg/functions/fwa_watershedhex.html)
#' @export
#' @examples
#' \dontrun{
#' fwa_watershed_hex(356308001, downstream_route_measure = 10000)
#' }
fwa_watershed_hex <- function(blue_line_key,
                              downstream_route_measure = 0,
                              limit = 100,
                              offset = 0,
                              bbox = NULL,
                              properties = NULL,
                              transform = NULL,
                              epsg = 4326) {
  chk_whole_number(blue_line_key)
  chk_gt(blue_line_key)
  chk_number(downstream_route_measure)
  chk_gte(downstream_route_measure)

  parameters <- list(
    blue_line_key = blue_line_key,
    downstream_route_measure = downstream_route_measure
  )

  fwa_function("fwa_watershedhex",
               parameters = parameters,
               limit = limit,
               offset = offset,
               bbox = bbox,
               properties = properties,
               transform = transform,
               epsg = epsg
  )
}
