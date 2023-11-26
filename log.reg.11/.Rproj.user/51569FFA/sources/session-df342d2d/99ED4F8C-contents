#' @title Finding the Betas
#'
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
log_betas <- function(betas, Data){
  start_betas <- solve(t(betas)%*%betas)%*%t(betas)%*%Data
  optim(start_betas, f = log_loss, obs = Data)
}

test_betas <- matrix(rnorm(100), nrow = 10, ncol = 10)
test_data <- rnorm(11)

log_betas(betas = test_betas, Data = test_data )
