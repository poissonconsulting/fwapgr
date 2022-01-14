#' Freshwater Atlas Watershed Stream
#'
#' Gets the upstream stream segment within the fundamental watershed.
#'
#' This is useful for adding stream network that was not included in the
#' watershed at measure.
#'
#' @inherit internal
#' @family functions
#' @seealso [API documentation](https://features.hillcrestgeo.ca/fwa/functions/fwa_watershedstream.html)
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
  chk_whole_number(epsg)
  chk_gt(epsg)

  parameters <- list(
    blue_line_key = blue_line_key,
    downstream_route_measure = downstream_route_measure
  )

  base_url <- api_url()
  path <- "fwa"
  user <- gh_user()

  x <- pgfsr::pgf_function_result(
    "fwa_watershedstream",
    base_url = base_url,
    path = path,
    user = user,
    parameters = parameters,
    bbox = bbox,
    properties = properties,
    transform = transform
  )

  sf::st_transform(x, epsg)
}
