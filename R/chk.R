chk_response_status <- function(x){
  if(vld_response_status(x)) {
    return(invisible())
  }
  msg <- status_msg(x)
  abort_chk(glue("API request failed [{status_code(x)}]: {msg}"))
}

chk_response_json <- function(x){
  if (vld_response_json(x)){
    return(invisible())
  }
  msg <- status_msg(x)
  abort_chk(glue("API did not return JSON: {msg}"))
}

chk_response_gateway <- function(x){
  if (vld_response_gateway(x)){
    return(invisible())
  }
  msg <- "Bad Gateway"
  abort_chk(glue("API request failed [{status_code(x)}]: {msg}"))
}

chk_bbox <- function(x){
  chkor(chk_range(length(x), c(4L, 4L)), chk_null(x))
  chkor(chk_numeric(x), chk_null(x))
}

# for backwards compatibility
chk_bounds <- function(x){
  chkor(chk_range(length(x), c(4L, 4L)), chk_null(x))
  chkor(chk_numeric(x), chk_null(x))
}
