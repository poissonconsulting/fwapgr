#' FWA Index Point
#'
#' Gets the nearest point on a stream to the coordinates within the tolerance.
#'
#' To return the first and second closest points on streams within the tolerance
#' increase limit to 2.
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
  chk_number(tolerance)
  chk_gt(tolerance)
  chk_whole_number(limit)
  chk_gt(limit)
  chk_whole_number(srid)
  chk_gt(srid)

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

#' FWA Watershed at Downstream Route Measure
#'
#' Gets a polygon of the watershed at a specified river metre.
#'
#' @inherit internal
#' @family functions
#' @seealso [API documentation](https://www.hillcrestgeo.ca/fwapg/functions/fwa_watershedatmeasure.html)
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

#' FWA watershed stream
#'
#' Provided a location as blue_line_key and downstream_route_measure, return stream segments upstream, within the same first order watershed.
#'
#' @inherit internal
#' @family functions
#' @seealso [API documentation](https://www.hillcrestgeo.ca/fwapg/functions/fwa_watershedstream.html)
#' @export
#' @examples
#' \dontrun{
#' fwa_watershed_stream(356308001, downstream_route_measure = 10000)
#' }
fwa_watershed_stream <- function(blue_line_key,
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

  fwa_function("fwa_watershedstream",
    parameters = parameters,
    limit = limit,
    offset = offset,
    bbox = bbox,
    properties = properties,
    transform = transform,
    epsg = epsg
  )
}

#' FWA watershed hex
#'
#' Provided a location as blue_line_key and downstream_route_measure, return a 25m hexagon grid covering first order watershed in which location lies.
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

#' FWA locate along
#'
#' Provided a location as blue_line_key and downstream_route_measure, return a point.
#'
#' @inherit internal
#' @family functions
#' @seealso [API documentation](https://www.hillcrestgeo.ca/fwapg/functions/fwa_locatealong.html)
#' @export
#' @examples
#' \dontrun{
#' fwa_locate_along(356308001, downstream_route_measure = 10000)
#' }
fwa_locate_along <- function(blue_line_key,
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

  fwa_function("fwa_locatealong",
    parameters = parameters,
    limit = limit,
    offset = offset,
    bbox = bbox,
    properties = properties,
    transform = transform,
    epsg = epsg
  )
}

#' FWA locate along interval
#'
#' Provided a blue_line_key and starting downstream distance, return a set of points along an interval.
#'
#' @inherit internal
#' @family functions
#' @seealso [API documentation](https://www.hillcrestgeo.ca/fwapg/functions/fwa_locatealonginterval.html)
#' @export
#' @examples
#' \dontrun{
#' fwa_locate_along_interval(356308001, interval_length = 10, start_measure = 0)
#' }
fwa_locate_along_interval <- function(blue_line_key,
                                      interval_length = 1000,
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

  if (!is.null(end_measure) && !is.null(limit)) {
    lim <- (end_measure - start_measure) / interval_length
    if (lim > limit) {
      chk::abort_chk("`limit` must be greater than (`end_measure` - `start_measure`) / `interval_length` (", lim, ") not ", limit, ".")
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
