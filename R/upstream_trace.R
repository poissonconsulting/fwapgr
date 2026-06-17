#' Freshwater Atlas Upstream Trace
#'
#' Returns the stream network upstream of the provided location
#'
#' @inherit internal
#' @family functions
#' @seealso [API documentation](https://features.hillcrestgeo.ca/fwa/functions/fwa_upstreamtrace.html)
#' @export
#' @examples
#' fwa_upstream_trace(356308001, 10000)
fwa_upstream_trace <- function(start_blue_line_key,
                              start_measure = 0,
                              tolerance = 1,
                              bbox = NULL,
                              properties = NULL,
                              transform = NULL,
                              epsg = 4326,
                              nocache = getOption("fwa.nocache", FALSE)) {
  chk_whole_number(start_blue_line_key)
  chk_gt(start_blue_line_key)
  chk_number(start_measure)
  chk_gte(start_measure)
  chk_number(tolerance)
  chk_gt(tolerance)
  chk_whole_number(epsg)
  chk_gt(epsg)

  parameters <- list(
    start_blue_line_key = start_blue_line_key,
    start_measure = start_measure,
    tolerance = tolerance
  )

  base_url <- api_url()
  path <- api_path()
  user <- gh_user()

  x <- pgfeatureserv::pgf_function_result(
    "fwa_upstreamtrace",
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
