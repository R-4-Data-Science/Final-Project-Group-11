#' @title Finding the Betas
#' @description This function will spit out the desired \code{beta} values for the
#' log loss function
#' @param Data A \code{matrix} containing the data we want to find the optimal coefficem
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
#'   log_betas(Data = test_data, Y = test_resp, X = test_pred)
log_betas <- function(Data, Y, X){


  Data <- cbind(as.matrix(Data[,Y]),rep(1, nrow(Data)), as.matrix(Data[,X]))
  if(length(X)>1){
  X <- X+1
  }
  else{X = 3}
  start_betas <- ginv(t(as.matrix(Data[,c(2,X)]))%*%as.matrix(Data[,c(2,X)]))%*%t(as.matrix(Data[,c(2,X)]))%*%as.matrix(Data[,Y])
  optim(start_betas, log_loss, Obs = Data, Resp=Y, Preds=X)

}

