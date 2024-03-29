#' @keywords internal
"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
#' Parameter Descriptions
#'
#' Descriptions of the parameters and a typical return value for the provided functions.
#'
#' @keywords internal
#' @name internal
#' @param bbox A vector of four numbers indicating bounding box to limit output
#' features to, e.g. `c(minLon, minLat, maxLon, maxLat)`.
#' @param blue_line_key A positive whole number of the stream blue line key.
#' @param collection_id A character string of the collection id.
#' @param downstream_route_measure A positive number of the river metre.
#' @param end_measure An integer of the distance in meters upstream from the river mouth to end at.
#' @param epsg A positive whole number of the epsg to transform features to.
#' @param function_id A character string of the function id.
#' @param filter A named vector or list of the filter(s) to apply, where the list
#' names correspond to column names and the list values correspond to the desired
#' value, e.g. `list(gnis_name = "Sangan River")`.
#' @param interval_length An integer of the interval distance in meters.
#' @param limit A positive whole number indicating the maximum number of features to return.
#' @param offset A positive whole number indicating the offset of start of returned results.
#' @param parameters A named list of the parameters and values for a specific function.
#' @param properties A vector of strings of the column names to include. If NULL (default), all columns are retained.
#' @param sortby A string that sorts the response items by a property.
#' Default is ascending but property name can be prepended with
#' '-' to indicate descending.
#' @param groupby A string of the property name (i.e., column name) to group
#' response features by. This would typically be used with an aggregate
#' transform function.
#' @param srid A positive whole number of the epsg of the coordinates.
#' @param start_measure An integer of the distance in meters upstream from the river mouth to start from.
#' @param tolerance A number of the tolerance in m.
#' @param transform A character vector with the name of the [*valid transform*](https://github.com/CrunchyData/pg_featureserv/blob/master/config/pg_featureserv.toml.example#L29) function followed by the parameter values (e.g. c("ST_Simplify", 100))
#' @param x A number of the x coordinate.
#' @param y A number of the y coordinate.
#' @param nocache A flag specifying whether or not to cache results.
#'
#' @return
#' An sf object.
NULL
