% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lm_nomis_datasets.R
\name{lm_nomis_datasets}
\alias{lm_nomis_datasets}
\title{Return a list of all datasets available from the NOMIS API}
\usage{
lm_nomis_datasets(base_uri, variables = NULL)
}
\arguments{
\item{base_uri}{\code{string}.
The base URI to connect to ('datasets' is appended in the function).}

\item{variables}{\code{list}.
Default = \code{null}. A list of desired variables to return. If \code{null}, all variables are returned.}
}
\value{
\code{list}.
}
\description{
\code{lm_nomis_datasets} returns a list of all datasets available on the
   \href{https://www.nomisweb.co.uk/api/v01/help}{NOMIS API}.
}
\examples{
\dontrun{
lm_nomis_datasets(base_uri = "http://www.nomisweb.co.uk/")
lm_nomis_datasets(base_uri = "http://www.nomisweb.co.uk/", variables = c("id", "uri", "description.value", "name.value"))
}

}
