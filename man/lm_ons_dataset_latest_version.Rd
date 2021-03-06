% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lm_ons_dataset_latest_version.R
\name{lm_ons_dataset_latest_version}
\alias{lm_ons_dataset_latest_version}
\title{Return the ID of the latest version of a dataset in the ONS API}
\usage{
lm_ons_dataset_latest_version(base_uri, dataset_id)
}
\arguments{
\item{base_uri}{\code{string}.
The base URI to connect to ('datasets/' +  \code{id} is appended in the function).}

\item{dataset_id}{\code{string}.
An ID of an existing dataset in the ONS API. See \link{lm_ons_datasets}.}
}
\value{
\code{string}.
}
\description{
\code{lm_ons_dataset_latest_version} returns the ID of the latest
   \href{https://developer.ons.gov.uk/dataset/datasets-id-editions-edition-versions/}{version} of a
   \href{https://developer.ons.gov.uk/dataset/datasets-id/}{dataset} available on the
   \href{https://developer.ons.gov.uk/}{ONS API}.
}
\examples{
\dontrun{
lm_ons_dataset_latest_version(base_uri = "https://api.beta.ons.gov.uk/v1/", dataset_id = "labour-market")
}

}
