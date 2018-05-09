#' This is fire burned area prediction function
#'
#' This function allows you to predict the
#' default rate for burned area of forest fires
#' @param test_data student loan application parameters
#' @keywords burned_area
#' @export
#' @examples
#' predict_burned_area()

predict_burned_area <- function(testData) {
  load_packages()
  return(predict(fit_linear_area(tidy_data(load_data())), testData))
}

