#' FWA query
#'
#' Query a FWA table.
#'
#' @param table A character string of the table name.
#' @param filter A character string of the SQL WHERE statement to filter features by.
#' @param limit An integer of the number of records to include.
#' @param columns A vector of strings of the column names to include.
#' @param sort A vector of strings of the column names to sort by.
#' @param group A vector of strings of the column names to group by.
#' @return A sf object
#' @export
#' @examples
#' fwa_query("fwa_stream_networks_sp", filter = "gnis_name = 'Cowichan River'")
fwa_query <- function(table, filter = NULL, limit = NULL,
                      columns = NULL, sort = NULL, group = NULL){

  chkor(chk_string(filter), chk_null(filter))
  chkor(chk_whole_number(limit), chk_null(limit))
  chkor(chk_character(columns), chk_null(columns))
  chkor(chk_character(sort), chk_null(sort))
  chkor(chk_character(group), chk_null(group))

  table <- add_schema(table)
  columns <- columns_to_star(columns)

  path <- glue("fwa/v1/query/{table}")
  query <- list(filter = filter,
                columns = columns,
                sort = sort,
                limit = limit,
                group = group)

  resp <- fwa_api(path, query)
  read_feature(resp)
}

#' FWA watershed
#'
#' Get watershed upstream of a location on a stream.
#'
#' @param blue_line_key An integer of the stream blue line key.
#' @param srid An integer of the SRID for the returned feature. The default is 4326 WGS84 Lat/Lng.
#' @param downstream_route_measure An integer of the downstream route measure.
#' @return A sf object
#' @export
#' @examples
#' fwa_watershed(356308001)
fwa_watershed <- function(blue_line_key, downstream_route_measure = 0, srid = 4326){
  chk_whole_number(blue_line_key)
  chk_whole_number(downstream_route_measure)
  chk_whole_number(srid)

  path <- glue("fwa/v1/watershed/{blue_line_key}")
  query <- list(downstream_route_measure = downstream_route_measure,
                srid = srid)
  resp <- fwa_api(path, query)
  read_feature(resp, srid)
}

