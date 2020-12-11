#' Return a list of all datasets available from the NOMIS API
#'
#' \code{lm_nomis_datasets} returns a list of all datasets available on the
#'    \href{https://www.nomisweb.co.uk/api/v01/help}{NOMIS API}.
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
#' lm_nomis_datasets(base_uri = "http://www.nomisweb.co.uk/")
#' lm_nomis_datasets(base_uri = "http://www.nomisweb.co.uk/", variables = c("id", "uri", "description.value", "name.value"))
#' }
#'
#' @export

lm_nomis_datasets <- function(base_uri, variables = NULL) {
  datasets_uri <- paste0(base_uri, "api/v01/dataset/def.sdmx.json")
  datasets <- lm_format_get_request(datasets_uri)
  if (is.null(variables)) {
    datasets$structure$keyfamilies$keyfamily
  }  else {
    datasets$structure$keyfamilies$keyfamily[, variables]
  }
}
