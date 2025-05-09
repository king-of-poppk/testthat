% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mock2-helpers.R
\name{mock_output_sequence}
\alias{mock_output_sequence}
\title{Mock a sequence of output from a function}
\usage{
mock_output_sequence(..., recycle = FALSE)
}
\arguments{
\item{...}{<\code{\link[rlang:dyn-dots]{dynamic-dots}}> Values to return in sequence.}

\item{recycle}{whether to recycle. If \code{TRUE}, once all values have been returned,
they will be returned again in sequence.}
}
\value{
A function that you can use within \code{local_mocked_bindings()} and
\code{with_mocked_bindings()}
}
\description{
Specify multiple return values for mocking
}
\examples{
# inside local_mocked_bindings()
\dontrun{
local_mocked_bindings(readline = mock_output_sequence("3", "This is a note", "n"))
}
# for understanding
mocked_sequence <- mock_output_sequence("3", "This is a note", "n")
mocked_sequence()
mocked_sequence()
mocked_sequence()
try(mocked_sequence())
recycled_mocked_sequence <- mock_output_sequence(
  "3", "This is a note", "n",
  recycle = TRUE
)
recycled_mocked_sequence()
recycled_mocked_sequence()
recycled_mocked_sequence()
recycled_mocked_sequence()
}
\seealso{
Other mocking: 
\code{\link{local_mocked_bindings}()}
}
\concept{mocking}
