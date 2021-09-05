fwa_function <- function(function_id,
                         parameters,
                         limit = 100,
                         offset = 0,
                         bbox = NULL,
                         properties = NULL,
                         transform = NULL,
                         epsg = 4326) {
  chk_string(function_id)
  chk_list(parameters)
  chk_named(parameters)
  chk_whole_number(limit)
  chk_lte(limit, 10000L)
  chk_whole_number(offset)
  chk_lt(offset, 100000L)
  chk_null_or(bbox, vld = vld_numeric)
  chk_null_or(properties, vld = vld_character)
  chk_null_or(transform, vld = vld_string)
  chk_whole_number(epsg)

  properties <- format_parameter(properties)
  bbox <- format_parameter(bbox)
  transform <- format_parameter(transform)

  path <- glue("fwapg/functions/{function_id}/items.json")
  query <- c(parameters, list(
    limit = limit,
    offset = offset,
    bbox = bbox,
    properties = properties,
    transform = transform
  ))

  resp <- fwa_api(path, query)
  read_feature(resp, epsg)
}
