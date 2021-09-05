chk_response_status <- function(x) {
  if (vld_response_status(x)) {
    return(invisible(x))
  }
  msg <- status_msg(x)
  abort_chk(glue("API request failed [{status_code(x)}]: {msg}"))
}

chk_response_gateway <- function(x) {
  if (vld_response_gateway(x)) {
    return(invisible(x))
  }
  msg <- "Bad Gateway"
  abort_chk(glue("API request failed [{status_code(x)}]: {msg}"))
}

chk_filter <- function(x, x_name = NULL) {
  if (vld_filter(x)) {
    return(invisible(x))
  }
  if (is.null(x_name)) x_name <- deparse_backtick_chk((substitute(x)))
  chk_vector(x, x_name = x_name)
  chk_named(x, x_name = x_name)
}
