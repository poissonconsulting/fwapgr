
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
<!-- badges: end -->

An R package 📦 for searching & retrieving data from the [B.C. Freshwater
Atlas](https://www2.gov.bc.ca/gov/content/data/geographic-data-services/topographic-data/freshwater).
Data are fetched from a PostgreSQL database via [this
API](https://hillcrestgeo.ca/fwa/) hosted by [Hillcrest
Geographics](https://hillcrestgeo.ca/main/).

  - `fwa_()` - Get features from a table.
  - `fwa_gnis_()` - Convenience functions to get features by gnis\_name.
  - `fwa_lookup_()` - Get lookup tables.
  - `fwa_search_()` - Search lookup tables with regex.

## Installation

To install the developmental version from
[GitHub](https://github.com/poissonconsulting/fwapgr)

``` r
# install.packages("remotes")
remotes::install_github("poissonconsulting/fwapgr")
```

## Demonstration

Get Yakoun River from ‘fwa\_stream\_networks\_sp’ table, filter by
gnis\_name, include gnis\_name and blue\_line\_key columns

``` r
yakoun <- fwapgr::fwa_feature("fwa_stream_networks_sp", 
                              filter = "gnis_name = 'Yakoun River'", 
                              columns = c("gnis_name", "blue_line_key"))

yakoun
#> Simple feature collection with 129 features and 2 fields
#> geometry type:  MULTILINESTRING
#> dimension:      XYZ
#> bbox:           xmin: -132.2789 ymin: 53.34324 xmax: -132.1283 ymax: 53.65705
#> z_range:        zmin: 1 zmax: 99
#> CRS:            4326
#> First 10 features:
#>       gnis_name blue_line_key                       geometry
#> 1  Yakoun River     360881586 MULTILINESTRING Z ((-132.26...
#> 2  Yakoun River     360881586 MULTILINESTRING Z ((-132.19...
#> 3  Yakoun River     360881586 MULTILINESTRING Z ((-132.14...
#> 4  Yakoun River     360881586 MULTILINESTRING Z ((-132.26...
#> 5  Yakoun River     360881586 MULTILINESTRING Z ((-132.27...
#> 6  Yakoun River     360881586 MULTILINESTRING Z ((-132.20...
#> 7  Yakoun River     360881586 MULTILINESTRING Z ((-132.26...
#> 8  Yakoun River     360881586 MULTILINESTRING Z ((-132.27...
#> 9  Yakoun River     360881586 MULTILINESTRING Z ((-132.14...
#> 10 Yakoun River     360881586 MULTILINESTRING Z ((-132.27...
```

Or use a convenience function

``` r
yakoun <- fwapgr::fwa_gnis_stream_network("Yakoun River")
```

Get Yakoun River watershed

``` r
wshed <- fwapgr::fwa_watershed(360881586, downstream_route_measure = 1)
```

Get lakes within bounds of watershed

``` r
bbox <- sf::st_bbox(wshed)
lakes <- fwapgr::fwa_feature("fwa_lakes_poly", bounds = bbox)
```

Make a map\!

``` r
ggplot(data = yakoun) +
  geom_sf(data = wshed, lwd = 0.15) +
  geom_sf() +
  geom_sf(data = lakes, fill = "steelblue", lwd = 0.1)
```

<img src="man/figures/README-unnamed-chunk-7-1.png" width="100%" />

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
