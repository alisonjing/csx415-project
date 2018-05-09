#' This is load data function
#'
#' This function allows you to read the raw dataset of forest fires.
#' for prediction models
#' @param none
#' @keywords df
#' @export
#' @examples
#' load_data()

load_data <- function() {
  df <-read.csv("https://github.com/alisonjing/csx415-project/blob/master/ForestFire/data/forestfires.csv")
  return(df)
}



