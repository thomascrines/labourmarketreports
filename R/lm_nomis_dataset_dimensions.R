#' Return list of dimensions of a dataset in the NOMIS API
#'
#' \code{lm_ons_dataset_dimensions} returns a list of dimensions dataset available on the
#'    \href{https://www.nomisweb.co.uk/api/v01/help}{NOMIS API}.
#'
#' @param dataset_id \code{string}.
#' An ID matching a dataset included in \code{dataset_list}.
#' @param datasets_list \code{list}.
#' A table of datsets created using \link{lm_nomis_datasets}.
#'
#' @return \code{character} a list of available dimensions in the dataset.
#'
#' @examples
#' \dontrun{
#' datasets <- lm_nomis_datasets(base_uri = "http://www.nomisweb.co.uk/", variables = c("id", "uri", "description.value", "name.value", "components.dimension"))
#' lm_nomis_dataset_dimensions(dataset_id = "NM_1_1", datasets_list = datasets)
#' }
#'
#' @export

lm_nomis_dataset_dimensions <- function(dataset_id, datasets_list) {
  datasets_list[datasets_list$id == dataset_id,]$components.dimension[[1]]$conceptref
}
