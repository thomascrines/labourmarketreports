#' Make GET request to API and format response as R list
#'
#' \code{lm_format_get_request} sends a GET request to a provided URI and formats the JSON response as an R list.
#'
#' @param uri \code{string}.
#' The URI to make the GET request to.
#'
#' @return \code{list}.
#'
#' @examples
#' \dontrun{
#' lm_format_get_request(uri = 'https://api.beta.ons.gov.uk/v1/datasets')
#' }
#'
#' @export

lm_format_get_request <- function(uri) {
  uri %>%
    httr::GET() %>%
    httr::content(as = "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)
}
