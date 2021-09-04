#' Freshwater Atlas Valid Transform Functions
#'
#' Returns a character vector of the valid transform functions.
#'
#' The valid transform functions are listed at <https://github.com/CrunchyData/pg_featureserv/blob/master/config/pg_featureserv.toml.example#L29>.
#'
#' @return A character vector of the valid transform functions.
#' @export
#' @examples
#' fwa_valid_transforms()
fwa_valid_transforms <- function() {
  c(
    "ST_Boundary",
    "ST_Buffer",
    "ST_Centroid",
    "ST_ChaikinSmoothing",
    "ST_ConvexHull",
    "ST_Envelope",
    "ST_GeneratePoints",
    "ST_LineSubstring",
    "ST_MinimumBoundingCircle",
    "ST_OffsetCurve",
    "ST_PointOnSurface",
    "ST_Simplify"
  )
}
