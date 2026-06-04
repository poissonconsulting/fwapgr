# Freshwater Atlas Watershed at Downstream Route Measure

Gets a polygon of the watershed at a specified river metre.

## Usage

``` r
fwa_watershed_at_measure(
  blue_line_key,
  downstream_route_measure = 0,
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

- downstream_route_measure:

  A positive number of the river metre.

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

## Details

The function selects and aggregate all the fundamental watershed
polygons upstream of the fundamental watershed in which the point lies.

Depending on where the point is in the fundamental watershed one of four
things can happen to the fundamental watershed.

1.  If the point is \< 50 m upstream from the bottom of the fundamental
    watershed then the fundamental watershed is included in the
    aggregation (recorded as KEEP in the refine_method property).

2.  Else if the point is \< 100m downstream from the top of the
    fundamental watershed then the fundamental watershed is not included
    in the aggregation (recorded as DROP in the refine_method property).

3.  Else if the point is on a polygonal river/canal the fundamental
    watershed is cut across the banks of the river before being included
    in the aggregation (recorded as CUT in the refine_method property).

4.  Otherwise something else happens (recorded as DEM in the
    refine_method property).

## See also

[API
documentation](https://features.hillcrestgeo.ca/fwa/functions/fwa_watershedatmeasure.html)

Other functions:
[`fwa_index_point()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_index_point.md),
[`fwa_locate_along()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_locate_along.md),
[`fwa_locate_along_interval()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_locate_along_interval.md),
[`fwa_watershed_hex()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_hex.md),
[`fwa_watershed_stream()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_watershed_stream.md),
[`hydroshed()`](https://poissonconsulting.github.io/fwapgr/reference/hydroshed.md)

## Examples

``` r
fwa_watershed_at_measure(356308001, downstream_route_measure = 10000)
#> Simple feature collection with 1 feature and 4 fields
#> Geometry type: POLYGON
#> Dimension:     XY
#> Bounding box:  xmin: -121.9625 ymin: 49.09301 xmax: -121.8528 ymax: 49.14291
#> Geodetic CRS:  WGS 84
#> # A data frame: 1 × 5
#>   area_ha localcode_ltree   refine_method wscode_ltree                  geometry
#> *   <dbl> <chr>             <chr>         <chr>                    <POLYGON [°]>
#> 1   2364. 100.070889.490268 DEM           100.070889   ((-121.9625 49.10385, -1…
```
