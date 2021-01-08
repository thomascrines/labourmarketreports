base_uri <- "https://api.beta.ons.gov.uk/v1/"

datasets <- lm_ons_datasets(base_uri = base_uri)

dataset_id <- datasets$id[datasets$title == "UK Labour Market"]

dataset_edition <- lm_ons_dataset_editions(base_uri = base_uri,
                                           dataset_id = dataset_id)

dataset_version <- lm_ons_dataset_latest_version(base_uri = base_uri,
                                                 dataset_id = dataset_id)

filter_output_id <- lm_ons_request_dataset(base_uri = base_uri,
                                           dataset_id = dataset_id,
                                           dataset_edition = dataset_edition,
                                           dataset_version = dataset_version)

filtered_dataset <- lm_ons_download_dataset(base_uri = base_uri,
                                            filter_output_id = filter_output_id)

View(Key_Stats)
View(Country_Stats)
colnames(filtered_dataset)
View(filtered_dataset[,c("Geography", "EconomicActivity", "UnitOfMeasure", "Sex", "Time", "V4_1")])
