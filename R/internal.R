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
    dplyr::mutate(dplyr::across(
      tidyselect::any_of(c(
        "blue_line_key",
        "blue_line_key_50k",
        "gnis_id",
        "linear_feature_id",
        "watershed_group_id",
        "watershed_key",
        "watershed_key_50k",
        "hex_id"
      )),
      as.integer
    ))
}

is_valid_sf <- function(x) {
  sf_column <- attr(x, "sf_column")
  inherits(x, "sf") &&
    is.character(sf_column) &&
    length(sf_column) == 1L &&
    sf_column %in% names(x)
}

wait_seconds <- function(seconds) {
  Sys.sleep(seconds)
}

# The API occasionally returns a response without geometries (typically on
# the first request after a pause) which succeeds when repeated (#96).
pgf_sf <- function(fun, ..., tries = 3L) {
  for (try in seq_len(tries)) {
    x <- fun(...)
    if (is_valid_sf(x)) {
      return(x)
    }
    if (try < tries) {
      wait_seconds(try)
    }
  }
  abort_chk(
    "The API returned a response without a geometry column after ",
    tries,
    " attempts. Please try again later."
  )
}
