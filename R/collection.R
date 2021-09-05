#' FWA collection
#'
#' Get and filter collection from database.
#'
#' @inherit internal
#' @seealso [API documentation](https://www.hillcrestgeo.ca/fwapg/collections.html).
#' @export
#' @examples
#' collection_id <- "whse_basemapping.fwa_stream_networks_sp"
#' fwa_collection(collection_id, filter = list(gnis_name = "Sangan River"))
fwa_collection <- function(collection_id,
                           filter = NULL,
                           limit = 100,
                           offset = 0,
                           bbox = NULL,
                           properties = NULL,
                           transform = NULL,
                           epsg = 4326) {
  chk_string(collection_id)
  chk_null_or(filter, vld = vld_filter)
  chk_whole_number(limit)
  chk_gt(limit)
  chk_lte(limit, 10000L)
  chk_whole_number(offset)
  chk_gte(offset)
  chk_lt(offset, 100000L)
  chk_null_or(bbox, vld = vld_numeric)
  chk_null_or(properties, vld = vld_character)
  chk_whole_number(epsg)
  chk_gt(epsg)

  properties <- format_parameter(properties)
  bbox <- format_parameter(bbox)
  transform <- format_parameter(transform)

  path <- glue("fwapg/collections/{collection_id}/items.json")

  query <- c(
    filter,
    list(
      limit = limit,
      offset = offset,
      bbox = bbox,
      properties = properties,
      transform = transform
    )
  )

  resp <- fwa_api(path, query)

  read_feature(resp, epsg)
}
