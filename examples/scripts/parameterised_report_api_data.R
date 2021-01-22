# Use this script to generate a report based on a template
library(labourmarketreports)

output_folder <- "C:/temp/reports"
output_filename <- "test_from_api"
report_template_path <- "report_templates/parameterised_report_example_api_data.Rmd"
report_format <- "html_document"

params <- list(ons_data = labourmarketreports::lm_data_ons_example(),
               nomis_data = labourmarketreports::lm_data_nomis_example())

rmarkdown::render(input = report_template_path,
                  output_format = report_format,
                  output_file = output_filename,
                  output_dir = output_folder,
                  params = params,
                  envir = new.env())
