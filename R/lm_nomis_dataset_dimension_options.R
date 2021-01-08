#' Return a list of options of a dimension of a dataset in the NOMIS API
#'
#' \code{lm_ons_dataset_dimension_options} returns a list of options of a dimension of a dataset available on the
#'    \href{https://www.nomisweb.co.uk/api/v01/help}{NOMIS API}.
#'
#' @param base_uri \code{string}.
#' The base URI to connect to.
#' @param dataset_id \code{string}.
#' An ID of an existing dataset in the NOMIS API. See \link{lm_nomis_datasets}.
#' @param dataset_dimension \code{string}.
#' The name of an existing dimension in the specified dataset. See \link{lm_nomis_dataset_dimensions}.
#'
#' @return \code{character} list of available options.
#'
#' @examples
#' \dontrun{
#' lm_nomis_dataset_dimension_options(base_uri = "http://www.nomisweb.co.uk/", dataset_id = "NM_1_1", dataset_dimension = "FREQ")
#' }
#'
#' @export

lm_nomis_dataset_dimension_options <- function(base_uri, dataset_id, dataset_dimension) {
  options_uri <- paste0(base_uri, "api/v01/dataset/", dataset_id, "/", dataset_dimension, "/def.sdmx.json")
  options <- lm_format_get_request(options_uri)
  options$structure$codelists$codelist$code[[1]][,c("value", "description.value")]
}
