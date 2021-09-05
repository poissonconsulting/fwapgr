#' Freshwater Atlas Collections
#'
#' Get information about the collections.
#'
#' @return A tibble.
#' @family collections
#' @export
#' @examples
#' fwa_collections()
fwa_collections <- function() {
  path <- "fwapg/collections"
  query <- list(a = NULL)

  resp <- fwa_api(path, query)

  df <- jsonlite::fromJSON(resp)$collections
  df$collection_id <- df$id
  df <- df[c("collection_id", "description", "extent", "links")]
  tibble::as_tibble(df)
}
