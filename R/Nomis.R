# # TODO add nomis instructions/examples to readme
# #
# # library(magrittr)
# # library(httr)
# # library(jsonlite)
#
#
# base_uri <- "http://www.nomisweb.co.uk/"
#
# dataset_uri <- paste0(base_uri, "api/v01/dataset/NM_1_1.data.csv?geography=TYPE486&sex=7&item=1&measures=20100&time=latest&recordoffset=-5")
# dataset <- lm_format_get_request(dataset_uri)
# dataset
#
# datasets_uri <- paste0(base_uri, "api/v01/dataset/def.sdmx.json")
# datasets <- format_get_request(datasets_uri)
# key_family <- datasets$structure$keyfamilies$keyfamily
#
# example_dataset <- key_family[1,]
# id <- example_dataset$id
#
# dimensions <- example_dataset$components.dimension[[1]]$conceptref
# example_dimension <- dimensions[1]
#
# options_uri <- paste0(base_uri, "api/v01/dataset/", id, "/", example_dimension, "/def.sdmx.json")
# options <- format_get_request(options_uri)
# example_option <- options$structure$codelists$codelist$code[[1]]$annotations.annotation[[6]]$annotationtext[3]
#
# # TODO get this working
# dataset_uri <- paste0("http://www.nomisweb.co.uk/api/v01/dataset/", id, ".data.csv?", example_dimension, "=", example_option, "&recordlimit=5")
# dataset <- format_get_request(dataset_uri)
# dataset
#
# base_uri <- "http://www.nomisweb.co.uk/"
# variables <- c("id", "uri", "description.value", "name.value", "components.dimension")
#
# datasets <- lm_nomis_datasets(base_uri = "http://www.nomisweb.co.uk/", variables = c("id", "uri", "description.value", "name.value", "components.dimension"))
# dimensions <- lm_nomis_dataset_dimensions(dataset_id = "NM_1_1", datasets_list = datasets)
#
# geography_options <- lm_nomis_dataset_dimension_options(base_uri = "http://www.nomisweb.co.uk/", dataset_id = "NM_1_1", dataset_dimension = "GEOGRAPHY")
# sex_options <- lm_nomis_dataset_dimension_options(base_uri = "http://www.nomisweb.co.uk/", dataset_id = "NM_1_1", dataset_dimension = "SEX")
# item_options <- lm_nomis_dataset_dimension_options(base_uri = "http://www.nomisweb.co.uk/", dataset_id = "NM_1_1", dataset_dimension = "ITEM")
# measures_options <- lm_nomis_dataset_dimension_options(base_uri = "http://www.nomisweb.co.uk/", dataset_id = "NM_1_1", dataset_dimension = "MEASURES")
# freq_options <- lm_nomis_dataset_dimension_options(base_uri = "http://www.nomisweb.co.uk/", dataset_id = "NM_1_1", dataset_dimension = "FREQ")
#
# geography_options
# sex_options
# item_options
# measures_options
# freq_options
#
# filter_string = "?geography=2092957697"
# row_limit = 5
# dataset <- lm_nomis_download_dataset(base_uri, "NM_1_1", filter_string = NULL, row_limit = row_limit)
#
