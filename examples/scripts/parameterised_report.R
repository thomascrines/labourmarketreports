# Use this script to generate a report based on a template
# Set these values as required:

output_folder <- "C:/temp/reports"
# The folder to save the report to (must be an existing folder)

output_filename <- "parameterised_report"
# The name of the file to save to (extension is added automatically, will be created if doesn't exist)

report_template_path <- "examples/report_templates/parameterised_report.Rmd"
# The Rmd file to knit

report_format <- "html_document"
# See ?rmarkdown::render for other options

report_date <- "01/10/2020"
# User input instead of reading from date sheet in sample data

params <- list(input_date = report_date,
               key_stats = labourmarketreports::lm_data_key_stats(),
               country_stats = labourmarketreports::lm_data_country_stats(),
               region_stats = labourmarketreports::lm_data_region_stats(),
               time_stats = labourmarketreports::lm_data_time_stats())
# Param names must match names in lines 2-8 of "report_templates/parameterised_report_example.Rmd"
# In lines 2-8 of report, params are declared as empty strings, e.g. line 3: input_date: ""
# They can then be accessed in report, using "params", e.g. line 66: Key_Stats <- data.table(params$key_stats)

# Functions such as labourmarketreports::lm_data_key_stats() are only using saved data for demo
# Can be updated to pull from API, see example_script_api.R

rmarkdown::render(input = report_template_path,
                  output_format = report_format,
                  output_file = output_filename,
                  output_dir = output_folder,
                  params = params,
                  envir = new.env())
# Report knitted and saved
