api_url <- function() {
  "https://features.hillcrestgeo.ca/"
}

api_path <- function() {
  "fwa"
}

gh_user <- function() {
  "http://github.com/poissonconsulting/fwapgr"
}

nocache_conversion <- function(nocache) {
  if (isTRUE(nocache)) {
    return("true")
  }
  "false"
}

any_to_int <- function(data) {
  data |>
    dplyr::mutate(dplyr::across(tidyselect::any_of(c("blue_line_key", "blue_line_key_50k", "gnis_id", "linear_feature_id", "watershed_group_id", "watershed_key", "watershed_key_50k", "hex_id")), as.integer))
}
