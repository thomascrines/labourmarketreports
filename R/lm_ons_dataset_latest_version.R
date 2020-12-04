#' Return ID of latest version of a dataset in the ONS API
#'
#' \code{lm_ons_dataset_latest_version} returns the ID of the latest version of a dataset from ONS API.
#'
#' @param base_uri \code{string}.
#' The base URI to connect to ('datasets/' +  \code{id} is appended in the function).
#' @param dataset_id \code{string}.
#' An id of an existing dataset in the ONS API .
#'
#' @return \code{string}.
#'
#' @examples
#' \dontrun{
#' lm_ons_dataset_latest_version("https://api.beta.ons.gov.uk/v1/", "labour-market")
#' }
#'
#' @export

lm_ons_dataset_latest_version <- function(base_uri, dataset_id) {
  metadata_uri <- paste0(base_uri, 'datasets/', dataset_id)
  metadata <- lm_format_get_request(metadata_uri)
  metadata$link$latest_version$id
}
