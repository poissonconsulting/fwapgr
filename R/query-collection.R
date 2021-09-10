#' Query Freshwater Atlas Collection
#'
#' Query a collection from the freshwater atlas.
#'
#' @inherit internal
#' @family collections
#' @export
#' @examples
#' collection_id <- "whse_basemapping.fwa_stream_networks_sp"
#' filter <- list(gnis_name = "Sangan River")
#' fwa_query_collection(collection_id, filter = filter)
fwa_query_collection <- function(collection_id,
                           filter = NULL,
                           limit = 10000,
                           offset = 0,
                           bbox = NULL,
                           properties = NULL,
                           transform = NULL,
                           epsg = 4326) {
  chk_string(collection_id)
  chk_filter(filter)
  chk_whole_number(limit)
  chk_gt(limit)
  chk_lte(limit, 10000L)
  chk_whole_number(offset)
  chk_gte(offset)
  chk_null_or(bbox, vld = vld_numeric)
  chk_null_or(properties, vld = vld_character)
  chk_null_or(transform, vld = vld_character)
  chk_whole_number(epsg)
  chk_gt(epsg)

  properties <- format_parameter(properties)
  bbox <- format_parameter(bbox)
  transform <- format_parameter(transform)

  id <- fwa_collection_properties(collection_id)$name[1]

  path <- glue("fwapg/collections/{collection_id}/items.json")

  query <- c(
    filter,
    list(
      sortBy = id,
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
