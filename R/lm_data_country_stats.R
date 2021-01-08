#' Get country stats data for use in report
#'
#' \code{lm_data_country_stats} returns formatted country stats data for use in monthly reports.
#'
#' @return \code{dataframe}.
#'
#' @examples
#' \dontrun{
#' lm_data_country_stats()
#' }
#'
#' @export

lm_data_country_stats <- function() {

  # TODO get data from API using functions
  data.table::data.table(readxl::read_excel("Data\\Tables_Online.xlsx", sheet = "Countries"))
}
