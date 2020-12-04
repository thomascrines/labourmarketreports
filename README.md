
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shsannualreport

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
<!-- badges: end -->

labourmarketreports is an R package to produce markdown reports with
data from a number of web APIs:

  - [https://developer.ons.gov.uk/](ONS)
  - [https://www.nomisweb.co.uk/api/v01/help](NOMIS)
  - [https://statistics.gov.scot/home](statistics.gov.scot)

## Installation

You can install the development version of shsannualreport from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("thomascrines/labourmarketreports")
```

If you are working on SCOTS, or if the above does not work, you can
install manually:

1.  Go to the shsannualreport repository [master
    branch](https://github.com/thomascrines/labourmarketreports) on
    GitHub
2.  Click **Clone or download** then **Download ZIP**
3.  Save the file locally and unzip
4.  Install with
install.packages():

<!-- end list -->

``` r
install.packages("C:/DownloadDirectory/labourmarketreports-master/labourmarketreports-master", repos = NULL,
                 type="source", lib = "C:/YourLibraryPath")
```

*Library path can be seen by running `.libPaths()`*

## Usage

The main functionality that has been developed so far is to interact
with the ONS API, so it’s useful to read through the
[https://developer.ons.gov.uk/](documentation) before starting to use
the package. The main functions are:

  - `lm_ons_post_request` - Creates a post request body in the required
    format, based on a `dataset_id`, a `dataset_edition`, and a
    `dataset_version`, as well as an optional `dataset_dimension` and
    `dataset_dimension_option` to filter on. (These can either be
    hard-coded or obtained using other functions described later.) A
    downloadable dataset is created in the API based on these
    parameters. A filter output ID to refer to the newly created dataset
    is included in the post request response, this is what is returned
    by the function. This can then be passed to `lm_ons_download_uri`.
  - `lm_ons_download_uri` - Takes a filter output ID returned by
    `lm_ons_post_request`, and returns a URI which can be passed to the
    `read.csv` function from the `utils` package to return the dataset.

## Examples

To return an entire dataset, without
filtering:

``` r
filter_output_id <- lm_ons_post_request(base_uri = "https://api.beta.ons.gov.uk/v1/", 
                                        dataset_id = "labour-market", 
                                        edition = "time-series", 
                                        version = "2")

download_uri <- lm_ons_download_uri(base_uri = "https://api.beta.ons.gov.uk/v1/",
                                    filter_output_id = filter_output_id)

unfiltered_dataset <- utils::read.csv(download_uri)
```

To filter a dataset (in this case to only return the option “16+” for
the dimension
“agegroups”):

``` r
filter_output_id <- lm_ons_post_request(base_uri = "https://api.beta.ons.gov.uk/v1/", 
                                        dataset_id = "labour-market", 
                                        edition = "time-series", 
                                        version = "2",
                                        dataset_dimension = "agegroups",
                                        dataset_dimension_option = "16+")

download_uri <- lm_ons_download_uri(base_uri = "https://api.beta.ons.gov.uk/v1/",
                                    filter_output_id = filter_output_id)

filtered_dataset <- utils::read.csv(download_uri)
```
