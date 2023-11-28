#' @title Log Loss
#' @description This function gives a \code{numeric} representing the loss given
#' a \code{vector} of observations and a \code{matrix} of coefficients
#' @param Obs A \code{matrix} containing observations we want to
#' create a logistic model for.
#' @param Resp An \code{integer} that tells which column of the observation matrix you
#' want to be the response variable.
#' @param Preds A \code{vector} of integers corresponding to the columns for the desired predictor variables
#' @return A \code{numeric} giving value of loss at \code{beta}
#' @author Charles Benfer
#' @importFrom stats
#' @export
#' @examples
#' test_data <- matrix(NA, nrow = 10, ncol = 10)
#'test_data[,1] <- sample(c(0,1), size = 10, replace = T)
#'test_data[,2:10] <- rnorm(90)
#'log_loss(Obs = test_data , Resp = 1, Preds = 2:10)
log_loss <- function(Beta, Obs, Resp, Preds){

  p <- rep(NA, nrow(Obs))
  for(i in 1:nrow(Obs)){

  p[i] <- 1/(1+exp(-t(Obs[i,Preds])%*%Beta))

  }

  (t(log(p))%*%(-Obs[,Resp]) - t(log(1-p))%*%(1-Obs[,Resp]))

}

