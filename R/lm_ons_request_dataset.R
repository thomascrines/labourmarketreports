#' Make a POST request to the ONS API and return a filter output ID
#'
#' \code{lm_ons_request_dataset} creates a POST request body based on the
#'    \href{https://developer.ons.gov.uk/}{ONS API}
#'    \href{https://developer.ons.gov.uk/filter/filters/}{filter} structure
#'    and sends the request a provided URI. A
#'    \href{https://developer.ons.gov.uk/filter/filter-outputs-filter_output_id/}{filter output ID} is returned, which can be passed
#'    \link{lm_ons_download_uri}.
#'
#' @param base_uri \code{string}.
#'   The base URI to connect to. ('filters?submitted=true' is appended in the function).
#' @param dataset_id \code{string}.
#' An ID of an existing dataset in the ONS API. See \link{lm_ons_datasets}.
#' @param dataset_edition \code{string}.
#' An edition ID of an existing dataset in the ONS API. See \link{lm_ons_dataset_editions}.
#' @param dataset_version \code{string}.
#' A version ID of an existing dataset in the ONS API. See \link{lm_ons_dataset_versions}.
#' @param dataset_dimension \code{string}.
#' The name of an existing dimension in the specified dataset. See \link{lm_ons_dataset_dimensions}.
#' @param dataset_dimension_option \code{string}.
#' (Default: \code{NULL}). The option to use to filter by dimension. See \link{lm_ons_dataset_dimension_options}.
#'
#' @return \code{string}.
#'
#' @examples
#' \dontrun{
#' lm_ons_request_dataset(base_uri = "https://api.beta.ons.gov.uk/v1/", dataset_id = "labour-market", dataset_edition = "time-series", dataset_version = "2")
#' lm_ons_request_dataset(base_uri = "https://api.beta.ons.gov.uk/v1/", dataset_id = "labour-market", dataset_edition = "time-series", dataset_version = "2", dataset_dimension = "agegroups", dataset_dimension_option = "16-17")
#' }
#'
#' @export

lm_ons_request_dataset <- function(base_uri, dataset_id, dataset_edition, dataset_version, dataset_dimension = NULL, dataset_dimension_option = NULL) {
  post_request_uri <- paste0(base_uri, 'filters?submitted=true')

  post_request_body <- paste0('{"dataset": {"id": "', dataset_id,
                              '", "edition": "', dataset_edition,
                              '", "version": ', dataset_version,
                              '}, "dimensions": [')

  if (is.null(dataset_dimension)) {
    post_request_body <- paste0(post_request_body, ']}')
  } else {
    post_request_body <- paste0(post_request_body, '{"name": "', dataset_dimension, '", "options": ["', dataset_dimension_option, '"]}]}')
  }

  post_request_response <- httr::POST(url <- post_request_uri, body = post_request_body)
  httr::content(post_request_response)$links$filter_output$id
}
