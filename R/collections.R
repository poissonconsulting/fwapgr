#' Freshwater Atlas Collections
#'
#' Get information about the collections.
#'
#' @inherit internal
#' @return A tibble.
#' @family collections
#' @export
#' @examples
#' fwa_collections()
fwa_collections <- function(nocache = getOption("fwa.nocache", TRUE)) {
  chk_flag(nocache)
  df <- pgfeatureserv::pgf_collections(
    base_url = api_url(),
    path = "fwa",
    nocache = nocache_conversion(nocache)
  )
  df$collection_id <- df$id
  df <- df[c("collection_id", "description", "extent", "links")]
  df
}
