#' Hydroshed
#'
#' Gets aggregated boundary of all [hydroshed](https://www.hydrosheds.org)
#' polygons upstream of the provided location.
#'
#' @inherit internal
#' @family functions
#' @seealso [API documentation](https://www.hillcrestgeo.ca/fwapg/functions/hydroshed.html)
#'
#' @export
#' @examples
#' hydroshed(x = -132.26, y = 53.36)
hydroshed <- function(x, y,
                          srid = 4326,
                          bbox = NULL,
                          properties = NULL,
                          transform = NULL,
                          epsg = 4326) {
  chk_number(x)
  chk_number(y)
  chk_whole_number(srid)
  chk_gt(srid)

  parameters <- list(
    x = x,
    y = y,
    srid = srid
  )

  fwa_function("hydroshed",
               parameters = parameters,
               limit = 1,
               bbox = bbox,
               properties = properties,
               transform = transform,
               epsg = epsg
  )
}
