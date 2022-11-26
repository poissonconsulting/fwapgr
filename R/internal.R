api_url <- function() {
  "https://features.hillcrestgeo.ca/"
}

gh_user <- function() {
  "http://github.com/poissonconsulting/fwapgr"
}

nocache_conversion <- function(nocache) {
  if(isTRUE(nocache)) {
    return('true')
  }
  'false'
}
