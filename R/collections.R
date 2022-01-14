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
  df <- pgfsr::pgf_collections(
    base_url = api_url(),
    path = "fwa"
  )
  df$collection_id <- df$id
  df <- df[c("collection_id", "description", "extent", "links")]
  tibble::as_tibble(df)
}
