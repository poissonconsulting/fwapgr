vld_response_status <- function(x){
  !http_error(x)
}

vld_response_json <- function(x){
  http_type(x) == "application/json"
}

vld_response_gateway <- function(x){
  !(http_error(x) && status_code(x) == 502)
}

vld_bbox <- function(x){
  if(is.null(x)) return(TRUE)
  vld_numeric(x) && vld_identical(length(x), 4L) && vld_not_any_na(x)
}
