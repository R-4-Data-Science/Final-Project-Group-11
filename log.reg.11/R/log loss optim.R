#' @title Finding the Betas
#' @description This function will spit out the desired \code{beta} values for the
#' log loss function
#' @param Beta A \code{vector} containing the desired starting coeffs for estimation
#' @param f A \code{function} that we are optimizing. Default is \code{log_loss} from the same package
#' @param
#' @return A \code{vector} giving the optimized beta values
#' @author Charles Benfer
#' @importFrom stats
#' @export
#' @examples
#'
log_betas <- function(Data, Y, X){

  start_betas <- solve(t(Data[,X])%*%Data[,X])%*%t(Data[,X])%*%Data[,Y]
  optim(start_betas, log_loss, Obs = Data, Resp=Y, Preds=X)

}

test_data <- matrix(NA, nrow = 10, ncol = 10)
test_data[,1] <- sample(c(0,1), size = 10, replace = T)
test_data[,2:10] <- rnorm(90)

log_betas(test_data, Y = 1, X = 2:10)
