
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fwapgr <img src="man/figures/logo.png" align="right" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/fwapgr/branch/master/graph/badge.svg)](https://codecov.io/gh/poissonconsulting/fwapgr?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![CRAN
status](https://www.r-pkg.org/badges/version/fwapgr)](https://cran.r-project.org/package=fwapgr)
<!-- [![Tinyverse status](https://tinyverse.netlify.com/badge/pkgtemplate)](https://CRAN.R-project.org/package=pkgtemplate) -->
<!-- ![CRAN downloads](https://cranlogs.r-pkg.org/badges/pkgtemplate) -->
[![R build
status](https://github.com/poissonconsulting/fwapgr/workflows/R-CMD-check/badge.svg)](https://github.com/poissonconsulting/fwapgr/actions)
<!-- badges: end -->

An R package 📦 for searching & retrieving data from the [B.C. Freshwater
Atlas](https://www2.gov.bc.ca/gov/content/data/geographic-data-services/topographic-data/freshwater).
Data are fetched from a PostgreSQL database via [this
API](https://hillcrestgeo.ca/fwa/) hosted by [Hillcrest
Geographics](https://hillcrestgeo.ca/main/). Data are provided as
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
#> geometry type:  MULTILINESTRING
#> dimension:      XYZ
#> bbox:           xmin: -132.2789 ymin: 53.34324 xmax: -132.1283 ymax: 53.65705
#> z_range:        zmin: 1 zmax: 99
#> CRS:            4326
#> First 10 features:
#>       gnis_name                       geometry
#> 1  Yakoun River MULTILINESTRING Z ((-132.26...
#> 2  Yakoun River MULTILINESTRING Z ((-132.19...
#> 3  Yakoun River MULTILINESTRING Z ((-132.14...
#> 4  Yakoun River MULTILINESTRING Z ((-132.26...
#> 5  Yakoun River MULTILINESTRING Z ((-132.27...
#> 6  Yakoun River MULTILINESTRING Z ((-132.20...
#> 7  Yakoun River MULTILINESTRING Z ((-132.26...
#> 8  Yakoun River MULTILINESTRING Z ((-132.27...
#> 9  Yakoun River MULTILINESTRING Z ((-132.14...
#> 10 Yakoun River MULTILINESTRING Z ((-132.27...
```

## Information

For more information see the [Get
Started](https://poissonconsulting.github.io/fwapgr/articles/fwapgr.html)
vignette.

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
