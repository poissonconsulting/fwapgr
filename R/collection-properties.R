#' Freshwater Atlas Collection's Properties
#'
#' Get information about a collection's column names.
#'
#' @inherit internal
#' @return A tibble.
#' @family collections
#' @export
#' @examples
#' fwa_collection_properties("whse_basemapping.fwa_stream_networks_sp")
fwa_collection_properties <- function(
    collection_id, nocache = getOption("fwa.nocache", FALSE)) {
  chk_flag(nocache)
  pgfeatureserv::pgf_collection_properties(
    collection_id = collection_id,
    base_url = api_url(),
    path = "fwa",
    nocache = nocache_conversion(nocache)
  )
}
