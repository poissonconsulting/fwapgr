vld_response_status <- function(x){
  !http_error(x)
}

vld_response_json <- function(x){
  http_type(x) == "application/json"
}
