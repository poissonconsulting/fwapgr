# Freshwater Atlas Locate Along Interval

Gets a regularly spaced set of points between two river metres.

## Usage

``` r
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
```

## Arguments

- blue_line_key:

  A positive whole number of the stream blue line key.

- interval_length:

  An integer of the interval distance in meters.

- start_measure:

  An integer of the distance in meters upstream from the river mouth to
  start from.

- end_measure:

  An integer of the distance in meters upstream from the river mouth to
  end at.

- bbox:

  A vector of four numbers indicating bounding box to limit output
  features to, e.g. `c(minLon, minLat, maxLon, maxLat)`.

- properties:

  A vector of strings of the column names to include. If NULL (default),
  all columns are retained.

- transform:

  A character vector with the name of the [*valid
  transform*](https://github.com/CrunchyData/pg_featureserv/blob/master/config/pg_featureserv.toml.example#L29)
  function followed by the parameter values (e.g. c("ST_Simplify", 100))

- epsg:

  A positive whole number of the epsg to transform features to.

- nocache:

  A flag specifying whether or not to cache results.

## Value

An sf object.

## See also

[API
documentation](https://features.hillcrestgeo.ca/fwa/functions/fwa_locatealonginterval.html)

Other functions:
[`fwa_index_point()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_index_point.md),
[`fwa_locate_along()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_locate_along.md),
[`fwa_watershed_at_measure()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_at_measure.md),
[`fwa_watershed_hex()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_hex.md),
[`fwa_watershed_stream()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_stream.md),
[`hydroshed()`](https://poissonconsulting.github.io/fwapgr/reference/hydroshed.md)

## Examples

``` r
fwa_locate_along_interval(356308001, interval_length = 10, start_measure = 0)
#> Simple feature collection with 1924 features and 2 fields
#> Geometry type: POINT
#> Dimension:     XYZ
#> Bounding box:  xmin: -122.0155 ymin: 49.11263 xmax: -121.8697 ymax: 49.16804
#> z_range:       zmin: 7.5 zmax: 214.8791
#> Geodetic CRS:  WGS 84
#> # A data frame: 1,924 × 3
#>    downstream_route_measure index                        geometry
#>  *                    <int> <int>                     <POINT [°]>
#>  1                        0     0    Z (-122.0155 49.16804 9.626)
#>  2                       10     1 Z (-122.0154 49.16795 9.643175)
#>  3                       20     2 Z (-122.0154 49.16787 9.660349)
#>  4                       30     3 Z (-122.0153 49.16778 9.677524)
#>  5                       40     4  Z (-122.0153 49.1677 9.694698)
#>  6                       50     5 Z (-122.0152 49.16762 9.711873)
#>  7                       60     6 Z (-122.0152 49.16753 9.729048)
#>  8                       70     7 Z (-122.0151 49.16745 9.746222)
#>  9                       80     8 Z (-122.0151 49.16736 9.763397)
#> 10                       90     9  Z (-122.015 49.16728 9.780571)
#> # ℹ 1,914 more rows
```
