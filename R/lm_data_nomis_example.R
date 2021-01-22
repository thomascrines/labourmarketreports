#' Example function calling from NOMIS API, to be deleted
#'
#' \code{lm_data_nomis_example} is an example of a function that pulls data from the NOMIS API.
#'
#' @return \code{dataframe}.
#'
#' @examples
#' \dontrun{
#' lm_data_NOMIS_example()
#' }
#'
#' @export

lm_data_nomis_example <- function() {

  base_uri <- "http://www.nomisweb.co.uk/"
  dataset_id <- "NM_1_1"
  row_limit = 10000
  filter_string = NULL

  dataset <- lm_nomis_download_dataset(base_uri, dataset_id, filter_string = filter_string, row_limit = row_limit)

  dataset <- dataset[, c("DATE_NAME", "GEOGRAPHY_NAME", "ITEM_NAME", "MEASURES_NAME", "OBS_VALUE")]

  dataset <- dataset[!is.na(dataset$OBS_VALUE),]

  colnames(dataset) <- c("Time", "Area", "Status", "Measure", "Value")

  dataset
}
