chk_response_status <- function(x){
  if(vld_response_status(x)) {
    return(invisible())
  }
  abort_chk(p("FWA API request failed", status_code(x)))
}

chk_response_json <- function(x){
  if (vld_response_json(x)){
    return(invisible())
  }
  abort_chk("API did not return json")
}
