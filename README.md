
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shsannualreport

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
<!-- badges: end -->

:construction: :construction: :construction:

Temporary files included in package can be deleted later:

  - lm\_data\_country\_stats.R
  - lm\_data\_key\_stats.R
  - lm\_data\_nomis\_example.R
  - lm\_data\_ons\_example.R
  - lm\_data\_region\_stats.R
  - lm\_data\_time\_stats.R
  - Nomis.R

The data and Markdown folders can also be deleted when reporting process
finalised.

The process of making a function to pull and format a dataset for
publication should be described in this readme.

NOMIS and ONS guides could be moved into separate files.

:construction: :construction: :construction:

labourmarketreports is an R package to produce markdown reports with
data from the following web APIs:

  - [ONS](https://developer.ons.gov.uk/)
  - [NOMIS](https://www.nomisweb.co.uk/api/v01/help)
  - [statistics.gov.scot](https://statistics.gov.scot/home)

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

## Usage - ONS API

The main functionality that has been developed so far is to interact
with the ONS API, so it’s useful to read through the
[documentation](https://developer.ons.gov.uk/) before starting to use
the package. The main functions are:

  - `lm_ons_request_dataset` - Requests a downloadable dataset be
    created by the ONS API, based on a `dataset_id`, a
    `dataset_edition`, and a `dataset_version`, as well as an optional
    `dataset_dimension` and `dataset_dimension_option` to filter on.
    (These can either be hard-coded or obtained using other functions
    described later.) A filter output ID (a unique reference to the
    newly created dataset) is returned by the function. This can then be
    passed to `lm_ons_download_dataset`.
  - `lm_ons_download_dataset` - Downloads a dataset that has been
    created in the API using `lm_ons_request_dataset`, based on the
    `filter_output_id` that was returned by that function.

### Examples

To return an entire dataset from the ONS API, without
filtering:

``` r
filter_output_id <- lm_ons_request_dataset(base_uri = "https://api.beta.ons.gov.uk/v1/", 
                                           dataset_id = "labour-market", 
                                           dataset_edition = "time-series", 
                                           dataset_version = "2")

unfiltered_dataset <- lm_ons_download_dataset(base_uri = "https://api.beta.ons.gov.uk/v1/",
                                              filter_output_id = filter_output_id)
```

To return a filtered dataset from the ONS API (in this case to only
return the option “16+” for the dimension
“agegroups”):

``` r
filter_output_id <- lm_ons_request_dataset(base_uri = "https://api.beta.ons.gov.uk/v1/", 
                                           dataset_id = "labour-market", 
                                           dataset_edition = "time-series", 
                                           dataset_version = "2",
                                           dataset_dimension = "agegroups",
                                           dataset_dimension_option = "16+")

filtered_dataset <- lm_ons_download_dataset(base_uri = "https://api.beta.ons.gov.uk/v1/",
                                            filter_output_id = filter_output_id)
```

### Helper functions

The above examples only work as the arguments passed in are already
known. The package contains a number of helper functions to get the
necessary options from the API. (The base URI used above is not taken
directly from the API, but from the
[documentation](https://developer.ons.gov.uk/).)

The three required arguments (`dataset_id`, `dataset_edition`, and
`dataset_version`) can be obtained with the functions `lm_ons_datasets`,
`lm_ons_dataset_latest_version`, and `lm_ons_dataset_editions`.

The two optional arguments used for filtering (`dataset_dimension` and
`dataset_dimension_option`) can be obtained with the functions
`lm_ons_dataset_dimensions` and `lm_ons_dataset_dimension_options`.

### Helper function examples

#### lm\_ons\_datasets

To get a dataset ID, use
`lm_ons_datasets`:

``` r
datasets <- lm_ons_datasets(base_uri = "https://api.beta.ons.gov.uk/v1/")
```

Any value in the `id` column can be used as a `dataset_id` in the other
functions. The returned dataframe can be filtered to only return desired
columns with the optional `variables`
argument:

``` r
datasets <- lm_ons_datasets(base_uri = "https://api.beta.ons.gov.uk/v1/", 
                            variables = c("id", "description", "title"))
```

#### lm\_ons\_dataset\_latest\_version

To get the latest available version of a dataset, use
`lm_ons_dataset_latest_version`:

``` r
lm_ons_dataset_latest_version(base_uri = "https://api.beta.ons.gov.uk/v1/", 
                              dataset_id = "labour-market")
```

#### lm\_ons\_dataset\_editions

To get the available editions of a dataset, use `lm_ons_editions`:

``` r
lm_ons_dataset_editions(base_uri = "https://api.beta.ons.gov.uk/v1/", 
                        dataset_id = "labour-market")
```

#### lm\_ons\_dataset\_dimensions (optional, for filtering only)

To get the available dimensions (or column names) of a dataset, use
`lm_ons_dimensions`:

``` r
lm_ons_dataset_dimensions(base_uri = "https://api.beta.ons.gov.uk/v1/", 
                          dataset_id = "labour-market", 
                          dataset_edition = "time-series", 
                          dataset_version = "2")
```

#### lm\_ons\_dataset\_dimension\_options (optional, for filtering only)

To get the available options of a dimension, use
`lm_ons_dimension_options`:

``` r
lm_ons_dataset_dimension_options(base_uri = "https://api.beta.ons.gov.uk/v1/", 
                          dataset_id = "labour-market", 
                          dataset_edition = "time-series", 
                          dataset_version = "2",
                          dataset_dimension = "agegroups")
```

### Full example

The following is an example of using the helper functions to get
metadata of a dataset, and using this metadata to download a filtered
dataset:

``` r
base_uri <- "https://api.beta.ons.gov.uk/v1/"
datasets_variables <- c("id", "description", "title")

datasets <- lm_ons_datasets(base_uri = base_uri,
                            variables = datasets_variables)

dataset_id <- datasets$id[datasets$title == "UK Labour Market"]

dataset_edition <- lm_ons_dataset_editions(base_uri = base_uri,
                                           dataset_id = dataset_id)

dataset_version <- lm_ons_dataset_latest_version(base_uri = base_uri,
                                                 dataset_id = dataset_id)


dataset_dimensions <- lm_ons_dataset_dimensions(base_uri = base_uri,
                                                dataset_id = dataset_id,
                                                dataset_edition = dataset_edition,
                                                dataset_version = dataset_version)

example_dimension <- dataset_dimensions[3]

dataset_options <- lm_ons_dataset_dimension_options(base_uri = base_uri,
                                                    dataset_id = dataset_id,
                                                    dataset_edition = dataset_edition,
                                                    dataset_version = dataset_version,
                                                    dataset_dimension = example_dimension)

example_option <- dataset_options[1]

filter_output_id <- lm_ons_request_dataset(base_uri = base_uri,
                                           dataset_id = dataset_id,
                                           dataset_edition = dataset_edition,
                                           dataset_version = dataset_version,
                                           dataset_dimension = example_dimension,
                                           dataset_dimension_option = example_option)

filtered_dataset <- lm_ons_download_dataset(base_uri = base_uri,
                                            filter_output_id = filter_output_id)
```

## Usage - NOMIS API

Again, it’s useful to read through the [NOMIS
documentation](https://www.nomisweb.co.uk/api/v01/help) before starting
to use the package. The main function is:

  - `lm_nomis_download_dataset` - Downloads a dataset from the NOMIS
    API, based on a `base_uri`, and a `dataset_id`. Also accepts and
    optional `filter_string` and `row_limit`.

### Examples

To return an entire dataset from the NOMIS API, without filtering:

``` r
  base_uri <- "http://www.nomisweb.co.uk/"
  dataset_id <- "NM_1_1"

  lm_nomis_download_dataset(base_uri, dataset_id)
```

To return 1000 rows of a filtered dataset from the NOMIS API (in this
case to only return the option “2092957697” for the dimension
“geography”):

``` r
  base_uri <- "http://www.nomisweb.co.uk/"
  dataset_id <- "NM_1_1"
  filter_string = "?geography=2092957697"
  row_limit = 10000
  
  dataset <- lm_nomis_download_dataset(base_uri, dataset_id, filter_string = filter_string, row_limit = row_limit)
```

### Helper functions

As with the ONS examples, these examples only work if the arguments are
already known. The package contains a number of helper functions to get
the necessary options from the API. (The base URI used above is not
taken directly from the API, but from the [NOMIS
documentation](https://www.nomisweb.co.uk/api/v01/help) .)

The only required argument is `dataset_id`, which can be obtained with
the function `lm_nomis_datasets`.

The `filter_string`can be created with values obtained with the
functions `lm_nomis_dataset_dimensions` and
`lm_nomis_dataset_dimension_options`.

### Helper function examples

#### lm\_nomis\_datasets

To get a dataset ID, use `lm_nomis_datasets`:

``` r
datasets <- lm_nomis_datasets(base_uri = "http://www.nomisweb.co.uk/")
```

Returned columns can be specified with the optional `variables`
argument:

``` r
datasets <- lm_nomis_datasets(base_uri = "http://www.nomisweb.co.uk/", 
                              variables = c("id", "uri", "description.value", "name.value", "components.dimension"))
```

Any value in the `id` column can be used as a `dataset_id` in the other
functions.

The returned object from `lm_nomis_datasets` is required for the
`lm_nomis_dimensions` function.

#### lm\_nomis\_dataset\_dimensions (optional, for filtering only)

To get the available dimensions (or column names) of a dataset, use
`lm_nomis_dimensions`:

``` r
datasets <- lm_nomis_datasets(base_uri = "http://www.nomisweb.co.uk/", 
                              variables = c("id", "uri", "description.value", "name.value", "components.dimension"))
dataset_id <- "NM_1_1"

dimensions <- lm_nomis_dataset_dimensions(dataset_id = dataset_id, 
                                          datasets_list = datasets)
```

#### lm\_nomis\_dataset\_dimension\_options (optional, for filtering only)

To get the available options of a dimension, use
`lm_nomis_dimension_options`:

``` r
options <- lm_nomis_dataset_dimension_options(base_uri = "http://www.nomisweb.co.uk/", 
                                              dataset_id = "NM_1_1", 
                                              dataset_dimension = "GEOGRAPHY")
```

To filter a dataset currently involves manually creating a filter string
to pass to `lm_nomis_download_dataset`. In the example above, using
`"geography"` as the dimension and an available option of
`"2092957697"`, the filter string can be manually written:
`"?geography=2092957697"`. This is a possible issue to be improved in
future if necessary.

## Usage - statistics.gov.scot

If data from the open data platform is required there is an existing
package to pull data from the API,
[opendatascot](https://github.com/DataScienceScotland/opendatascot).
