#' FWA Collections Metadata
#'
#' Get information about the collections.
#'
#' Deprecated for `fwa_collections()`.
#'
#' @return A tibble.
#' @family collections
#' @export
#' @examples
#' fwa_meta_collections()
fwa_meta_collections <- function() {
  lifecycle::deprecate_soft(" 0.1.1", "fwa_meta_collections()", "fwa_collections()")
  fwa_collections()
}
