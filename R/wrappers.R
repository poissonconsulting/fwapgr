#' FWA stream network
#'
#' Get stream network features from gnis_name.
#'
#' @inheritParams fwa_feature
#' @param gnis_name A character string of the gnis_name.
#' @param named_streams A flag indicating whether to get data from the 'fwa_named_streams' layer.
#'  If FALSE, the 'fwa_stream_networks_sp' layer is used.
#' @return A sf object
#' @export
#' @examples
#' fwa_gnis_streams('Sangan River')
fwa_gnis_streams <- function(gnis_name, columns = NULL,
                                     bounds = NULL, geom_column = "geom",
                                     epsg = 4326, named_streams = FALSE){

  chk_string(gnis_name)
  table <- "fwa_stream_networks_sp"
  if(named_streams)
    table <- "fwa_named_streams"
  filter <- filter_gnis(gnis_name)

  fwa_feature(table = table, filter = filter, columns = columns,
              bounds = bounds, geom_column = geom_column,
              epsg = epsg)
}

