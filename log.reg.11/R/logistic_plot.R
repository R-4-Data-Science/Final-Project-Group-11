#' @title Bootstrap Logistic Regression Confidence Intervals
#' @description Computes bootstrap confidence intervals for coefficients estimated by the logistic regression model.
#' @param Beta A \code{vector} of beta values for the logistic regression (can be obtained from the \code{log_betas} function.)
#' @param Data A \code{matrix} containing the data we want to plot
#' @param Resp A \code{integer} representing the response variable column.
#' @param pred A \code{integer} representing the predictor variable column.
#' @return A plot showing the logistic regression line.
#' @author Ernest Asante
#' @import stats
#' @export
#' @examples
#'   test_data <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
#'   logistic_plot(test_data, Resp = 1, Pred= 3)
logistic_plot <- function(Data, Pred, Resp){


}
