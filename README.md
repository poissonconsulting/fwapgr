
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fwapgr <img src="man/figures/logo.png" align="right" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/poissonconsulting/fwapgr/workflows/R-CMD-check/badge.svg)](https://github.com/poissonconsulting/fwapgr/actions)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/fwapgr/branch/master/graph/badge.svg)](https://codecov.io/gh/poissonconsulting/fwapgr?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
<!-- badges: end -->

`fwapgr` is an R client for the [fwapg pg-featureserv web
API](https://www.hillcrestgeo.ca/fwapg/index.html) used to get data from
the [B.C. Freshwater
Atlas](https://www2.gov.bc.ca/gov/content/data/geographic-data-services/topographic-data/freshwater).
Data are returned as [simple features](https://github.com/r-spatial/sf).
Functions and arguments exactly match those available in the API.

If you are looking for a user-friendly R 📦 for retrieving data from the
[B.C. Freshwater
Atlas](https://www2.gov.bc.ca/gov/content/data/geographic-data-services/topographic-data/freshwater)
please see [fwatlasbc](https://github.com/poissonconsulting/fwatlasbc)
which wraps `fwapgr`.

## Introduction

`fwapgr` allows you to perform three types of operation.

Get information about the
[collections](https://www.hillcrestgeo.ca/fwapg/collections.html) or a
collection’s properties:

-   `fwa_collections()`  
-   `fwa_collection_properties()`

Query features from a
[collection](https://www.hillcrestgeo.ca/fwapg/collections.html):

-   `fwa_query_collection()`

Execute spatial
[functions](https://www.hillcrestgeo.ca/fwapg/functions.html):

-   [`fwa_index_point()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_index_point.html)
-   [`fwa_locate_along()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_locate_along.html)
-   [`fwa_locate_along_interval()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_locate_along_interval.html)
-   [`fwa_watershed_at_measure()`](https://poissonconsulting.github.io/fwapgr/reference/ffwa_watershed_at_measure.html)
-   [`fwa_watershed_hex()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_hex.html)
-   [`fwa_watershed_stream()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_stream.html)
-   [`fwa_hydroshed()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_hydroshed.html)

## Installation

To install the lastest version from
[GitHub](https://github.com/poissonconsulting/fwapgr)

``` r
# install.packages("devtools")
devtools::install_github("poissonconsulting/fwapgr")
```

## Demonstration

Get Yakoun River stream from ‘whse_basemapping.fwa_stream_networks_sp’
collection:

``` r
yakoun <- fwapgr::fwa_collection("whse_basemapping.fwa_stream_networks_sp", filter = list(gnis_name = "Yakoun River"))
yakoun[c("blue_line_key", "gnis_name", "length_metre")]
#> Simple feature collection with 129 features and 3 fields
#> Geometry type: LINESTRING
#> Dimension:     XYZ
#> Bounding box:  xmin: -132.2789 ymin: 53.34324 xmax: -132.1283 ymax: 53.65705
#> z_range:       zmin: 1 zmax: 99
#> Geodetic CRS:  WGS 84
#> # A data frame: 129 × 4
#>    blue_line_key gnis_name    length_metre                              geometry
#>            <int> <chr>               <dbl>                      <LINESTRING [°]>
#>  1     360881586 Yakoun River       1808.  Z (-132.206 53.65705 1, -132.2042 53…
#>  2     360881586 Yakoun River        500.  Z (-132.204 53.64188 7, -132.2041 53…
#>  3     360881586 Yakoun River         34.3 Z (-132.2088 53.63862 7, -132.2093 5…
#>  4     360881586 Yakoun River       1619.  Z (-132.2093 53.63859 7, -132.2107 5…
#>  5     360881586 Yakoun River       2816.  Z (-132.2076 53.63039 7.367, -132.20…
#>  6     360881586 Yakoun River       1268.  Z (-132.2071 53.61951 7.367, -132.20…
#>  7     360881586 Yakoun River        231.  Z (-132.2122 53.61336 7.367, -132.21…
#>  8     360881586 Yakoun River       1092.  Z (-132.2146 53.61189 8, -132.2154 5…
#>  9     360881586 Yakoun River        282.  Z (-132.2063 53.605 8.062, -132.2066…
#> 10     360881586 Yakoun River        851.  Z (-132.208 53.60271 8.494, -132.207…
#> # … with 119 more rows
```

Get Yakoun River watershed starting 10km upstream:

``` r
wshed <- fwapgr::fwa_watershed_at_measure(unique(yakoun$blue_line_key), downstream_route_measure = 10000)
```

Use `transform` argument to simplify polygons. See valid transformation
functions
[here](https://github.com/CrunchyData/pg_featureserv/blob/master/config/pg_featureserv.toml.example#L29)

``` r
wshed_simple <- fwapgr::fwa_watershed_at_measure(unique(yakoun$blue_line_key), downstream_route_measure = 10000, transform = c("ST_Simplify", 2000))
```

``` r
ggplot2::ggplot() +
  ggplot2::geom_sf(data = wshed_simple, lwd = 0.15, fill = "red", alpha = 0.1) +
  ggplot2::geom_sf(data = wshed, lwd = 0.15, fill = "steelblue", alpha = 0.5) +
  ggplot2::geom_sf(data = yakoun, lwd = 0.15)
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />

## Credit and Inspiration

`fwapgr` is built on the [fwapg pg-featureserv web
API](https://www.hillcrestgeo.ca/fwapg/index.html) hosted and created by
[Simon Norris](https://github.com/smnorris/fwapg) at [Hillcrest
Geographics](https://hillcrestgeo.ca/main/). It supersedes the archived
[`fwabc`](https://github.com/poissonconsulting/fwabc) 📦 which retrieved
data [via
WFS](https://openmaps.gov.bc.ca/geo/pub/wfs?service=WFS&version=2.0.0&request=GetFeature&typeName=WHSE_BASEMAPPING.FWA_LAKES_POLY&outputFormat=json&SRSNAME=epsg%3A3005&CQL_FILTER=GNIS_NAME_1=%27Quamichan%20Lake%27)
using the [bcdata](https://github.com/bcgov/bcdata) 📦.

Many thanks to [Simon Norris](https://github.com/smnorris/fwapg) for his
work on [fwapg](https://github.com/smnorris/fwapg) PostgreSQL database
and [the pg-featureserv web
API](https://www.hillcrestgeo.ca/fwapg/index.html).

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/fwapgr/issues).

[Pull requests](https://github.com/poissonconsulting/fwapgr/pulls) are
always welcome.

## Code of Conduct

Please note that the fwapgr project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
