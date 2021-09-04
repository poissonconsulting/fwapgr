vld_response_status <- function(x) {
  !http_error(x)
}

vld_response_gateway <- function(x) {
  !(http_error(x) && status_code(x) == 502)
}

vld_bbox <- function(x) {
  vld_numeric(x) && vld_identical(length(x), 4L) && vld_not_any_na(x)
}

vld_transform <- function(x) {
  vld_character(x) && vld_not_any_na(x) && x[1] %in% fwa_valid_transforms()
}

vld_filter <- function(x) {
  vld_vector(x) && vld_named(x)
}
