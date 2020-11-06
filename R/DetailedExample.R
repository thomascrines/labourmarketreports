library(magrittr)
# library(httr)
# library(jsonlite)

# Function to send get request and convert response from JSON to R list
format_get_request <- function(uri) {
  uri %>%
    httr::GET() %>%
    httr::content(as = "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)
}

# Declare base uri, change to access development API
# https://developer.ons.gov.uk/
base_uri <- 'https://api.beta.ons.gov.uk/v1/'

# Get details of all datasets available in API
# https://developer.ons.gov.uk/dataset/datasets/
datasets_uri <- paste0(base_uri, 'datasets')
datasets <- format_get_request(datasets_uri)

# Get example ID from datasets (when I pulled data, row 19 was 'labour-market')
id <- datasets$items$id[19]

# Get metadata of a specific dataset
# https://developer.ons.gov.uk/dataset/datasets-id/
metadata_uri <- paste0(base_uri, 'datasets/', id)
metadata <- format_get_request(metadata_uri)

# Get latest version from metadata
version = metadata$link$latest_version$id

# Get available editions of a specific dataset
# https://developer.ons.gov.uk/dataset/datasets-id-editions/
editions_uri <- paste0(base_uri, 'datasets/', id, '/editions')
editions <-  format_get_request(editions_uri)

# Get edition from editions
edition = editions$items$edition

# Get dimensions of dataset
# https://developer.ons.gov.uk/dataset/datasets-id-editions-edition-versions-version-dimensions/
dimensions_uri <- paste0(base_uri, 'datasets/', id, '/editions/', edition, '/versions/', version, '/dimensions')
dimensions <- format_get_request(dimensions_uri)

# Get example dimension name
dimension <- dimensions$items$name[1]

# Get available options for a dimension
# https://developer.ons.gov.uk/dataset/datasets-id-editions-edition-versions-version-dimensions-dimension-options/
options_uri <- paste0(base_uri, 'datasets/', id, '/editions/', edition, '/versions/', version, '/dimensions/', dimension, '/options')
options <- format_get_request(options_uri)

# Get example option
option <- options$items$option[1]

# Return a filtered dataset
# https://developer.ons.gov.uk/filters/, https://developer.ons.gov.uk/filter/filters/
post_request_body <- paste0('{"dataset": {"id": "', id,
                            '", "edition": "', edition,
                            '", "version": ', version,
                            '}, "dimensions": [{"name": "', dimension, '", "options": ["', option, '"]}]}')

post_request_uri <- paste0(base_uri, 'filters?submitted=true')

post_request_response <- httr::POST(url <- post_request_uri, body = post_request_body)
filter_output_id <- httr::content(post_request_response)$links$filter_output$id

get_request_response <- httr::GET(paste0(base_uri, 'filter-outputs/', filter_output_id))
download_uri <- httr::content(get_request_response)$downloads$csv$href

data <- read.csv(download_uri)
