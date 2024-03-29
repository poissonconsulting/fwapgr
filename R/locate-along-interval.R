#' Freshwater Atlas Locate Along Interval
#'
#' Gets a regularly spaced set of points between two river metres.
#'
#' @inherit internal
#' @family functions
#' @seealso [API documentation](https://features.hillcrestgeo.ca/fwa/functions/fwa_locatealonginterval.html)
#' @export
#' @examples
#' fwa_locate_along_interval(356308001, interval_length = 10, start_measure = 0)
fwa_locate_along_interval <- function(
    blue_line_key,
    interval_length = 100,
    start_measure = 0,
    end_measure = NULL,
    bbox = NULL,
    properties = NULL,
    transform = NULL,
    epsg = 4326,
    nocache = getOption("fwa.nocache", FALSE)) {
  chk_whole_number(blue_line_key)
  chk_gt(blue_line_key)
  chk_whole_number(interval_length)
  chk_gt(interval_length)
  chk_whole_number(start_measure)
  chk_gte(start_measure)
  chk_null_or(end_measure, vld = vld_whole_number)
  chk_whole_number(epsg)
  chk_gt(epsg)
  chk_flag(nocache)

  if (!is.null(end_measure)) chk_gt(end_measure, start_measure)

  if (!is.null(end_measure)) {
    lim <- ceiling((end_measure - start_measure) / interval_length)
    if (lim > 10000) {
      chk::abort_chk(
        "`limit` must be greater than ",
        "(`end_measure` - `start_measure`) / `interval_length` (",
        lim, ") not ", 10000L, "."
      )
    }
  }

  parameters <- list(
    blue_line_key = blue_line_key,
    start_measure = start_measure,
    interval_length = interval_length,
    end_measure = end_measure
  )

  base_url <- api_url()
  path <- api_path()
  user <- gh_user()

  x <- pgfeatureserv::pgf_function_result(
    "fwa_locatealonginterval",
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
    dplyr::mutate(dplyr::across(tidyselect::all_of(c("downstream_route_measure", "index")), as.integer))
}
