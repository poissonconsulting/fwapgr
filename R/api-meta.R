#' FWA list layers
#'
#' List available layers.
#'
#' @return A tibble
#' @export
#' @examples
#' fwa_list_layers()
fwa_list_layers <- function(){

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
#' @return A tibble
#' @param table A character string of the table name.
#' @export
#' @examples
#' fwa_list_columns("fwa_stream_networks_sp")
fwa_list_columns <- function(table){

  path <- glue("fwa/v1/list_columns/{table}")
  query <- list(a = NULL)

  resp <- fwa_api(path, query)

  df <- jsonlite::fromJSON(resp)
  tibble::as_tibble(df)
}

#' FWA list named streams
#'
#' List information on named streams including gnis_name.
#'
#' @return A tibble
#' @param gnis_name A regular expression to filter table by gnis_name. If Null (default), returns all rows.
#' @param ignore_case A flag indicating whether to ignore case in regular expression.
#' @export
#' @examples
#' fwa_list_gnis_streams()
fwa_list_gnis_streams <- function(gnis_name = NULL, ignore_case = TRUE){
  if(is.null(gnis_name))
    return(gnis_stream)

  i <- grep(gnis_name, gnis_stream$gnis_name, ignore.case = ignore_case)
  gnis_stream[i,]
}

#' FWA search named streams
#'
#' Match valid stream gnis_name with regular expression.
#'
#' @return A tibble
#' @param gnis_name A regular expression to match gnis_name. If Null (default), returns all values.
#' @param ignore_case A flag indicating whether to ignore case in regular expression.
#' @export
#' @examples
#' fwa_search_gnis_streams("sangan")
fwa_search_gnis_streams <- function(gnis_name = NULL, ignore_case = TRUE){
  x <- unique(as.character(gnis_stream$gnis_name))
  if(is.null(gnis_name))
    return(x)

  i <- grep(gnis_name, x, ignore.case = ignore_case)
  x[i]
}
