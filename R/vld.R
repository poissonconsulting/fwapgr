vld_response_status <- function(x) {
  !http_error(x)
}

vld_response_gateway <- function(x) {
  !(http_error(x) && status_code(x) == 502)
}

vld_filter <- function(x) {
  is.null(x) || (vld_vector(x) && vld_named(x))
}
