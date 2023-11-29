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
log_loss <- function(Beta, Obs, Resp, Preds){
  Obs <- cbind(as.matrix(Obs[,Resp]),rep(1, nrow(Obs)), as.matrix(Obs[,Preds]))
  p <- rep(NA, nrow(Obs))
  for(i in 1:nrow(Obs)){
    p[i] <- 1/(1+exp(-t(Obs[i,c(2,Preds)])%*%Beta))
  }
  (t(log(p))%*%(-Obs[,Resp]) - t(log(1-p))%*%(1-Obs[,Resp]))
}

