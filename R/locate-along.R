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
