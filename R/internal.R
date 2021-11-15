api_url <- function() {
  "https://features.hillcrestgeo.ca/"
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
  chk_response_status(resp)

  content(resp, "text", encoding = "UTF-8")
}

read_feature <- function(response, epsg) {
  x <- sf::st_read(response, quiet = TRUE, stringsAsFactors = FALSE)
  class(x) <- c("sf", "tbl", "tbl_df", "data.frame")
  if (epsg == 4326) {
    return(x)
  }
  sf::st_transform(x, epsg)
}

status_msg <- function(x) {
  content(x, "text")
}

user <- function() {
  user_agent("http://github.com/poissonconsulting/fwapgr")
}
