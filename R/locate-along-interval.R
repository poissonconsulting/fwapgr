#' Freshwater Atlas Locate Along Interval
#'
#' Gets a regularly spaced set of points between two river metres.
#'
#' @inherit internal
#' @family functions
#' @seealso [API documentation](https://www.hillcrestgeo.ca/fwapg/functions/fwa_locatealonginterval.html)
#' @export
#' @examples
#' fwa_locate_along_interval(356308001, interval_length = 10, start_measure = 0)
fwa_locate_along_interval <- function(blue_line_key,
                                      interval_length = 100,
                                      start_measure = 0,
                                      end_measure = NULL,
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

  if (!is.null(end_measure)) {
    lim <- ceiling((end_measure - start_measure) / interval_length)
    if (lim > 10000) {
      chk::abort_chk("`limit` must be greater than ",
                     "(`end_measure` - `start_measure`) / `interval_length` (",
                     lim, ") not ", 10000L, ".")
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
               limit = 10000L,
               bbox = bbox,
               properties = properties,
               transform = transform,
               epsg = epsg
  )
}
