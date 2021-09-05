#' @describeIn fwa_query_collection Query Freshwater Atlas Collection
#'
#' \lifecycle{soft-deprecated}
#'
#' @export
fwa_collection <- function(collection_id,
                           filter = NULL,
                           limit = 100,
                           offset = 0,
                           bbox = NULL,
                           properties = NULL,
                           transform = NULL,
                           epsg = 4326) {

  fwa_query_collection(collection_id,
                       filter = filter, limit = limit,
                       offset = offset, bbox = bbox,
                       properties = properties, transform = transform,
                       epsg = epsg)
}
