
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

An R package 📦 for retrieving data from the [B.C. Freshwater
Atlas](https://www2.gov.bc.ca/gov/content/data/geographic-data-services/topographic-data/freshwater)
using [fwapg](https://github.com/smnorris/fwapg). Data are provided as
[simple features](https://github.com/r-spatial/sf).

  - `fwa_()` - Get features from a layer.
  - `fwa_gnis_()` - Get features by gnis\_name.
  - `fwa_list_()` - Get metadata.
  - `fwa_search_()` - Search metadata with regular expression.

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

yakoun <- fwapgr::fwa_feature("fwa_stream_networks_sp", 
                              filter = "gnis_name = 'Yakoun River'", 
                              columns = c("gnis_name"))
yakoun
#> Simple feature collection with 129 features and 1 field
#> geometry type:  LINESTRING
#> dimension:      XYZ
#> bbox:           xmin: -132.2789 ymin: 53.34324 xmax: -132.1283 ymax: 53.65705
#> z_range:        zmin: 1 zmax: 99
#> CRS:            4326
#> First 10 features:
#>       gnis_name                       geometry
#> 1  Yakoun River LINESTRING Z (-132.2658 53....
#> 2  Yakoun River LINESTRING Z (-132.14 53.51...
#> 3  Yakoun River LINESTRING Z (-132.2742 53....
#> 4  Yakoun River LINESTRING Z (-132.1965 53....
#> 5  Yakoun River LINESTRING Z (-132.2088 53....
#> 6  Yakoun River LINESTRING Z (-132.253 53.4...
#> 7  Yakoun River LINESTRING Z (-132.204 53.6...
#> 8  Yakoun River LINESTRING Z (-132.2483 53....
#> 9  Yakoun River LINESTRING Z (-132.2727 53....
#> 10 Yakoun River LINESTRING Z (-132.2687 53....
```

## Information

For more information see the [Get
Started](https://poissonconsulting.github.io/fwapgr/articles/fwapgr.html)
vignette.

## Credit and Inspiration

`fwapgr` is meant to succeed
[fwabc](https://github.com/poissonconsulting/fwabc). `fwabc` is a
wrapper on [bcdata](https://github.com/bcgov/bcdata), which retrieves
data [via
WFS](https://openmaps.gov.bc.ca/geo/pub/wfs?service=WFS&version=2.0.0&request=GetFeature&typeName=WHSE_BASEMAPPING.FWA_LAKES_POLY&outputFormat=json&SRSNAME=epsg%3A3005&CQL_FILTER=GNIS_NAME_1=%27Quamichan%20Lake%27).
However, this approach did not work well for large requests.

`fwapgr` instead retrieves data from a PostgreSQL database hosted by
[Hillcrest Geographics](https://hillcrestgeo.ca/main/) (see
[fwapg](https://github.com/smnorris/fwapg)) via [this
API](https://hillcrestgeo.ca/fwa/).

Many thanks to [Simon Norris](https://github.com/smnorris/fwapg) for his
work on [fwapg](https://github.com/smnorris/fwapg) and [the
API](https://hillcrestgeo.ca/fwa/).

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