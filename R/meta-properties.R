#' FWA Property Metadata
#'
#' Get information about the column names of a collection.
#'
#' @inherit internal
#' @return A tibble.
#' @family metadata
#' @export
#' @examples
#' fwa_meta_properties("whse_basemapping.fwa_stream_networks_sp")
fwa_meta_properties <- function(collection_id) {
  path <- glue("fwapg/collections/{collection_id}")
  query <- list(a = NULL)

  resp <- fwa_api(path, query)

  df <- jsonlite::fromJSON(resp)$properties
  tibble::as_tibble(df)
}
