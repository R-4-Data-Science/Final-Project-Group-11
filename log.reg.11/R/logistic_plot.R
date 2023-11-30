#' @title Bootstrap Logistic Regression Confidence Intervals
#' @description Computes bootstrap confidence intervals for coefficients estimated by the logistic regression model.
#' @param Beta A \code{vector} of beta values for the logistic regression (can be obtained from the \code{log_betas} function.)
#' @param Data A \code{matrix} containing the data we want to plot
#' @param Resp A \code{integer} representing the response variable column.
#' @param pred A \code{integer} representing the predictor variable column.
#' @return A plot showing the logistic regression line.
#' @author Group 11
#' @import stats
#' @import MASS
#' @export
#' @examples
#'   test_data <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
#'   logistic_plot(test_data, Resp = 1, Pred= 3)
logistic_plot <- function(Data, Pred, Resp){

  coeffs <- log_betas(Data = Data, Y = Resp, X = Pred)$par
  curve <- function(x){(exp(coeffs[1] + coeffs[2]*x))/(1 + exp(coeffs[1] + coeffs[2]*x))}
  plot(Data[,Resp]~Data[,Pred], ylab = 'Response', xlab = colnames(Data)[Pred])
  plot(curve, add = T)

}
