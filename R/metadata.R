#' FWA collections metadata
#'
#' Provide collection metadata.
#'
#' @return A tibble
#' @export
#' @examples
#' \dontrun{fwa_meta_collections()}
fwa_meta_collections <- function(){

  path <- "fwapg/collections"
  query <- list(a = NULL)

  resp <- fwa_api(path, query)

  df <- jsonlite::fromJSON(resp)$collections
  df$collection_id <- df$id
  df <- df[c("collection_id", "description", "extent", "links")]
  tibble::as_tibble(df)
}

#' FWA property metadata
#'
#' Provide column names of collection.
#'
#' @return A tibble
#' @inheritParams fwa_collection
#' @export
#' @examples
#' \dontrun{fwa_meta_properties("whse_basemapping.fwa_stream_networks_sp")}
fwa_meta_properties <- function(collection_id){

  path <- glue("fwapg/collections/{collection_id}")
  query <- list(a = NULL)

  resp <- fwa_api(path, query)

  df <- jsonlite::fromJSON(resp)$properties
  tibble::as_tibble(df)
}
