library(labourmarketreports)
output_folder <- "C:/temp/reports"
output_filename <- "parameterised_report_api_data"
report_template_path <- "examples/report_templates/parameterised_report_api_data.Rmd"
report_format <- "html_document"

params <- list(ons_data = labourmarketreports::lm_data_ons_example(),
               nomis_data = labourmarketreports::lm_data_nomis_example())

rmarkdown::render(input = report_template_path,
                  output_format = report_format,
                  output_file = output_filename,
                  output_dir = output_folder,
                  params = params,
                  envir = new.env())
