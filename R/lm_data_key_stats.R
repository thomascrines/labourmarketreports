#' Get key stats data for use in report
#'
#' \code{lm_data_key_stats} returns formatted key stats data for use in monthly reports.
#'
#' @return \code{dataframe}.
#'
#' @examples
#' \dontrun{
#' lm_data_key_stats()
#' }
#'
#' @export

lm_data_key_stats <- function() {

  # TODO get data from API using functions

  labourmarketreports::key_stats_example_data
}
