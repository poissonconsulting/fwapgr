#' Freshwater Atlas Network Trace
#'
#' Returns the stream network path between the provided locations
#'
#' @inherit internal
#' @family functions
#' @seealso [API documentation](https://features.hillcrestgeo.ca/fwa/functions/fwa_networktrace.html)
#' @export
#' @examples
#' fwa_network_trace(356308001, downstream_route_measure = 10000)
fwa_network_trace <- function(blue_line_key_a,
                              measure_a = 0,
                              blue_line_key_b,
                              measure_b = 0,
                              tolerance = 1,
                              aggregate_path = TRUE,
                              epsg = 4326) {
  chk_whole_number(blue_line_key_a)
  chk_whole_number(blue_line_key_b)
  chk_gt(blue_line_key_a)
  chk_gt(blue_line_key_b)
  chk_number(measure_a)
  chk_number(measure_b)
  chk_gte(measure_a)
  chk_gte(measure_b)
  chk_number(tolerance)
  chk_gt(tolerance)
  chk_flag(aggregate_path)
  chk_whole_number(epsg)
  chk_gt(epsg)

  parameters <- list(
    blue_line_key_a = blue_line_key_a,
    blue_line_key_b = blue_line_key_b,
    measure_a = measure_a,
    measure_b = measure_b,
    tolerance = tolerance,
    aggregate_path = aggregate_path
  )

  base_url <- api_url()
  path <- api_path()
  user <- gh_user()

  x <- pgfeatureserv::pgf_function_result(
    "fwa_networktrace",
    base_url = base_url,
    path = path,
    user = user,
    parameters = parameters,
    # bbox = bbox,
    # properties = properties,
    # transform = transform,
    # nocache = nocache_conversion(nocache)
  )

  sf::st_transform(x, epsg)
}
