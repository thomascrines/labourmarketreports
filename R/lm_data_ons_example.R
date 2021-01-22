#' Example function calling from ONS API, to be deleted
#'
#' \code{lm_data_ons_example} is an example of a function that pulls data from the ONS API.
#'
#' @return \code{dataframe}.
#'
#' @examples
#' \dontrun{
#' lm_data_ons_example()
#' }
#'
#' @export

lm_data_ons_example <- function() {

  base_uri <- "https://api.beta.ons.gov.uk/v1/"
  datasets_variables <- c("id", "description", "title")

  datasets <- lm_ons_datasets(base_uri = base_uri,
                              variables = datasets_variables)

  dataset_id <- datasets$id[datasets$title == "UK Labour Market"]

  dataset_edition <- lm_ons_dataset_editions(base_uri = base_uri,
                                             dataset_id = dataset_id)

  dataset_version <- lm_ons_dataset_latest_version(base_uri = base_uri,
                                                   dataset_id = dataset_id)

  filter_output_id <- lm_ons_request_dataset(base_uri = base_uri,
                                             dataset_id = dataset_id,
                                             dataset_edition = dataset_edition,
                                             dataset_version = dataset_version)

  Sys.sleep(3)

  dataset <- lm_ons_download_dataset(base_uri = base_uri,
                                     filter_output_id = filter_output_id)

  dataset <- dataset[,c("Geography", "EconomicActivity", "UnitOfMeasure", "Sex", "Time", "V4_1")]

  colnames(dataset) <- c("Area", "Status", "Type", "Sex", "Time", "Value")

  dataset
}
