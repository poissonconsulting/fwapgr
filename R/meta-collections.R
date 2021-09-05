#' Freshwater Atlas Collections Metadata

#' @describeIn fwa_collections Freshwater Atlas Collections
#'
#' \lifecycle{soft-deprecated}
#'
#' @export
fwa_meta_collections <- function() {
  lifecycle::deprecate_soft(" 0.1.1", "fwa_meta_collections()", "fwa_collections()")
  fwa_collections()
}
