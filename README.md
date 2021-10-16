
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

`fwapgr` is an R package that uses the [fwapg
API](https://www.hillcrestgeo.ca/fwapg/index.html) to query the
[Freshwater
Atlas](https://www2.gov.bc.ca/gov/content/data/geographic-data-services/topographic-data/freshwater)
(FWA) of British Columbia (BC). The functions and arguments in `fwapgr`
match those available in the API.

If you are looking for a higher-level R package to query the FWA of BC
see [`fwatlasbc`](https://github.com/poissonconsulting/fwatlasbc) which
wraps `fwapgr`.

## Introduction

`fwapgr` allows you to perform three types of operation.

### Get Information on Collections

Get information about the
[collections](https://www.hillcrestgeo.ca/fwapg/collections.html) or a
collection’s properties:

-   [`fwa_collections()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_collections.html)  
-   [`fwa_collection_properties()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_collection_properties.html)

### Query a Collection

Query features from a
[collection](https://www.hillcrestgeo.ca/fwapg/collections.html):

-   [`fwa_query_collection()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_query_collection.html)

### Execute Spatial Functions

Execute spatial
[functions](https://www.hillcrestgeo.ca/fwapg/functions.html):

-   [`fwa_index_point()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_index_point.html)
-   [`fwa_hydroshed()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_hydroshed.html)
-   [`fwa_locate_along()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_locate_along.html)
-   [`fwa_locate_along_interval()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_locate_along_interval.html)
-   [`fwa_watershed_at_measure()`](https://poissonconsulting.github.io/fwapgr/reference/ffwa_watershed_at_measure.html)
-   [`fwa_watershed_hex()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_hex.html)
-   [`fwa_watershed_stream()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_stream.html)

## Installation

To install the lastest version from
[GitHub](https://github.com/poissonconsulting/fwapgr)

``` r
# install.packages("devtools")
devtools::install_github("poissonconsulting/fwapgr")
```

## Demonstration

Get Yakoun River stream from `whse_basemapping.fwa_stream_networks_sp`
collection:

``` r
coll <- "whse_basemapping.fwa_stream_networks_sp"
yak <- fwapgr::fwa_collection(coll, filter = list(gnis_name = "Yakoun River"))
yak
#> Simple feature collection with 129 features and 28 fields
#> Geometry type: LINESTRING
#> Dimension:     XYZ
#> Bounding box:  xmin: -132.2789 ymin: 53.34324 xmax: -132.1283 ymax: 53.65705
#> z_range:       zmin: 1 zmax: 99
#> Geodetic CRS:  WGS 84
#> # A data frame: 129 × 29
#>    id       blue_line_key blue_line_key_5… downstream_rout… edge_type feature_code
#>    <chr>            <int>            <int>            <dbl>     <int> <chr>       
#>  1 59099140     360881586             1551               0       1250 WA24111120  
#>  2 59099416     360881586             1551            1808.      1000 GA24850000  
#>  3 59099419     360881586             1551            2307.      1250 WA24111120  
#>  4 59100176     360881586             1551            2342.      1250 WA24111120  
#>  5 59101376     360881586             1551            3960.      1250 WA24111120  
#>  6 59102089     360881586             1551            6776.      1250 WA24111120  
#>  7 59102227     360881586             1551            8044.      1250 WA24111120  
#>  8 59102987     360881586             1551            8275.      1250 WA24111120  
#>  9 59103235     360881586             1551            9367.      1250 WA24111120  
#> 10 59103900     360881586             1551            9649.      1250 WA24111120  
#> # … with 119 more rows, and 23 more variables: feature_source <chr>,
#> #   fwa_watershed_code <chr>, gnis_id <int>, gnis_name <chr>, gradient <dbl>,
#> #   left_right_tributary <chr>, length_metre <dbl>, linear_feature_id <int>,
#> #   local_watershed_code <chr>, localcode_ltree <chr>, stream_magnitude <int>,
#> #   stream_order <int>, upstream_area_ha <chr>, upstream_route_measure <dbl>,
#> #   waterbody_key <int>, watershed_code_50k <chr>, watershed_group_code <chr>,
#> #   watershed_group_code_50k <chr>, watershed_group_id <int>, …
```

Get simplified Yakoun River watershed starting 10km upstream:

``` r
blk <- yak$blue_line_key[1]
wshed <- fwapgr::fwa_watershed_at_measure(blk, downstream_route_measure = 10000,
                                          transform = c("ST_Simplify", 2000))
```

``` r
ggplot2::ggplot() +
  ggplot2::geom_sf(data = wshed, lwd = 0.15, fill = "steelblue", alpha = 0.5) +
  ggplot2::geom_sf(data = yak, lwd = 0.15)
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

## Credit and Inspiration

`fwapgr` uses [fwapg API](https://www.hillcrestgeo.ca/fwapg/index.html)
which is hosted and created by [Simon
Norris](https://github.com/smnorris/fwapg) at [Hillcrest
Geographics](https://hillcrestgeo.ca/main/). `fwapgr` supersedes the
archived [`fwabc`](https://github.com/poissonconsulting/fwabc) R package
which retrieved data via
[WFS](https://openmaps.gov.bc.ca/geo/pub/wfs?service=WFS&version=2.0.0&request=GetFeature&typeName=WHSE_BASEMAPPING.FWA_LAKES_POLY&outputFormat=json&SRSNAME=epsg%3A3005&CQL_FILTER=GNIS_NAME_1=%27Quamichan%20Lake%27)
using [`bcdata`](https://github.com/bcgov/bcdata) 📦.

Hats off to [Simon Norris](https://github.com/smnorris/fwapg) for his
work on the [fwapg API](https://github.com/smnorris/fwapg)!

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
