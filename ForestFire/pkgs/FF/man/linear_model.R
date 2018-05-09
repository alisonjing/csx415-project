#' This is linear model function
#'
#' This function allows you to create a model to predict the
#' default rate for forest fires burned area.
#' @param df training data
#' @keywords df
#' @export
#' @examples
#' fit_linear_area()
fit_linear_area <- function(load_data) {
  lm_all <- lm(area ~ ., data = df)
  return(lm_all)
  }

