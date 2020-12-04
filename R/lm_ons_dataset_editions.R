#' Return a list of editions of a dataset in the ONS API
#'
#' \code{lm_ons_dataset_editions} returns a list of
#'    \href{https://developer.ons.gov.uk/dataset/datasets-id-editions-edition/}{editions} of a
#'    \href{https://developer.ons.gov.uk/dataset/datasets-id/}{dataset} available on the
#'    \href{https://developer.ons.gov.uk/}{ONS API}.
#'
#' @param base_uri \code{string}.
#' The base URI to connect to ('datasets/' +  \code{dataset_id} + '/editions' is appended in the function).
#' @param dataset_id \code{string}.
#' An ID of an existing dataset in the ONS API. See \link{lm_ons_datasets}.
#'
#' @return \code{string} if one edition available, \code{list} if multiple.
#'
#' @examples
#' \dontrun{
#' lm_ons_dataset_editions(base_uri = "https://api.beta.ons.gov.uk/v1/", dataset_id = "labour-market")
#' }
#'
#' @export

lm_ons_dataset_editions <- function(base_uri, dataset_id) {
  editions_uri <- paste0(base_uri, 'datasets/', dataset_id, '/editions')
  editions <-  lm_format_get_request(editions_uri)
  editions$items$edition
}
