#' BBox
#'
#' Get bounding box of feature(s)
#'
#' @inheritParams fwa_feature
#' @return A sf object
#' @export
#' @examples
#' fwa_bbox("fwa_stream_networks_sp", filter = "gnis_name = 'Cowichan River'")
fwa_bbox <- function(table, filter = NULL, geom_column = "geom",
                     epsg = 4326, schema = "whse_basemapping"){
  chk_string(table)
  chkor(chk_string(filter), chk_null(filter))
  chk_string(geom_column)
  chk_whole_number(epsg)
  chk_string(schema)

  table <- add_schema(table, schema)

  path <- glue("fwa/v1/bbox/{table}")
  query <- list(filter = filter,
                geom_column = geom_column)
  resp <- fwa_api(path, query)
  parse_bbox(resp)
}

