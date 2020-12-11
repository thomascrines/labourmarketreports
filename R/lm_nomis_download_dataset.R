#' Download a dataset from the NOMIS API
#'
#' \code{lm_nomis_download_dataset} downloads a CSV file from the
#'    \href{https://www.nomisweb.co.uk/api/v01/help}{NOMIS API}.
#'
#' @param base_uri \code{string}.
#' The base URI of the API.
#' @param dataset_id \code{string}.
#' An ID of an existing dataset in the NOMIS API. See \link{lm_nomis_datasets}.
#' @param filter_string \code{string}.
#' An optional string describing filter options and dimensions.
#' @param row_limit \code{string}.
#' An optional number of rows to return.
#'
#' @return \code{list}.
#'
#' @examples
#' \dontrun{
#' lm_nomis_download_dataset(base_uri = "https://api.beta.ons.gov.uk/v1/", dataset_id = "NM_1_1")
#' lm_nomis_download_dataset(base_uri = "https://api.beta.ons.gov.uk/v1/", dataset_id = "NM_1_1", filter_string = "?geography=2092957697")
#' lm_nomis_download_dataset(base_uri = "https://api.beta.ons.gov.uk/v1/", dataset_id = "NM_1_1", row_limit = "5")
#' lm_nomis_download_dataset(base_uri = "https://api.beta.ons.gov.uk/v1/", dataset_id = "NM_1_1", filter_string = "?geography=2092957697", row_limit = "5")
#' }
#'
#' @export

lm_nomis_download_dataset <- function(base_uri, dataset_id, filter_string = NULL, row_limit = NULL) {
  download_uri <- paste0(base_uri, "api/v01/dataset/", dataset_id, ".data.csv")

  if (!is.null(filter_string) & !is.null(row_limit)) {
    download_uri <- paste0(download_uri, filter_string, "&recordoffset=-", row_limit)
  }
  else if (!is.null(filter_string) & is.null(row_limit)) {
    download_uri <- paste0(download_uri, filter_string)
  }
  else if (is.null(filter_string) & !is.null(row_limit)) {
    download_uri <- paste0(download_uri, "?recordoffset=-", row_limit)
  }
  utils::read.csv(download_uri)
}
