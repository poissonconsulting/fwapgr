#' Freshwater Atlas Index Point
#'
#' Gets the nearest point on a stream as the crow flies to the coordinates (within the tolerance).
#'
#' To also return the second nearest point on a stream as the crow flies (within the tolerance)
#' set `limit = 2`.
#'
#' @inherit internal
#' @family functions
#' @seealso [API documentation](https://www.hillcrestgeo.ca/fwapg/functions/fwa_indexpoint.html)
#' @export
#' @examples
#' fwa_index_point(x = -132.26, y = 53.36)
fwa_index_point <- function(x, y, srid = 4326,
                            tolerance = 5000,
                            limit = 1,
                            bbox = NULL,
                            properties = NULL,
                            transform = NULL,
                            epsg = 4326) {
  chk_number(x)
  chk_number(y)
  chk_whole_number(srid)
  chk_gt(srid)
  chk_number(tolerance)
  chk_gt(tolerance)
  chk_whole_number(limit)
  chk_gt(limit)

  parameters <- list(
    x = x,
    y = y,
    srid = srid,
    tolerance = tolerance,
    num_features = limit
  )

  fwa_function("fwa_indexpoint",
               parameters = parameters,
               limit = limit,
               bbox = bbox,
               properties = properties,
               transform = transform,
               epsg = epsg
  )
}
