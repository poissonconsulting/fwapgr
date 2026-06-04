# The Collections and their Properies

``` r

library(fwapgr)
```

## Collections

``` r

collection_id <- fwa_collections()$collection_id
collection_id
#>  [1] "hydrosheds.hybas_lev12_v1c"                     
#>  [2] "usgs.wbdhu12"                                   
#>  [3] "whse_basemapping.fwa_approx_borders"            
#>  [4] "whse_basemapping.fwa_assessment_watersheds_poly"
#>  [5] "whse_basemapping.fwa_basins_poly"               
#>  [6] "whse_basemapping.fwa_bays_and_channels_poly"    
#>  [7] "whse_basemapping.fwa_bcboundary"                
#>  [8] "whse_basemapping.fwa_coastlines_sp"             
#>  [9] "whse_basemapping.fwa_glaciers_poly"             
#> [10] "whse_basemapping.fwa_islands_poly"              
#> [11] "whse_basemapping.fwa_lakes_poly"                
#> [12] "whse_basemapping.fwa_linear_boundaries_sp"      
#> [13] "whse_basemapping.fwa_manmade_waterbodies_poly"  
#> [14] "whse_basemapping.fwa_named_streams"             
#> [15] "whse_basemapping.fwa_named_watersheds_poly"     
#> [16] "whse_basemapping.fwa_obstructions_sp"           
#> [17] "whse_basemapping.fwa_rivers_poly"               
#> [18] "whse_basemapping.fwa_stream_networks_sp"        
#> [19] "whse_basemapping.fwa_streams"                   
#> [20] "whse_basemapping.fwa_streams_vw"                
#> [21] "whse_basemapping.fwa_watershed_groups_poly"     
#> [22] "whse_basemapping.fwa_watersheds_poly"           
#> [23] "whse_basemapping.fwa_wetlands_poly"
```

## Collection Properties

``` r

names(collection_id) <- collection_id
lapply(collection_id, fwa_collection_properties)
#> $hydrosheds.hybas_lev12_v1c
#> # A tibble: 2 × 3
#>   name      type   description
#>   <chr>     <chr>  <chr>      
#> 1 hybas_id  number ""         
#> 2 next_down number ""         
#> 
#> $usgs.wbdhu12
#> # A tibble: 20 × 3
#>    name                     type   description
#>    <chr>                    <chr>  <chr>      
#>  1 tnmid                    string ""         
#>  2 metasourceid             string ""         
#>  3 sourcedatadesc           string ""         
#>  4 sourceoriginator         string ""         
#>  5 sourcefeatureid          string ""         
#>  6 loaddate                 string ""         
#>  7 referencegnis_ids        string ""         
#>  8 areaacres                number ""         
#>  9 areasqkm                 number ""         
#> 10 states                   string ""         
#> 11 huc12                    string ""         
#> 12 name                     string ""         
#> 13 hutype                   string ""         
#> 14 humod                    string ""         
#> 15 tohuc                    string ""         
#> 16 noncontributingareaacres number ""         
#> 17 noncontributingareasqkm  number ""         
#> 18 globalid                 string ""         
#> 19 shape_length             number ""         
#> 20 shape_area               number ""         
#> 
#> $whse_basemapping.fwa_approx_borders
#> # A tibble: 2 × 3
#>   name             type   description                                           
#>   <chr>            <chr>  <chr>                                                 
#> 1 approx_border_id number unique identifer                                      
#> 2 border           string a code identifying the border (usa49, ytnwt_60, ab_12…
#> 
#> $whse_basemapping.fwa_assessment_watersheds_poly
#> # A tibble: 24 × 3
#>    name                 type   description
#>    <chr>                <chr>  <chr>      
#>  1 watershed_feature_id number ""         
#>  2 watershed_group_id   number ""         
#>  3 watershed_type       string ""         
#>  4 gnis_id_1            number ""         
#>  5 gnis_name_1          string ""         
#>  6 gnis_id_2            number ""         
#>  7 gnis_name_2          string ""         
#>  8 gnis_id_3            number ""         
#>  9 gnis_name_3          string ""         
#> 10 waterbody_id         number ""         
#> # ℹ 14 more rows
#> 
#> $whse_basemapping.fwa_basins_poly
#> # A tibble: 4 × 3
#>   name            type   description                                            
#>   <chr>           <chr>  <chr>                                                  
#> 1 basin_id        number Basin unique identifier                                
#> 2 basin_name      string Basin name, eg Thompson River                          
#> 3 wscode_ltree    string The watershed code associated with the stream at the o…
#> 4 localcode_ltree string The local watershed code associated with the stream at…
#> 
#> $whse_basemapping.fwa_bays_and_channels_poly
#> # A tibble: 6 × 3
#>   name               type   description
#>   <chr>              <chr>  <chr>      
#> 1 bay_and_channel_id number ""         
#> 2 bay_channel_type   string ""         
#> 3 gnis_id            number ""         
#> 4 gnis_name          string ""         
#> 5 area_ha            number ""         
#> 6 feature_code       string ""         
#> 
#> $whse_basemapping.fwa_bcboundary
#> # A tibble: 1 × 3
#>   name          type   description        
#>   <chr>         <chr>  <chr>              
#> 1 bcboundary_id number Boundary polygon id
#> 
#> $whse_basemapping.fwa_coastlines_sp
#> # A tibble: 14 × 3
#>    name                     type   description
#>    <chr>                    <chr>  <chr>      
#>  1 linear_feature_id        number ""         
#>  2 watershed_group_id       number ""         
#>  3 edge_type                number ""         
#>  4 blue_line_key            number ""         
#>  5 watershed_key            number ""         
#>  6 fwa_watershed_code       string ""         
#>  7 local_watershed_code     string ""         
#>  8 watershed_group_code     string ""         
#>  9 downstream_route_measure number ""         
#> 10 length_metre             number ""         
#> 11 feature_source           string ""         
#> 12 feature_code             string ""         
#> 13 wscode_ltree             string ""         
#> 14 localcode_ltree          string ""         
#> 
#> $whse_basemapping.fwa_glaciers_poly
#> # A tibble: 24 × 3
#>    name               type   description
#>    <chr>              <chr>  <chr>      
#>  1 waterbody_poly_id  number ""         
#>  2 watershed_group_id number ""         
#>  3 waterbody_type     string ""         
#>  4 waterbody_key      number ""         
#>  5 area_ha            number ""         
#>  6 gnis_id_1          number ""         
#>  7 gnis_name_1        string ""         
#>  8 gnis_id_2          number ""         
#>  9 gnis_name_2        string ""         
#> 10 gnis_id_3          number ""         
#> # ℹ 14 more rows
#> 
#> $whse_basemapping.fwa_islands_poly
#> # A tibble: 14 × 3
#>    name                 type   description
#>    <chr>                <chr>  <chr>      
#>  1 island_id            number ""         
#>  2 island_type          string ""         
#>  3 gnis_id_1            number ""         
#>  4 gnis_name_1          string ""         
#>  5 gnis_id_2            number ""         
#>  6 gnis_name_2          string ""         
#>  7 gnis_id_3            number ""         
#>  8 gnis_name_3          string ""         
#>  9 fwa_watershed_code   string ""         
#> 10 local_watershed_code string ""         
#> 11 area_ha              number ""         
#> 12 feature_code         string ""         
#> 13 wscode_ltree         string ""         
#> 14 localcode_ltree      string ""         
#> 
#> $whse_basemapping.fwa_lakes_poly
#> # A tibble: 24 × 3
#>    name               type   description
#>    <chr>              <chr>  <chr>      
#>  1 waterbody_poly_id  number ""         
#>  2 watershed_group_id number ""         
#>  3 waterbody_type     string ""         
#>  4 waterbody_key      number ""         
#>  5 area_ha            number ""         
#>  6 gnis_id_1          number ""         
#>  7 gnis_name_1        string ""         
#>  8 gnis_id_2          number ""         
#>  9 gnis_name_2        string ""         
#> 10 gnis_id_3          number ""         
#> # ℹ 14 more rows
#> 
#> $whse_basemapping.fwa_linear_boundaries_sp
#> # A tibble: 15 × 3
#>    name                     type   description
#>    <chr>                    <chr>  <chr>      
#>  1 linear_feature_id        number ""         
#>  2 watershed_group_id       number ""         
#>  3 edge_type                number ""         
#>  4 waterbody_key            number ""         
#>  5 blue_line_key            number ""         
#>  6 watershed_key            number ""         
#>  7 fwa_watershed_code       string ""         
#>  8 local_watershed_code     string ""         
#>  9 watershed_group_code     string ""         
#> 10 downstream_route_measure number ""         
#> 11 length_metre             number ""         
#> 12 feature_source           string ""         
#> 13 feature_code             string ""         
#> 14 wscode_ltree             string ""         
#> 15 localcode_ltree          string ""         
#> 
#> $whse_basemapping.fwa_manmade_waterbodies_poly
#> # A tibble: 24 × 3
#>    name               type   description
#>    <chr>              <chr>  <chr>      
#>  1 waterbody_poly_id  number ""         
#>  2 watershed_group_id number ""         
#>  3 waterbody_type     string ""         
#>  4 waterbody_key      number ""         
#>  5 area_ha            number ""         
#>  6 gnis_id_1          number ""         
#>  7 gnis_name_1        string ""         
#>  8 gnis_id_2          number ""         
#>  9 gnis_name_2        string ""         
#> 10 gnis_id_3          number ""         
#> # ℹ 14 more rows
#> 
#> $whse_basemapping.fwa_named_streams
#> # A tibble: 5 × 3
#>   name                 type   description                                       
#>   <chr>                <chr>  <chr>                                             
#> 1 named_streams_id     number Named stream unique identifier                    
#> 2 gnis_name            string The BCGNIS (BC Geographical Names Information Sys…
#> 3 blue_line_key        number The blue line key of the named stream, see FWA do…
#> 4 stream_order         number The maximum stream order associated with the stre…
#> 5 watershed_group_code string The watershed group code associated with the name…
#> 
#> $whse_basemapping.fwa_named_watersheds_poly
#> # A tibble: 11 × 3
#>    name               type   description
#>    <chr>              <chr>  <chr>      
#>  1 named_watershed_id number ""         
#>  2 gnis_id            number ""         
#>  3 gnis_name          string ""         
#>  4 blue_line_key      number ""         
#>  5 watershed_key      number ""         
#>  6 fwa_watershed_code string ""         
#>  7 stream_order       number ""         
#>  8 stream_magnitude   number ""         
#>  9 area_ha            number ""         
#> 10 feature_code       string ""         
#> 11 wscode_ltree       string ""         
#> 
#> $whse_basemapping.fwa_obstructions_sp
#> # A tibble: 16 × 3
#>    name                 type   description
#>    <chr>                <chr>  <chr>      
#>  1 obstruction_id       number ""         
#>  2 watershed_group_id   number ""         
#>  3 linear_feature_id    number ""         
#>  4 gnis_id              number ""         
#>  5 gnis_name            string ""         
#>  6 obstruction_type     string ""         
#>  7 blue_line_key        number ""         
#>  8 watershed_key        number ""         
#>  9 fwa_watershed_code   string ""         
#> 10 local_watershed_code string ""         
#> 11 watershed_group_code string ""         
#> 12 route_measure        number ""         
#> 13 feature_source       string ""         
#> 14 feature_code         string ""         
#> 15 wscode_ltree         string ""         
#> 16 localcode_ltree      string ""         
#> 
#> $whse_basemapping.fwa_rivers_poly
#> # A tibble: 24 × 3
#>    name               type   description
#>    <chr>              <chr>  <chr>      
#>  1 waterbody_poly_id  number ""         
#>  2 watershed_group_id number ""         
#>  3 waterbody_type     string ""         
#>  4 waterbody_key      number ""         
#>  5 area_ha            number ""         
#>  6 gnis_id_1          number ""         
#>  7 gnis_name_1        string ""         
#>  8 gnis_id_2          number ""         
#>  9 gnis_name_2        string ""         
#> 10 gnis_id_3          number ""         
#> # ℹ 14 more rows
#> 
#> $whse_basemapping.fwa_stream_networks_sp
#> # A tibble: 26 × 3
#>    name                     type   description
#>    <chr>                    <chr>  <chr>      
#>  1 linear_feature_id        number ""         
#>  2 watershed_group_id       number ""         
#>  3 edge_type                number ""         
#>  4 blue_line_key            number ""         
#>  5 watershed_key            number ""         
#>  6 fwa_watershed_code       string ""         
#>  7 local_watershed_code     string ""         
#>  8 watershed_group_code     string ""         
#>  9 downstream_route_measure number ""         
#> 10 length_metre             number ""         
#> # ℹ 16 more rows
#> 
#> $whse_basemapping.fwa_streams
#> # A tibble: 24 × 3
#>    name                     type   description                                  
#>    <chr>                    <chr>  <chr>                                        
#>  1 linear_feature_id        number See FWA documentation                        
#>  2 edge_type                number See FWA documentation                        
#>  3 blue_line_key            number See FWA documentation                        
#>  4 watershed_key            number See FWA documentation                        
#>  5 wscode                   string FWA watershed code as postgres ltree type, w…
#>  6 localcode                string FWA local watershed code as postgres ltree t…
#>  7 watershed_group_code     string See FWA documentation                        
#>  8 downstream_route_measure number See FWA documentation                        
#>  9 upstream_route_measure   number See FWA documentation                        
#> 10 length_metre             number See FWA documentation                        
#> # ℹ 14 more rows
#> 
#> $whse_basemapping.fwa_streams_vw
#> # A tibble: 24 × 3
#>    name                     type   description                                  
#>    <chr>                    <chr>  <chr>                                        
#>  1 linear_feature_id        number See FWA documentation                        
#>  2 edge_type                number See FWA documentation                        
#>  3 blue_line_key            number See FWA documentation                        
#>  4 watershed_key            number See FWA documentation                        
#>  5 wscode                   string FWA watershed code as postgres ltree type, w…
#>  6 localcode                string FWA local watershed code as postgres ltree t…
#>  7 watershed_group_code     string See FWA documentation                        
#>  8 downstream_route_measure number See FWA documentation                        
#>  9 upstream_route_measure   number See FWA documentation                        
#> 10 length_metre             number See FWA documentation                        
#> # ℹ 14 more rows
#> 
#> $whse_basemapping.fwa_watershed_groups_poly
#> # A tibble: 10 × 3
#>    name                 type   description
#>    <chr>                <chr>  <chr>      
#>  1 watershed_group_id   number ""         
#>  2 watershed_group_code string ""         
#>  3 watershed_group_name string ""         
#>  4 area_ha              number ""         
#>  5 feature_code         string ""         
#>  6 fwa_watershed_code   string ""         
#>  7 local_watershed_code string ""         
#>  8 wscode_ltree         string ""         
#>  9 localcode_ltree      string ""         
#> 10 basin_id             number ""         
#> 
#> $whse_basemapping.fwa_watersheds_poly
#> # A tibble: 36 × 3
#>    name                 type   description
#>    <chr>                <chr>  <chr>      
#>  1 watershed_feature_id number ""         
#>  2 watershed_group_id   number ""         
#>  3 watershed_type       string ""         
#>  4 gnis_id_1            number ""         
#>  5 gnis_name_1          string ""         
#>  6 gnis_id_2            number ""         
#>  7 gnis_name_2          string ""         
#>  8 gnis_id_3            number ""         
#>  9 gnis_name_3          string ""         
#> 10 waterbody_id         number ""         
#> # ℹ 26 more rows
#> 
#> $whse_basemapping.fwa_wetlands_poly
#> # A tibble: 24 × 3
#>    name               type   description
#>    <chr>              <chr>  <chr>      
#>  1 waterbody_poly_id  number ""         
#>  2 watershed_group_id number ""         
#>  3 waterbody_type     string ""         
#>  4 waterbody_key      number ""         
#>  5 area_ha            number ""         
#>  6 gnis_id_1          number ""         
#>  7 gnis_name_1        string ""         
#>  8 gnis_id_2          number ""         
#>  9 gnis_name_2        string ""         
#> 10 gnis_id_3          number ""         
#> # ℹ 14 more rows
```
