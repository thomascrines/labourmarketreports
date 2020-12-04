#' Return a list of all datasets available from the ONS API
#'
#' \code{lm_ons_datasets} returns a list of all
#'    \href{https://developer.ons.gov.uk/dataset/datasets-id/}{datasets} available on the
#'    \href{https://developer.ons.gov.uk/}{ONS API}.
#'
#' @param base_uri \code{string}.
#' The base URI to connect to ('datasets' is appended in the function).
#' @param variables \code{list}.
#' Default = \code{null}. A list of desired variables to return. If \code{null}, all variables are returned.
#'
#' @return \code{list}.
#'
#' @examples
#' \dontrun{
#' lm_ons_datasets(base_uri = "https://api.beta.ons.gov.uk/v1/")
#' lm_ons_datasets(base_uri = "https://api.beta.ons.gov.uk/v1/", variables = c("id", "description", "title"))
#' }
#'
#' @export

lm_ons_datasets <- function(base_uri, variables = NULL) {
  datasets_uri <- paste0(base_uri, 'datasets')
  datasets <- lm_format_get_request(datasets_uri)
  if (!is.null(variables)) {
    datasets$items[, variables]
  }  else {
    datasets$items
  }
}
