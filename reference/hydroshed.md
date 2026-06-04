# Hydroshed

Gets aggregated boundary of all [hydroshed](https://www.hydrosheds.org)
polygons upstream of the provided location.

## Usage

``` r
hydroshed(
  x,
  y,
  srid = 4326,
  bbox = NULL,
  properties = NULL,
  transform = NULL,
  epsg = 4326,
  nocache = getOption("fwa.nocache", FALSE)
)
```

## Arguments

- x:

  A number of the x coordinate.

- y:

  A number of the y coordinate.

- srid:

  A positive whole number of the epsg of the coordinates.

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
documentation](https://features.hillcrestgeo.ca/fwa/functions/hydroshed.html)

Other functions:
[`fwa_index_point()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_index_point.md),
[`fwa_locate_along()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_locate_along.md),
[`fwa_locate_along_interval()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_locate_along_interval.md),
[`fwa_watershed_at_measure()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_at_measure.md),
[`fwa_watershed_hex()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_hex.md),
[`fwa_watershed_stream()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_stream.md)

## Examples

``` r
hydroshed(x = -132.26, y = 53.36)
#> Simple feature collection with 1 feature and 0 fields
#> Geometry type: POLYGON
#> Dimension:     XY
#> Bounding box:  xmin: -132.384 ymin: 53.25479 xmax: -132.1535 ymax: 53.38813
#> Geodetic CRS:  WGS 84
#> # A data frame: 1 × 1
#>                                                                         geometry
#> *                                                                  <POLYGON [°]>
#> 1 ((-132.275 53.38333, -132.2601 53.38369, -132.2566 53.38715, -132.2542 53.387…
```
