#' Make GET request to API and format response as R dataframe
#'
#' \code{lm_format_get_request} is an internal function that sends a GET request to
#' a provided URI and formats a JSON response as an R data frame.
#'
#' @param uri \code{string}.
#' The URI to make the GET request to.
#'
#' @return \code{list}.
#'
#' @examples
#' \dontrun{
#' labourmarketreports:::lm_i_format_get_request(uri = 'https://api.beta.ons.gov.uk/v1/datasets')
#' }
#'
#' @keywords internal
#'
#' @noRd

lm_i_format_get_request <- function(uri) {
  uri %>%
    httr::GET() %>%
    httr::content(as = "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)
}
