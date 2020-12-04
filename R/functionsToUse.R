# base_uri <- 'https://api.beta.ons.gov.uk/v1/'
# datasets_return_variables <- c("id", "description", "title")
# datasets <- lm_ons_datasets(base_uri, datasets_return_variables)
# dataset_id <- datasets$id[27]
# version <- lm_ons_dataset_latest_version(base_uri, dataset_id)
# edition <- lm_ons_dataset_editions(base_uri, dataset_id)
# dimensions <- lm_ons_dataset_dimensions(base_uri, dataset_id, edition, version)
# example_dimension <- dimensions[3]
# options <- lm_ons_dataset_dimension_options(base_uri, dataset_id, edition, version, example_dimension)
# example_option <- options[1]
# filter_output_id <- lm_ons_post_request(base_uri, dataset_id, edition, version, example_dimension, example_option)
# download_uri <- lm_ons_download_uri(base_uri, filter_output_id)
# result <- read.csv(download_uri)
# View(result)
