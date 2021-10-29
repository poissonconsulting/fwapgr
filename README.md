
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fwapgr <img src="man/figures/logo.png" align="right" />

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
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

## Installation

To install the lastest version from
[GitHub](https://github.com/poissonconsulting/fwapgr)

``` r
# install.packages("devtools")
devtools::install_github("poissonconsulting/fwapgr")
```

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
-   [`fwa_locate_along()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_locate_along.html)
-   [`fwa_locate_along_interval()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_locate_along_interval.html)
-   [`fwa_watershed_at_measure()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_at_measure.html)
-   [`fwa_watershed_hex()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_hex.html)
-   [`fwa_watershed_stream()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_stream.html)
-   [`hydroshed()`](https://poissonconsulting.github.io/fwapgr/reference/hydroshed.html)

## Demonstration

Get Sangan River from `whse_basemapping.fwa_stream_networks_sp`
collection:

``` r
coll <- "whse_basemapping.fwa_stream_networks_sp"
river <- fwapgr::fwa_collection(coll, filter = list(gnis_name = "Sangan River"))
river
#> Simple feature collection with 21 features and 28 fields
#> Geometry type: LINESTRING
#> Dimension:     XYZ
#> Bounding box:  xmin: -131.9972 ymin: 53.94994 xmax: -131.9168 ymax: 54.0332
#> z_range:       zmin: 1 zmax: 67
#> Geodetic CRS:  WGS 84
#> # A data frame: 21 × 29
#>    id     blue_line_key blue_line_key_5… downstream_rout… edge_type feature_code
#>    <chr>          <int>            <int>            <dbl>     <int> <chr>       
#>  1 59028…     360879896               11            4721.      1000 GA24850000  
#>  2 59028…     360879896               11            3446.      1000 GA24850000  
#>  3 59028…     360879896               11            2319.      1000 GA24850000  
#>  4 59029…     360879896               11               0       1250 WA24111120  
#>  5 59029…     360879896               11            1266.      1000 GA24850000  
#>  6 59029…     360879896               11             367.      1250 WA24111120  
#>  7 59031…     360879896               11            5029.      1000 GA24850000  
#>  8 59032…     360879896               11            6466.      1000 GA24850000  
#>  9 59033…     360879896               11            6808.      1000 GA24850000  
#> 10 59034…     360879896               11            7384.      1000 GA24850000  
#> # … with 11 more rows, and 23 more variables: feature_source <chr>,
#> #   fwa_watershed_code <chr>, gnis_id <int>, gnis_name <chr>, gradient <dbl>,
#> #   left_right_tributary <chr>, length_metre <dbl>, linear_feature_id <int>,
#> #   local_watershed_code <chr>, localcode_ltree <chr>, stream_magnitude <int>,
#> #   stream_order <int>, upstream_area_ha <chr>, upstream_route_measure <dbl>,
#> #   waterbody_key <int>, watershed_code_50k <chr>, watershed_group_code <chr>,
#> #   watershed_group_code_50k <chr>, watershed_group_id <int>, …
```

Get simplified Yakoun River watershed starting 10km upstream:

``` r
blk <- river$blue_line_key[1]
wshed <- fwapgr::fwa_watershed_at_measure(blk, downstream_route_measure = 10000,
                                          transform = c("ST_Simplify", 2000))
```

``` r
ggplot2::ggplot() +
  ggplot2::geom_sf(data = wshed, lwd = 0.15, fill = "steelblue", alpha = 0.5) +
  ggplot2::geom_sf(data = river, lwd = 0.15)
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

## Creditation

`fwapgr` relies on [fwapg
API](https://www.hillcrestgeo.ca/fwapg/index.html) which is created,
maintained and hosted by [Simon
Norris](https://github.com/smnorris/fwapg) at [Hillcrest
Geographics](https://hillcrestgeo.ca/main/).

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/fwapgr/issues).

[Pull requests](https://github.com/poissonconsulting/fwapgr/pulls) are
always welcome.

### Code of Conduct

Please note that `fwapgr` is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
