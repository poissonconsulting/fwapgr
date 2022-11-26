#' Hydroshed
#'
#' Gets aggregated boundary of all [hydroshed](https://www.hydrosheds.org)
#' polygons upstream of the provided location.
#'
#' @inherit internal
#' @family functions
#' @seealso [API documentation](https://features.hillcrestgeo.ca/fwa/functions/hydroshed.html)
#'
#' @export
#' @examples
#' hydroshed(x = -132.26, y = 53.36)
hydroshed <- function(x, y,
                      srid = 4326,
                      bbox = NULL,
                      properties = NULL,
                      transform = NULL,
                      epsg = 4326,
                      nocache = getOption("fwa.nocache", TRUE)) {
  chk_number(x)
  chk_number(y)
  chk_whole_number(srid)
  chk_gt(srid)
  chk_whole_number(epsg)
  chk_gt(epsg)
  chk_flag(nocache)

  parameters <- list(
    x = x,
    y = y,
    srid = srid
  )

  base_url <- api_url()
  path <- "fwa"
  user <- gh_user()

  x <- pgfeatureserv::pgf_function_result(
    "hydroshed",
    base_url = base_url,
    path = path,
    user = user,
    parameters = parameters,
    limit = 1,
    bbox = bbox,
    properties = properties,
    transform = transform,
    nocache = nocache_conversion(nocache)
  )

  sf::st_transform(x, epsg)
}
