#' Query Freshwater Atlas Collection
#'
#' Query a collection from the freshwater atlas.
#'
#' @inherit internal
#' @family collections
#' @export
#' @examples
#' collection_id <- "whse_basemapping.fwa_approx_borders"
#' filter <- list(border = "USA_49")
#' fwa_query_collection(collection_id, filter = filter)
#'
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
                                 sortby = NULL,
                                 groupby = NULL,
                                 epsg = 4326,
                                 nocache = getOption("fwa.nocache", FALSE)) {
  chk_whole_number(epsg)
  chk_gt(epsg)
  chk_flag(nocache)

  base_url <- api_url()
  path <- api_path()
  user <- gh_user()

  x <- pgfeatureserv::pgf_collection_features(
    collection_id = collection_id,
    base_url = base_url,
    path = path,
    filter = filter,
    limit = limit,
    offset = offset,
    bbox = bbox,
    properties = properties,
    transform = transform,
    sortby = sortby,
    groupby = groupby,

    user = user,
    nocache = nocache_conversion(nocache)
  )

  sf::st_transform(x, epsg) |>
    any_to_int()
}
