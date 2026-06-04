# Freshwater Atlas Collections

Get information about the collections.

## Usage

``` r
fwa_collections(nocache = getOption("fwa.nocache", FALSE))

fwa_meta_collections(nocache = getOption("fwa.nocache", FALSE))
```

## Arguments

- nocache:

  A flag specifying whether or not to cache results.

## Value

A tibble.

## Functions

- `fwa_meta_collections()`: Freshwater Atlas Collections

  **\[soft-deprecated\]**

## See also

Other collections:
[`fwa_collection()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_query_collection.md),
[`fwa_collection_properties()`](https://poissonconsulting.github.io/fwapgr/reference/fwa_collection_properties.md)

## Examples

``` r
fwa_collections()
#> # A tibble: 23 × 4
#>    collection_id                            description extent$spatial$crs links
#>    <chr>                                    <chr>       <chr>              <lis>
#>  1 hydrosheds.hybas_lev12_v1c               HydroBasin… http://www.opengi… <df> 
#>  2 usgs.wbdhu12                             USGS Natio… http://www.opengi… <df> 
#>  3 whse_basemapping.fwa_approx_borders      lines of l… http://www.opengi… <df> 
#>  4 whse_basemapping.fwa_assessment_watersh… Data for t… http://www.opengi… <df> 
#>  5 whse_basemapping.fwa_basins_poly         Large BC w… http://www.opengi… <df> 
#>  6 whse_basemapping.fwa_bays_and_channels_… Data for t… http://www.opengi… <df> 
#>  7 whse_basemapping.fwa_bcboundary          Boundary o… http://www.opengi… <df> 
#>  8 whse_basemapping.fwa_coastlines_sp       Data for t… http://www.opengi… <df> 
#>  9 whse_basemapping.fwa_glaciers_poly       Data for t… http://www.opengi… <df> 
#> 10 whse_basemapping.fwa_islands_poly        Data for t… http://www.opengi… <df> 
#> # ℹ 13 more rows
#> # ℹ 1 more variable: extent$spatial$bbox <list>
```
