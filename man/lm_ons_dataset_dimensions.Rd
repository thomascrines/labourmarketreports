% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lm_ons_dataset_dimensions.R
\name{lm_ons_dataset_dimensions}
\alias{lm_ons_dataset_dimensions}
\title{Return list of dimensions of a dataset in the ONS API}
\usage{
lm_ons_dataset_dimensions(
  base_uri,
  dataset_id,
  dataset_edition,
  dataset_version
)
}
\arguments{
\item{base_uri}{\code{string}.
The base URI to connect to.
('datasets/' +  \code{dataset_id} + '/editions/' + \code{dataset_edition} + '/versions/' + \code{dataset_version} + '/dimensions' is appended in the function).}

\item{dataset_id}{\code{string}.
An ID of an existing dataset in the ONS API. See \link{lm_ons_datasets}.}

\item{dataset_edition}{\code{string}.
An edition ID of an existing dataset in the ONS API. See \link{lm_ons_dataset_editions}.}

\item{dataset_version}{\code{string}.
A version ID of an existing dataset in the ONS API. See \link{lm_ons_dataset_versions}.}
}
\value{
\code{string} if one dimension available, \code{list} if multiple.
}
\description{
\code{lm_ons_dataset_dimensions} returns a list of
   \href{https://developer.ons.gov.uk/dataset/datasets-id-editions-edition-versions-version-dimensions/}{dimensions} of a
   \href{https://developer.ons.gov.uk/dataset/datasets-id/}{dataset} available on the
   \href{https://developer.ons.gov.uk/}{ONS API}.
}
\examples{
\dontrun{
lm_ons_dataset_dimensions(base_uri = "https://api.beta.ons.gov.uk/v1/", dataset_id = "labour-market", dataset_edition = "time-series", dataset_version = "2")
}

}
