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
fwa_collection_properties <- function(collection_id) {
  path <- glue("fwapg/collections/{collection_id}")
  query <- list(a = NULL)

  resp <- fwa_api(path, query)

  df <- jsonlite::fromJSON(resp)$properties
  tibble::as_tibble(df)
}