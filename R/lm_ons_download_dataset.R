#' Download a dataset from the ONS API
#'
#' \code{lm_ons_download_dataset} returns the URI of a downloadable CSV file based on a
#'    \href{https://developer.ons.gov.uk/filter/}{filter} output ID created by
#'    \code{lm_ons_request_dataset}.
#'
#' @param base_uri \code{string}.
#' The base URI of the API.
#' @param filter_output_id \code{string}.
#' A filter output ID. See \link{lm_ons_request_dataset}.
#'
#' @return \code{list}.
#'
#' @examples
#' \dontrun{
#' lm_ons_download_dataset(base_uri = "https://api.beta.ons.gov.uk/v1/", filter_output_id = "aa999999-8888-777b-c666-d5e555f44gh3")
#' }
#'
#' @export

lm_ons_download_dataset <- function(base_uri, filter_output_id) {
  get_request_response <- httr::GET(paste0(base_uri, 'filter-outputs/', filter_output_id))
  download_uri <- httr::content(get_request_response)$downloads$csv$href
  utils::read.csv(download_uri)
}
