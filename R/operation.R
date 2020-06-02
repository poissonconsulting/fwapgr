#' BBox
#'
#' Get bounding box of feature(s)
#'
#' @inheritParams fwa_watershed
#' @param geom_column A character string of the geometry column name.
#' @param filter A character string of the SQL WHERE statment to filter features.
#' @param table A character string of the table name.
#' @return A sf object
#' @export
#' @examples
#' fwa_bbox("fwa_stream_networks_sp", filter = "gnis_name = 'Cowichan River'")
fwa_bbox <- function(table, filter = NULL, srid = 4326, geom_column = "geom"){
  chk_string(table)
  chkor(chk_string(filter), chk_null(filter))
  chk_whole_number(srid)
  chk_string(geom_column)

  table <- glue("whse_basemapping.", table)

  path <- glue("fwa/v1/bbox/{table}")
  query <- list(filter = filter,
                geom_column = geom_column,
                srid = srid)
  resp <- fwa_api(path, query)
  read_feature(resp, srid)
}

