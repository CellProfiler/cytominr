% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/variable_importance.R
\name{variable_importance}
\alias{variable_importance}
\title{Measure variable importance.}
\usage{
variable_importance(
  sample,
  variables,
  operation = "replicate_correlation",
  ...
)
}
\arguments{
\item{sample}{tbl containing sample used to estimate parameters.}

\item{variables}{character vector specifying observation variables.}

\item{operation}{optional character string specifying method for computing
variable importance. This must be one of the strings
\code{"replicate_correlation"} (default) or \code{"svd_entropy"}.
is implemented.}

\item{...}{arguments passed to variable importance operation.}
}
\value{
data frame containing variable importance measures.
}
\description{
\code{variable_importance} measures importance of variables based on
specified methods.
}
\examples{
set.seed(123)
x1 <- rnorm(10)
x2 <- x1 + rnorm(10) / 100
y1 <- rnorm(10)
y2 <- y1 + rnorm(10) / 10
z1 <- rnorm(10)
z2 <- z1 + rnorm(10) / 1

batch <- rep(rep(1:2, each = 5), 2)

treatment <- rep(1:10, 2)

replicate_id <- rep(1:2, each = 10)

sample <-
  tibble::tibble(
    x = c(x1, x2), y = c(y1, y2), z = c(z1, z2),
    Metadata_treatment = treatment,
    Metadata_replicate_id = replicate_id,
    Metadata_batch = batch
  )

head(sample)

# `replicate_correlation`` returns the median, min, and max
# replicate correlation (across batches) per variable
variable_importance(
  sample = sample,
  variables = c("x", "y", "z"),
  operation = "replicate_correlation",
  strata = c("Metadata_treatment"),
  replicates = 2,
  split_by = "Metadata_batch",
  replicate_by = "Metadata_replicate_id",
  cores = 1
)

# `svd_entropy`` measures the contribution of each variable in decreasing
# the data entropy.

variable_importance(
  sample = sample,
  variables = c("x", "y", "z"),
  operation = "svd_entropy",
  cores = 1
)
}
