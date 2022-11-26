#' @describeIn fwa_query_collection Query Freshwater Atlas Collection
#'
#' \lifecycle{soft-deprecated}
#'
#' @export
fwa_collection <- function(collection_id,
                           filter = NULL,
                           limit = 10000,
                           bbox = NULL,
                           properties = NULL,
                           transform = NULL,
                           epsg = 4326,
                           nocache = getOption("fwa.nocache", TRUE)) {
  lifecycle::deprecate_soft("0.1.1", "fwa_collection()", "fwa_query_collection()")
  fwa_query_collection(collection_id,
    filter = filter, limit = limit,
    bbox = bbox,
    properties = properties, transform = transform,
    epsg = epsg, nocache = nocache
  )
}
