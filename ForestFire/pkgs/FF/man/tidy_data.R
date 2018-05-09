
#' This is tidy data function
#'
#' This function allows you to clean up and tidy the training data
#' required for burn area of forest fires prediction model.
#' @param default_rates uncleaned training data
#' @keywords default_rate
#' @export
#' @examples
#' tidy_data()
tidy_data <- function(df) {
  # converting month and day from characters to numerical types
  df$month <- as.numeric(df$month)
  df$day <- as.numeric(df$day)
}

