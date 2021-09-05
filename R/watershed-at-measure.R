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