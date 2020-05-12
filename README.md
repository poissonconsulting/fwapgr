
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pkgtemplate <img src="man/figures/logo.png" align="right" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/pkgtemplate/branch/master/graph/badge.svg)](https://codecov.io/gh/poissonconsulting/pkgtemplate?branch=master)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![CRAN
status](https://www.r-pkg.org/badges/version/pkgtemplate)](https://cran.r-project.org/package=pkgtemplate)
<!-- [![Tinyverse status](https://tinyverse.netlify.com/badge/pkgtemplate)](https://CRAN.R-project.org/package=pkgtemplate) -->
<!-- ![CRAN downloads](https://cranlogs.r-pkg.org/badges/pkgtemplate) -->
<!-- badges: end -->

pkgtemplate provides a template for a new R package.

It includes useful internal
functions.

## Installation

<!-- To install the latest release from [CRAN](https://cran.r-project.org) -->

To install the developmental version from
[GitHub](https://github.com/poissonconsulting/pkgtemplate)

``` r
# install.packages("remotes")
remotes::install_github("poissonconsulting/pkgtemplate")
```

## Demonstration

In order to create a new package the user should go to the pkgtemplate
[GitHub repository](https://github.com/poissonconsulting/pkgtemplate)
and choose ‘Use this template’.

pkgtemplate includes files used for development of Shiny applications.
To remove these from the repository, run:

``` r
pkgtemplate:::cannibalise_shiny(getwd())
```

## Information

For more information see the [Get
Started](https://poissonconsulting.github.io/pkgtemplate/articles/pkgtemplate.html)
vignette.

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/pkgtemplate/issues).

[Pull requests](https://github.com/poissonconsulting/pkgtemplate/pulls)
are always welcome.

### Code of Conduct

Please note that the pkgtemplate project is released with a [Contributor
Code of
Conduct](https://www.contributor-covenant.org/version/1/0/0/code-of-conduct/).
By contributing to this project, you agree to abide by its terms.
