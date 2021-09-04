api_url <- function() {
  "https://hillcrestgeo.ca/"
}

format_parameter <- function(x) {
  if (is.null(x)) {
    return(x)
  }
  paste(x, collapse = ",")
}

fwa_api <- function(path, query) {
  chk_string(path)
  chk_list(query)
  chk_named(query)

  url <- modify_url(api_url(), path = path)
  resp <- GET(url, user(), query = query)

  chk_response_gateway(resp)
  chk_response_json(resp)
  chk_response_status(resp)

  content(resp, "text", encoding = "UTF-8")
}

read_feature <- function(response, epsg) {
  x <- sf::st_read(response, quiet = TRUE, stringsAsFactors = FALSE)
  # api default is 4326
  if (epsg == 4326) {
    return(x)
  }
  sf::st_transform(x, epsg)
}

status_msg <- function(x) {
  content(x, "text")
}

# valid Transform functions from https://github.com/CrunchyData/pg_featureserv/blob/master/config/pg_featureserv.toml.example#L29
valid_transform_functions <- function() {
  c(
    "ST_Boundary", "ST_Centroid",
    "ST_Envelope", "ST_PointOnSurface",
    "ST_Buffer", "ST_ConvexHull",
    "ST_MinimumBoundingCircle",
    "ST_OffsetCurve", "ST_GeneratePoints",
    "ST_Simplify", "ST_ChaikinSmoothing",
    "ST_LineSubstring"
  )
}

user <- function() {
  user_agent("http://github.com/poissonconsulting/fwapgr")
}
