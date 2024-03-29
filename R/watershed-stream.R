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
                                 epsg = 4326,
                                 nocache = getOption("fwa.nocache", FALSE)) {
  chk_whole_number(blue_line_key)
  chk_gt(blue_line_key)
  chk_number(downstream_route_measure)
  chk_gte(downstream_route_measure)
  chk_whole_number(epsg)
  chk_gt(epsg)
  chk_flag(nocache)

  parameters <- list(
    blue_line_key = blue_line_key,
    downstream_route_measure = downstream_route_measure
  )

  base_url <- api_url()
  path <- api_path()
  user <- gh_user()

  x <- pgfeatureserv::pgf_function_result(
    "fwa_watershedstream",
    base_url = base_url,
    path = path,
    user = user,
    parameters = parameters,
    bbox = bbox,
    properties = properties,
    transform = transform,
    nocache = nocache_conversion(nocache)
  )

  sf::st_transform(x, epsg) |>
    any_to_int()
}
