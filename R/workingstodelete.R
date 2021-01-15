# base_uri <- "https://api.beta.ons.gov.uk/v1/"
#
# datasets <- lm_ons_datasets(base_uri = base_uri)
#
# dataset_id <- datasets$id[datasets$title == "UK Labour Market"]
#
# dataset_edition <- lm_ons_dataset_editions(base_uri = base_uri,
#                                            dataset_id = dataset_id)
#
# dataset_version <- lm_ons_dataset_latest_version(base_uri = base_uri,
#                                                  dataset_id = dataset_id)
#
# filter_output_id <- lm_ons_request_dataset(base_uri = base_uri,
#                                            dataset_id = dataset_id,
#                                            dataset_edition = dataset_edition,
#                                            dataset_version = dataset_version)
#
# filtered_dataset <- lm_ons_download_dataset(base_uri = base_uri,
#                                             filter_output_id = filter_output_id)
#
# View(Key_Stats)
# View(Country_Stats)
# colnames(filtered_dataset)
# View(filtered_dataset[,c("Geography", "EconomicActivity", "UnitOfMeasure", "Sex", "Time", "V4_1")])


# key_stats_example_data <- readxl::read_excel("C:/Users/dsap01/Documents/labourmarketreports/Data/Tables_Online.xlsx", sheet = "Key")
# country_stats_example_data <- readxl::read_excel("C:/Users/dsap01/Documents/labourmarketreports/Data/Tables_Online.xlsx", sheet = "Countries")
# region_stats_example_data <- readxl::read_excel("C:/Users/dsap01/Documents/labourmarketreports/Data/Tables_Online.xlsx", sheet = "Regions")
# time_stats_example_data <- readxl::read_excel("C:/Users/dsap01/Documents/labourmarketreports/Data/Tables_Online.xlsx", sheet = "Time")
#
# save(key_stats_example_data, file="data/key_stats_example_data.RData")
# save(country_stats_example_data, file="data/country_stats_example_data.RData")
# save(region_stats_example_data, file="data/region_stats_example_data.RData")
# save(time_stats_example_data, file="data/time_stats_example_data.RData")
