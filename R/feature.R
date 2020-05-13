#' FWA watershed
#'
#' Get watershed upstream of a location on a stream.
#'
#' @param blue_line_key An integer of the blue line key of the stream for which to generate the watershed.
#' @param srid An integer of the SRID for the returned watershed. The default is 4326 WGS84 Lat/Lng.
#' @param downstream_route_measure An integer of the downstream route measure at the watershed terminus / pour point.
#' @return A sf object
#' @export
#' @examples
#' fwa_watershed(356308001)
fwa_watershed <- function(blue_line_key, downstream_route_measure = 0, srid = 4326){
  chk_whole_number(blue_line_key)
  chk_whole_number(downstream_route_measure)
  chk_whole_number(srid)

  path <- glue("fwa/v1/watershed/{blue_line_key}")
  query <- list(downstream_route_measure = downstream_route_measure,
                srid = srid)
  resp <- fwa_api(path, query)
  suppressWarnings(sf::st_read(resp, crs = srid, quiet = TRUE))
}
