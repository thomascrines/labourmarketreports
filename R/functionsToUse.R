# base_uri <- 'https://api.beta.ons.gov.uk/v1/'
# datasets_return_variables <- c("id", "description", "title")
# datasets <- lm_ons_datasets(base_uri, datasets_return_variables)
# dataset_id <- datasets$id[27]
# version <- lm_ons_latest_dataset_version(base_uri, dataset_id)
# edition <- lm_ons_dataset_editions(base_uri, dataset_id)
# dimensions <- get_dataset_dimensions(base_uri, dataset_id, edition, version)
# example_dimension <- dimensions[3]
# options <- lm_ons_dataset_dimension_options(base_uri, dataset_id, edition, version, example_dimension)
# example_option <- options[1]
# filter_output_id <- lm_test_post_request(base_uri, dataset_id, edition, version)
# download_uri <- lm_ons_download_uri(base_uri, filter_output_id)
# View(result)
