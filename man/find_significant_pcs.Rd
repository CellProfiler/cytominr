% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/husk.R
\name{find_significant_pcs}
\alias{find_significant_pcs}
\title{Find significant PC's given the eigenvalues.}
\usage{
find_significant_pcs(S, method = "outlier", n = NULL, d = NULL)
}
\arguments{
\item{S}{numeric vector with eigenvalues of covariance matrix, sorted in
descending order.}

\item{method}{optional string specifying method to estimate number of
significant PCs}

\item{n}{optional integer specifying number of rows in the data matrix.
Default is \code{NULL}}

\item{d}{optional integer specifying number of columns in the data matrix.
Default is \code{NULL}}
}
\value{
number of significant PCs
}
\description{
\code{find_significant_pcs} finds significant PC's given the eigenvalues.
}
