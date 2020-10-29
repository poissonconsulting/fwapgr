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

vld_transform <- function(x){
  if(is.null(x)) return(TRUE)
  # valid Transform functions from https://github.com/CrunchyData/pg_featureserv/blob/master/config/pg_featureserv.toml.example#L29
  vld_character(x) && vld_not_any_na(x) && x[1] %in% c("ST_Boundary", "ST_Centroid",
                                                       "ST_Envelope", "ST_PointOnSurface",
                                                       "ST_Buffer", "ST_ConvexHull",
                                                       "ST_MinimumBoundingCircle",
                                                       "ST_OffsetCurve", "ST_GeneratePoints",
                                                       "ST_Simplify", "ST_ChaikinSmoothing",
                                                       "ST_LineSubstring")
}
