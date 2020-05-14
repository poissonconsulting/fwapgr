api_url <- function(){
  "https://hillcrestgeo.ca/"
}

user <- function(){
  user_agent("http://github.com/poissonconsulting/fwapgr")
}

fwa_api <- function(path, query) {

  chk_string(path)
  chk_list(query)
  chk_named(query)

  url <- modify_url(api_url(), path = path)
  resp <- GET(url, user(), query = query)

  chk_response_json(resp)
  chk_response_status(resp)

  content(resp, "text")
}

read_feature <- function(response, srid){
  suppressWarnings(sf::st_read(response, crs = srid, quiet = TRUE))
}
