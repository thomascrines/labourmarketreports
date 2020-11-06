library(magrittr)
# library(httr)
# library(jsonlite)

# Simplest example, without filtering
post_request_uri <- 'https://api.beta.ons.gov.uk/v1/filters?submitted=true'
post_request_body <- paste0('{"dataset": {"id": "labour-market", "edition": "time-series", "version": 18}, "dimensions": []}')
post_request_response <- httr::POST(url <- post_request_uri, body = post_request_body)

filter_output_id <- httr::content(post_request_response)$links$filter_output$id
get_request_response <- httr::GET(paste0('https://api.beta.ons.gov.uk/v1/filter-outputs/', filter_output_id))

download_uri <- httr::content(get_request_response)$downloads$csv$href
data <- read.csv(download_uri)
