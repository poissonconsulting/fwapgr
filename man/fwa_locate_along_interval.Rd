% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/locate-along-interval.R
\name{fwa_locate_along_interval}
\alias{fwa_locate_along_interval}
\title{Freshwater Atlas Locate Along Interval}
\usage{
fwa_locate_along_interval(
  blue_line_key,
  interval_length = 100,
  start_measure = 0,
  end_measure = NULL,
  bbox = NULL,
  properties = NULL,
  transform = NULL,
  epsg = 4326,
  nocache = getOption("fwa.nocache", FALSE)
)
}
\arguments{
\item{blue_line_key}{A positive whole number of the stream blue line key.}

\item{interval_length}{An integer of the interval distance in meters.}

\item{start_measure}{An integer of the distance in meters upstream from the river mouth to start from.}

\item{end_measure}{An integer of the distance in meters upstream from the river mouth to end at.}

\item{bbox}{A vector of four numbers indicating bounding box to limit output
features to, e.g. \code{c(minLon, minLat, maxLon, maxLat)}.}

\item{properties}{A vector of strings of the column names to include. If NULL (default), all columns are retained.}

\item{transform}{A character vector with the name of the \href{https://github.com/CrunchyData/pg_featureserv/blob/master/config/pg_featureserv.toml.example#L29}{\emph{valid transform}} function followed by the parameter values (e.g. c("ST_Simplify", 100))}

\item{epsg}{A positive whole number of the epsg to transform features to.}

\item{nocache}{A flag specifying whether or not to cache results.}
}
\value{
An sf object.
}
\description{
Gets a regularly spaced set of points between two river metres.
}
\examples{
fwa_locate_along_interval(356308001, interval_length = 10, start_measure = 0)
}
\seealso{
\href{https://features.hillcrestgeo.ca/fwa/functions/fwa_locatealonginterval.html}{API documentation}

Other functions: 
\code{\link{fwa_index_point}()},
\code{\link{fwa_locate_along}()},
\code{\link{fwa_watershed_at_measure}()},
\code{\link{fwa_watershed_hex}()},
\code{\link{fwa_watershed_stream}()},
\code{\link{hydroshed}()}
}
\concept{functions}
