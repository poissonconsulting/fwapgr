#' FWA list tables
#'
#' List available tables in data collections.
#'
#' @return A tibble
#' @export
#' @examples
#' \dontrun{fwa_list_tables()}
fwa_list_tables <- function(){

  path <- "fwapg/collections"
  query <- list(a = NULL)

  resp <- fwa_api(path, query)

  df <- jsonlite::fromJSON(resp)$collections
  df$table <- sapply(strsplit(df$id, "\\."), function(x) x[2])
  df$schema <- sapply(strsplit(df$id, "\\."), function(x) x[1])
  df$collection_id <- df$id
  df <- df[c("table", "schema", "collection_id", "extent")]
  tibble::as_tibble(df)
}

#' FWA list columns
#'
#' List columns in a table.
#'
#' @return A tibble
#' @inheritParams fwa_collection
#' @export
#' @examples
#' \dontrun{fwa_list_columns("fwa_stream_networks_sp")}
fwa_list_columns <- function(table, schema = "whse_basemapping"){

  collection <- add_schema(table, schema)
  path <- glue("fwapg/collections/{collection}")
  query <- list(a = NULL)

  resp <- fwa_api(path, query)

  df <- jsonlite::fromJSON(resp)$properties
  tibble::as_tibble(df)
}
