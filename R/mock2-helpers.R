#' Mock a sequence of output from a function
#'
#' Specify multiple return values for mocking
#'
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]> Values to return in sequence.
#' @param recycle whether to recycle. If `TRUE`, once all values have been returned,
#' they will be returned again in sequence.
#'
#' @return A function that you can use within `local_mocked_bindings()` and
#' `with_mocked_bindings()`
#' @export
#'
#' @examples
#' # inside local_mocked_bindings()
#' \dontrun{
#' local_mocked_bindings(readline = mock_output_sequence("3", "This is a note", "n"))
#' }
#' # for understanding
#' mocked_sequence <- mock_output_sequence("3", "This is a note", "n")
#' mocked_sequence()
#' mocked_sequence()
#' mocked_sequence()
#' try(mocked_sequence())
#' recycled_mocked_sequence <- mock_output_sequence(
#'   "3", "This is a note", "n",
#'   recycle = TRUE
#' )
#' recycled_mocked_sequence()
#' recycled_mocked_sequence()
#' recycled_mocked_sequence()
#' recycled_mocked_sequence()
#' @family mocking
mock_output_sequence <- function(..., recycle = FALSE) {
  values <- rlang::list2(...)
  i <- 1
  function(...) {
    if (i > length(values) && !recycle) {
      cli::cli_abort(c(
        "Can't find value for {i}th iteration.",
        i = "{.arg ...} has only {length(values)} values.",
        i = "You can set {.arg recycle} to {.code TRUE}."
      ))
    }
    index <- (i - 1) %% length(values) + 1
    value <- rep_len(values, length.out = index)[[index]]
    i <<- i + 1
    value
  }
}
