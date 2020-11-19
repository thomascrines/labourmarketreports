#' Make POST request to ONS api and return dataset from CSV
#'
#' \code{lm_format_get_request} creates a request body based on the \href{https://developer.ons.gov.uk/}{ONS API} structure
#' and sends it as a POST request to a provided URI.
#' The returned ID is then used to determine the URI where a CSV download has been created and a get request is sent,
#' with the resulting CSV being read into an R dataframe.
#'
#' @param base_uri \code{string}.
#' The base URI used to determine the URIs to make GET and POST requests to.
#' @param id \code{string}.
#' The ID of a datasetin the ONS API.
#' @param edition \code{string}.
#' The edition of the dataset in the ONS API.
#' @param version \code{double}.
#' The version of the dataset in the ONS API.
#' @param dimension \code{string}.
#' (Default: \code{NULL}). The name of a dimension to filter on.
#' @param option \code{string}.
#' (Default: \code{NULL}). The option to use to filter by dimension.
#'
#' @return \code{list}.
#'
#' @examples
#' \dontrun{
#' lm_ons_post_request(base_uri = "https://api.beta.ons.gov.uk/v1/", id = "labour-market", edition = "time-series", version = 18, dimension = NULL, option = NULL)
#' }
#'
#' @export

lm_ons_post_request <- function(base_uri, id, edition, version, dimension = NULL, option = NULL) {

  post_request_uri <- paste0(base_uri, 'filters?submitted=true')

  post_request_body <- paste0('{"dataset": {"id": "', id,
                              '", "edition": "', edition,
                              '", "version": ', version,
                              '}, "dimensions": [')

  if (is.null(dimension)) {
    post_request_body <- paste0(post_request_body, ']}')

    } else {

    post_request_body <- paste0(post_request_body, '{"name": "', dimension, '", "options": ["', option, '"]}]}')
  }

  post_request_response <- httr::POST(url <- post_request_uri, body = post_request_body)
  filter_output_id <- httr::content(post_request_response)$links$filter_output$id
  get_request_response <- httr::GET(paste0(base_uri, 'filter-outputs/', filter_output_id))
  download_uri <- httr::content(get_request_response)$downloads$csv$href
  read.csv(download_uri)
}
