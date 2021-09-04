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
  if(vld_bbox(x)) {
    return(invisible())
  }
  chk_numeric(x)
  chk_length(x, 4L)
  chk_not_any_na(x)
}

chk_transform <- function(x){
  if(vld_transform(x)) {
    return(invisible())
  }
  chk_character(x)
  chk_not_any_na(x)
  chk_subset(x[1], valid_transform_functions())
}
