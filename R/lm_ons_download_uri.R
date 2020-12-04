#' Get the URI of a downloadable CSV file created in the ONS API
#'
#' \code{lm_ons_download_uri} returns the URI of a downloadable CSV file based on a
#'    \href{https://developer.ons.gov.uk/filter/}{filter} output ID created by
#'    \code{lm_ons_post_request}.
#'
#' @param base_uri \code{string}.
#' The base URI of the API.
#' @param filter_output_id \code{string}.
#' A filter output ID. See \link{lm_ons_post_request}.
#'
#' @return \code{list}.
#'
#' @examples
#' \dontrun{
#' lm_ons_post_request(base_uri = "https://api.beta.ons.gov.uk/v1/", id = "labour-market", edition = "time-series", version = 18, dimension = NULL, option = NULL)
#' }
#'
#' @export

lm_ons_download_uri <- function(base_uri, filter_output_id) {
  get_request_response <- httr::GET(paste0(base_uri, 'filter-outputs/', filter_output_id))
  httr::content(get_request_response)$downloads$csv$href
}
