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
#' @param bbox A vector of numbers indicating bounding box to limit output
#' features to, e.g. `c(minLon, minLat, maxLon, maxLat)`.
#' @param properties A vector of strings of the column names to include. If NULL (default), all columns are retained.
#' @param transform A character string of the geometry transformation function pipeline to apply.
#' @param epsg A positive whole number of the epsg to transform features to.
#' @return A sf object
#' @seealso \href{https://www.hillcrestgeo.ca/fwapg/collections.html}{collections API documentation}.
#' @export
#' @examples
#' \dontrun{
#' fwa_collection("whse_basemapping.fwa_stream_networks_sp", filter = list(gnis_name = 'Sangan River'))
#' }
fwa_collection <- function(collection_id,
                        filter = NULL,
                        limit = 10000,
                        offset = 0,
                        bbox = NULL,
                        properties = NULL,
                        transform = NULL,
                        epsg = 4326){

  chk_string(collection_id)
  chkor(chk_is(filter, "vector"), chk_is(filter, "list"), chk_null(filter))
  chk_null_or(filter, chk_named)
  chk_whole_number(limit)
  chk_whole_number(offset)
  chk_bbox(bbox)
  chk_null_or(properties, chk_character)
  chk_null_or(transform, chk_string)
  chk_whole_number(epsg)

  properties  <- format_properties(properties)
  bbox <- format_bounds(bbox)

  path <- glue("fwapg/collections/{collection_id}/items.json")
  query <- c(filter,
             list(limit = limit,
                  offset = offset,
                  bbox = bbox,
                  properties = properties,
                  transform = transform))

  resp <- fwa_api(path, query)

  read_feature(resp, epsg)
}
