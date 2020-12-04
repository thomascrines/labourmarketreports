#' Return list of datasets available from ONS API
#'
#' \code{lm_ons_datasets} sends a GET request to a provided URI and formats the JSON response as an R list.
#'
#' @param base_uri \code{string}.
#' The base URI to connect to ('datasets' is appended in the function).
#' @param variables \code{list}.
#' Default = \code{null}.A list of desired variables to return.
#'
#' @return \code{list}.
#'
#' @examples
#' \dontrun{
#' lm_ons_datasets("https://api.beta.ons.gov.uk/v1/", c("id", "description", "title"))
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
