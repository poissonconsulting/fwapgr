
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fwapgr <img src="man/figures/logo.png" align="right" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/fwapgr/branch/master/graph/badge.svg)](https://codecov.io/gh/poissonconsulting/fwapgr?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![R build
status](https://github.com/poissonconsulting/fwapgr/workflows/R-CMD-check/badge.svg)](https://github.com/poissonconsulting/fwapgr/actions)
<!-- badges: end -->

An R 📦 for retrieving data from the [B.C. Freshwater
Atlas](https://www2.gov.bc.ca/gov/content/data/geographic-data-services/topographic-data/freshwater)
(FWA). `fwapgr` is an R client for
[fwapg](https://github.com/smnorris/fwapg), a PostgreSQL database and
[web API](https://hillcrestgeo.ca/fwapg/). Data are provided as [simple
features](https://github.com/r-spatial/sf).

Get and filter features from collections:

  - `fwa_collection()`  
  - `fwa_stream_gnis()`

List and search metadata:

  - `fwa_list_tables()`  
  - `fwa_list_columns()`  
  - `fwa_list_gnis_streams()`  
  - `fwa_search_gnis_streams()`

Perform spatial operations:

  - `fwa_nearest_stream()`  
  - `fwa_watershed_at_measure()`  
  - `fwa_stream_at_measure()`  
  - `fwa_watershed_hex()`

## Installation

To install the developmental version from
[GitHub](https://github.com/poissonconsulting/fwapgr)

``` r
# install.packages("remotes")
remotes::install_github("poissonconsulting/fwapgr")
```

## Demonstration

``` r
fwapgr::fwa_search_gnis_streams("yakoun")
#> [1] "Yakoun River"

yakoun <- fwapgr::fwa_collection("fwa_stream_networks_sp", filter = list(gnis_name = 'Yakoun River'))
yakoun[c("blue_line_key", "gnis_name", "length_metre", "upstream_area_ha", "stream_order")]
#> Simple feature collection with 129 features and 5 fields
#> geometry type:  LINESTRING
#> dimension:      XYZ
#> bbox:           xmin: -132.2789 ymin: 53.34324 xmax: -132.1283 ymax: 53.65705
#> z_range:        zmin: 1 zmax: 99
#> geographic CRS: WGS 84
#> First 10 features:
#>    blue_line_key    gnis_name length_metre upstream_area_ha stream_order
#> 1      360881586 Yakoun River    623.84399         45520.92            5
#> 2      360881586 Yakoun River    529.95682         45100.58            5
#> 3      360881586 Yakoun River    203.93703         43844.42            5
#> 4      360881586 Yakoun River    192.11758         14846.80            5
#> 5      360881586 Yakoun River    723.10276         22175.55            5
#> 6      360881586 Yakoun River   1807.56714         54390.74            5
#> 7      360881586 Yakoun River    499.69498         54390.74            5
#> 8      360881586 Yakoun River     34.30732         54390.74            5
#> 9      360881586 Yakoun River    231.06090         48079.44            5
#> 10     360881586 Yakoun River   1618.76222         54390.74            5
#>                          geometry
#> 1  LINESTRING Z (-132.1796 53....
#> 2  LINESTRING Z (-132.1547 53....
#> 3  LINESTRING Z (-132.1363 53....
#> 4  LINESTRING Z (-132.275 53.3...
#> 5  LINESTRING Z (-132.2647 53....
#> 6  LINESTRING Z (-132.206 53.6...
#> 7  LINESTRING Z (-132.204 53.6...
#> 8  LINESTRING Z (-132.2088 53....
#> 9  LINESTRING Z (-132.2122 53....
#> 10 LINESTRING Z (-132.2093 53....
```

## Information

For more information see the [Get
Started](https://poissonconsulting.github.io/fwapgr/articles/fwapgr.html)
vignette.

## Credit and Inspiration

`fwapgr` is meant to succeed
[fwabc](https://github.com/poissonconsulting/fwabc). `fwabc` retrieved
data [via
WFS](https://openmaps.gov.bc.ca/geo/pub/wfs?service=WFS&version=2.0.0&request=GetFeature&typeName=WHSE_BASEMAPPING.FWA_LAKES_POLY&outputFormat=json&SRSNAME=epsg%3A3005&CQL_FILTER=GNIS_NAME_1=%27Quamichan%20Lake%27)
with the [bcdata](https://github.com/bcgov/bcdata) 📦. Instead, `fwapgr`
leverages the power of PostgreSQL and PostGIS via a database and [web
API](https://hillcrestgeo.ca/fwapg/) hosted and created by [Hillcrest
Geographics](https://hillcrestgeo.ca/main/).

Many thanks to [Simon Norris](https://github.com/smnorris/fwapg) for his
work on [fwapg](https://github.com/smnorris/fwapg) and [the
API](https://hillcrestgeo.ca/fwapg/).

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/fwapgr/issues).

[Pull requests](https://github.com/poissonconsulting/fwapgr/pulls) are
always welcome.

### Code of Conduct

Please note that the fwapgr project is released with a [Contributor Code
of
Conduct](https://www.contributor-covenant.org/version/1/0/0/code-of-conduct/).
By contributing to this project, you agree to abide by its terms.
