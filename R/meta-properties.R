#' FWA Property Metadata
#'
#' Get information about the column names of a collection.
#'
#' Soft_deprecated for [`fwa_collections_properties()`]
#'
#' @inherit internal
#' @return A tibble.
#' @family metadata
#' @export
#' @examples
#' fwa_meta_properties("whse_basemapping.fwa_stream_networks_sp")
fwa_meta_properties <- function(collection_id) {
  lifecycle::deprecate_soft(" 0.1.1", "fwa_meta_properties()", "fwa_collections_properties()")
  fwa_collections_properties(collection_id)
}
