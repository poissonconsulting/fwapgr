#' Freshwater Atlas Network Trace Aggregated
#'
#' Returns the stream network path between the provided locations
#'
#' @inherit internal
#' @family functions
#' @seealso [API documentation](https://features.hillcrestgeo.ca/fwa/functions/fwa_networktraceagg.html)
#' @export
#' @examples
#' fwa_network_trace_agg(356308001, measure_a = 10000, 356308001, measure_b = 10010)
fwa_network_trace_agg <- function(blue_line_key_a,
                              measure_a = 0,
                              blue_line_key_b,
                              measure_b = 0,
                              tolerance = 1,
                              bbox = NULL,
                              properties = NULL,
                              transform = NULL,
                              epsg = 4326,
                              nocache = getOption("fwa.nocache", FALSE)) {
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
  chk_whole_number(epsg)
  chk_gt(epsg)

  parameters <- list(
    blue_line_key_a = blue_line_key_a,
    blue_line_key_b = blue_line_key_b,
    measure_a = measure_a,
    measure_b = measure_b,
    tolerance = tolerance
  )

  base_url <- api_url()
  path <- api_path()
  user <- gh_user()

  x <- pgfeatureserv::pgf_function_result(
    "fwa_networktraceagg",
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
