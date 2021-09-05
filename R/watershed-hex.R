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
                              limit = 10000,
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
               bbox = bbox,
               properties = properties,
               transform = transform,
               epsg = epsg
  )
}
