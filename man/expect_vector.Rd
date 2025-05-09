% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/expect-vector.R
\name{expect_vector}
\alias{expect_vector}
\title{Does code return a vector with the expected size and/or prototype?}
\usage{
expect_vector(object, ptype = NULL, size = NULL)
}
\arguments{
\item{object}{Object to test.

Supports limited unquoting to make it easier to generate readable failures
within a function or for loop. See \link{quasi_label} for more details.}

\item{ptype}{(Optional) Vector prototype to test against. Should be a
size-0 (empty) generalised vector.}

\item{size}{(Optional) Size to check for.}
}
\description{
\code{expect_vector()} is a thin wrapper around \code{\link[vctrs:vec_assert]{vctrs::vec_assert()}}, converting
the results of that function in to the expectations used by testthat. This
means that it used the vctrs of \code{ptype} (prototype) and \code{size}. See
details in \url{https://vctrs.r-lib.org/articles/type-size.html}
}
\examples{
\dontshow{if (requireNamespace("vctrs")) withAutoprint(\{ # examplesIf}
expect_vector(1:10, ptype = integer(), size = 10)
show_failure(expect_vector(1:10, ptype = integer(), size = 5))
show_failure(expect_vector(1:10, ptype = character(), size = 5))
\dontshow{\}) # examplesIf}
}
