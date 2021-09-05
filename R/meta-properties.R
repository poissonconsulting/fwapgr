#' Freshwater Atlas Collections Metadata

#' @describeIn fwa_collections_properties Freshwater Atlas Collection's Properties
#'
#' \lifecycle{soft-deprecated}
#'
#' @export
fwa_meta_properties <- function(collection_id) {
  lifecycle::deprecate_soft(" 0.1.1", "fwa_meta_properties()", "fwa_collections_properties()")
  fwa_collections_properties(collection_id)
}
