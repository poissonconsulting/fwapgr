chk_response_status <- function(x) {
  if (vld_response_status(x)) {
    return(invisible(x))
  }
  msg <- status_msg(x)
  abort_chk(glue("API request failed [{status_code(x)}]: {msg}"))
}

chk_response_json <- function(x) {
  if (vld_response_json(x)) {
    return(invisible(x))
  }
  type <- http_type(x)
  abort_chk(glue("API returned '{type}' not 'application/json' or 'application/geo+json'"))
}

chk_response_gateway <- function(x) {
  if (vld_response_gateway(x)) {
    return(invisible(x))
  }
  msg <- "Bad Gateway"
  abort_chk(glue("API request failed [{status_code(x)}]: {msg}"))
}

chk_bbox <- function(x, x_name = NULL) {
  if (vld_bbox(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  chk_numeric(x, x_name = x_name)
  chk_length(x, 4L, x_name = x_name)
  chk_not_any_na(x, x_name = x_name)
}

chk_transform <- function(x, x_name = NULL) {
  if (vld_transform(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  chk_character(x, x_name = x_name)
  chk_not_any_na(x, x_name = x_name)
  chk_subset(x[1], valid_transform_functions(), x_name = x_name)
}

chk_filter <- function(x, x_name = NULL) {
  if (vld_filter(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  chk_vector(x, x_name = x_name)
  chk_named(x, x_name = x_name)
}
