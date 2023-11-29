#' @title Finding the Betas
#' @description This function will spit out the desired \code{beta} values for the
#' log loss function
#' @param Beta A \code{vector} containing the desired starting coeffs for estimation
#' @param f A \code{function} that we are optimizing. Default is \code{log_loss} from the same package
#' @param
#' @return A \code{vector} giving the optimized beta values
#' @author Charles Benfer
#' @import stats
#' @import MASS
#' @export
#' @examples
#'   #data obtained from https://stats.oarc.ucla.edu/r/dae/logit-regression/
#'   test_data <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
#'   test_resp <- 1
#'   test_pred <- 2:4
#'   log_betas(Data = test_data, Y = 1, X = 2:4)
log_betas <- function(Data, Y, X){

  start_betas <- solve(t(as.matrix(Data[,X]))%*%as.matrix(Data[,X]))%*%t(as.matrix(Data[,X]))%*%as.matrix(Data[,Y])

  optim(start_betas, log_loss, Obs = Data, Resp=Y, Preds=X)

}

