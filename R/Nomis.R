library(magrittr)
# library(httr)
# library(jsonlite)

format_get_request <- function(uri) {
  uri %>%
    httr::GET() %>%
    httr::content(as = "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)
}

base_uri <- "http://www.nomisweb.co.uk/"

dataset_uri <- paste0(base_uri, "api/v01/dataset/NM_1_1.data.csv?geography=TYPE486&sex=7&item=1&measures=20100&time=latest&recordlimit=5")
dataset <- format_get_request(dataset_uri)
dataset

datasets_uri <- paste0(base_uri, "api/v01/dataset/def.sdmx.json")
datasets <- format_get_request(datasets_uri)
key_family <- datasets$structure$keyfamilies$keyfamily

example_dataset <- key_family[1,]
id <- example_dataset$id

dimensions <- example_dataset$components.dimension[[1]]$conceptref
example_dimension <- dimensions[1]

options_uri <- paste0(base_uri, "api/v01/dataset/", id, "/", example_dimension, "/def.sdmx.json")
options <- format_get_request(options_uri)
example_option <- options$structure$codelists$codelist$code[[1]]$annotations.annotation[[6]]$annotationtext[3]

# TODO get this working
dataset_uri <- paste0("http://www.nomisweb.co.uk/api/v01/dataset/", id, ".data.csv?", example_dimension, "=", example_option, "&recordlimit=5")
dataset <- format_get_request(dataset_uri)
dataset
