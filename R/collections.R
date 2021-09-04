#' FWA collection
#'
#' Get and filter collection from database.
#'
#' @param collection_id A character string of the collection id.
#' @param filter A named vector or list of the filter(s) to apply, where the list
#' names correspond to column names and the list values correspond to the desired
#' value, e.g. `list(gnis_name = "Sangan River")`.
#' @param limit A positive whole number indicating the maximum number of features to return.
#' @param offset A positive whole number indicating the offset of start of returned results.
#' @param bbox A vector of four numbers indicating bounding box to limit output
#' features to, e.g. `c(minLon, minLat, maxLon, maxLat)`.
#' @param properties A vector of strings of the column names to include. If NULL (default), all columns are retained.
#' @param transform A character vector with the name of the transform function followed by the parameter values (e.g. c("ST_Simplify", 100))
#' @param epsg A positive whole number of the epsg to transform features to.
#' @return An sf object
#' @seealso [collections API documentation](https://www.hillcrestgeo.ca/fwapg/collections.html).
#' @export
#' @examples
#' \dontrun{
#' collection_id <- "whse_basemapping.fwa_stream_networks_sp"
#' fwa_collection(collection_id, filter = list(gnis_name = "Sangan River"))
#' }
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
  chk_whole_number(offset)
  chk_gte(offset)
  chk_lt(offset, 100000L)
  chk_null_or(bbox, vld = vld_bbox)
  chk_null_or(properties, vld = vld_character)
  chk_null_or(transform, vld = vld_transform)
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
