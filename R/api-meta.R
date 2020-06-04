#' FWA list layers
#'
#' List available layers.
#'
#' @return A data.frame
#' @export
#' @examples
#' fwa_lookup_layers()
fwa_lookup_layers <- function(){

  path <- glue("fwa/v1/list_layers")
  query <- list(a = NULL)

  resp <- fwa_api(path, query)

  df <- jsonlite::fromJSON(resp)
  tibble::as_tibble(df)
}

#' FWA list columns
#'
#' List columns in a table.
#'
#' @return A data.frame
#' @param table A character string of the table name.
#' @export
#' @examples
#' fwa_lookup_columns("fwa_stream_networks_sp")
fwa_lookup_columns <- function(table){

  path <- glue("fwa/v1/list_columns/{table}")
  query <- list(a = NULL)

  resp <- fwa_api(path, query)

  df <- jsonlite::fromJSON(resp)
  tibble::as_tibble(df)
}
