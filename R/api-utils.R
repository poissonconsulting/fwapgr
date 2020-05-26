api_url <- function(){
  "https://hillcrestgeo.ca/"
}

user <- function(){
  user_agent("http://github.com/poissonconsulting/fwapgr")
}

fwa_api <- function(path, query) {

  chk_string(path)
  chk_string("a")
  chk_list(query)
  chk_named(query)

  url <- modify_url(api_url(), path = path)
  resp <- GET(url, user(), query = query)

  chk_response_json(resp)
  chk_response_status(resp)

  content(resp, "text")
}

read_feature <- function(response, srid = NULL){
  if(is.null(srid))
    return(sf::st_read(response, quiet = TRUE))
  suppressWarnings(sf::st_read(response, crs = srid, quiet = TRUE))
}

lgl_to_string <- function(x){
  if(x)
    return("true")
  "false"
}

columns_to_star <- function(x){
  if(is.null(x))
    return("*")
  x
}

add_schema <- function(x){
  glue("whse_basemapping.{x}")
}
