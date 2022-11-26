#' Freshwater Atlas Collections Metadata

#' @describeIn fwa_collection_properties Freshwater Atlas Collection's Properties
#'
#' \lifecycle{soft-deprecated}
#'
#' @export
fwa_meta_properties <- function(collection_id, nocache = getOption("fwa.nocache", TRUE)) {
  lifecycle::deprecate_soft(" 0.1.1", "fwa_meta_properties()", "fwa_collection_properties()")
  fwa_collection_properties(collection_id, nocache = nocache)
}
