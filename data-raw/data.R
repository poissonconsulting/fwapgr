library(tibble)
library(sf)
library(magrittr)

gnis_stream <- fwa_feature("fwa_named_streams",
                           columns = c("fwa_stream_networks_label_id",
                                       "gnis_name",
                                       "stream_order",
                                       "watershed_group_code"))

gnis_stream <- as_tibble(st_set_geometry(gnis_stream, NULL))
gnis_stream$gnis_name %<>% as.character()
gnis_stream$stream_order %<>% as.character()

use_data(gnis_stream, internal = TRUE, overwrite = TRUE)

