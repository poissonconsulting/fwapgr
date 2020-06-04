#' FWA feature
#'
#' Get features from table.
#'
#' @inheritParams fwa_feature
#' @param gnis_name A character string of the gnis_name.
#' @return A sf object
#' @export
#' @examples
#' fwa_gnis_stream_network('Sangan River')
fwa_gnis_stream_network <- function(gnis_name, columns = NULL,
                        bounds = NULL, geom_column = "geom",
                        epsg = 4326){

  chk_string(gnis_name)
  table <- "fwa_stream_networks_sp"
  filter <- filter_gnis(gnis_name)

  fwa_feature(table = table, filter = filter, columns = columns,
              bounds = bounds, geom_column = geom_column,
              epsg = epsg)
}
