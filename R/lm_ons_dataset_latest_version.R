#' Return the ID of the latest version of a dataset in the ONS API
#'
#' \code{lm_ons_dataset_latest_version} returns the ID of the latest
#'    \href{https://developer.ons.gov.uk/dataset/datasets-id-editions-edition-versions/}{version} of a
#'    \href{https://developer.ons.gov.uk/dataset/datasets-id/}{dataset} available on the
#'    \href{https://developer.ons.gov.uk/}{ONS API}.
#'
#' @param base_uri \code{string}.
#' The base URI to connect to ('datasets/' +  \code{id} is appended in the function).
#' @param dataset_id \code{string}.
#' An ID of an existing dataset in the ONS API. See \link{lm_ons_datasets}.
#'
#' @return \code{string}.
#'
#' @examples
#' \dontrun{
#' lm_ons_dataset_latest_version(base_uri = "https://api.beta.ons.gov.uk/v1/", dataset_id = "labour-market")
#' }
#'
#' @export

lm_ons_dataset_latest_version <- function(base_uri, dataset_id) {
  metadata_uri <- paste0(base_uri, 'datasets/', dataset_id)
  metadata <- lm_format_get_request(metadata_uri)
  metadata$link$latest_version$id
}
