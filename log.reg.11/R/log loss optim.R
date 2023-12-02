#' @title Finding the Betas
#' @description This function will spit out the desired \code{beta} values for the
#' log loss function
#' @param Data a \code{matrix} of data that we want to do a logistic regression on.
#' @param Y A \code{integer} representing the column of the data that you want to be the response variable
#' @param X A \code{vector} representing the column(s) of the data that you want to be the predictor variable(s).
#' @return  A \code{vector} giving the optimized beta values
#' @author Group 11
#' @import stats
#' @import MASS
#' @export
#' @examples
#'   #data obtained from https://stats.oarc.ucla.edu/r/dae/logit-regression/
#'   test_data <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
#'   test_resp <- 1
#'   test_pred <- 2:4
#'   log_betas(Data = test_data, Y = test_resp, X = test_pred)
log_betas <- function(Data, Y, X){


  Data <- cbind(as.matrix(Data[,Y]),rep(1, nrow(Data)), as.matrix(Data[,X]))
  X <- 3:(2+length(X))
  Y <- 1
  start_betas <- ginv(t(as.matrix(Data[,c(2,X)]))%*%as.matrix(Data[,c(2,X)]))%*%t(as.matrix(Data[,c(2,X)]))%*%as.matrix(Data[,Y])
  optim(start_betas, log_loss, Obs = Data, Resp=Y, Preds=X)

}

