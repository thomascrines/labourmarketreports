#' Return list of dimensions of a dataset in the ONS API
#'
#' \code{lm_ons_dataset_dimensions} returns a list of
#'    \href{https://developer.ons.gov.uk/dataset/datasets-id-editions-edition-versions-version-dimensions/}{dimensions} of a
#'    \href{https://developer.ons.gov.uk/dataset/datasets-id/}{dataset} available on the
#'    \href{https://developer.ons.gov.uk/}{ONS API}.
#'
#' @param base_uri \code{string}.
#' The base URI to connect to.
#' ('datasets/' +  \code{dataset_id} + '/editions/' + \code{dataset_edition} + '/versions/' + \code{dataset_version} + '/dimensions' is appended in the function).
#' @param dataset_id \code{string}.
#' An ID of an existing dataset in the ONS API. See \link{lm_ons_datasets}.
#' @param dataset_edition \code{string}.
#' An edition ID of an existing dataset in the ONS API. See \link{lm_ons_dataset_editions}.
#' @param dataset_version \code{string}.
#' A version ID of an existing dataset in the ONS API. See \link{lm_ons_dataset_versions}.
#'
#' @return \code{string} if one dimension available, \code{list} if multiple.
#'
#' @examples
#' \dontrun{
#' lm_ons_dataset_dimensions(base_uri = "https://api.beta.ons.gov.uk/v1/", dataset_id = "labour-market", dataset_edition = "time-series", dataset_version = "2")
#' }
#'
#' @export

lm_ons_dataset_dimensions <- function(base_uri, dataset_id, dataset_edition, dataset_version) {
  dimensions_uri <- paste0(base_uri, 'datasets/', dataset_id, '/editions/', dataset_edition, '/versions/', dataset_version, '/dimensions')
  dimensions <- lm_format_get_request(dimensions_uri)
  dimensions$items$name
}
