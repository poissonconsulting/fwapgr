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

read_feature <- function(response, epsg){
  x <- sf::st_read(response, quiet = TRUE)
  # api default is 4326
  if(epsg == 4326)
    return(x)
  sf::st_transform(x, epsg)
}

lgl_to_string <- function(x){
  if(x)
    return("true")
  "false"
}

parse_bbox <- function(x){
  x <- strsplit(x, "\\(")[[1]][2]
  x <- strsplit(x, "\\)")[[1]][1]
  x <- strsplit(x, " |,")[[1]]
  x <- as.numeric(x)
  names(x) <- c("xmin", "ymin", "xmax", "ymax")
  class(x) <- "bbox"
  x
}

# columns_to_star <- function(x){
#   if(is.null(x))
#     return("*")
#   x
# }

format_columns <- function(x){
  if(is.null(x)) return(x)
  paste(x, collapse = ",")
}

format_bounds <- function(x){
  if(is.null(x)) return(x)
  paste(x, collapse = ",")
}

add_schema <- function(x, schema){
  glue("{schema}.{x}")
}

filter_gnis <- function(x){
  glue("gnis_name = '{x}'")
}

filter_gnis1 <- function(x){
  glue("gnis_name_1 = '{x}'")
}
