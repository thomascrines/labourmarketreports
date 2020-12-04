#' Return list of dimensions of a dataset in the ONS API
#'
#' \code{lm_ons_dataset_dimensions} returns a list of dimensions of a dataset available from the ONS API.
#'
#' @param base_uri \code{string}.
#' The base URI to connect to.
#' ('datasets/' +  \code{dataset_id} + '/editions/' + \code{dataset_edition} + '/versions/' + \code{dataset_version} + '/dimensions' is appended in the function).
#' @param dataset_id \code{string}.
#' An ID of an existing dataset in the ONS API .
#' @param dataset_edition \code{string}.
#' An edition ID of an existing dataset in the ONS API .
#' @param dataset_version \code{string}.
#' A version ID of an existing dataset in the ONS API .
#'
#' @return \code{string} if one dimension available, \code{list} if multiple.
#'
#' @examples
#' \dontrun{
#' lm_ons_dataset_dimensions("https://api.beta.ons.gov.uk/v1/", "labour-market", "time-series", "2")
#' }
#'
#' @export

lm_ons_dataset_dimensions <- function(base_uri, dataset_id, dataset_edition, dataset_version) {
  dimensions_uri <- paste0(base_uri, 'datasets/', dataset_id, '/editions/', dataset_edition, '/versions/', dataset_version, '/dimensions')
  dimensions <- lm_format_get_request(dimensions_uri)
  dimensions$items$name
}
