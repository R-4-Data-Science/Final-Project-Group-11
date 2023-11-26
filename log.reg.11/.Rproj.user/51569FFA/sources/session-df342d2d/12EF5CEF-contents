#' @title Finding the Betas
#'
#' @description This function will spit out the desired \code{beta} values for the
#' least squares function
#' @param Beta A \code{vector} containing the desired starting coeffs for estimation
#' @param f A \code{function} that we are optimizing. Default is \code{least_square} from the same package
#' @param y A \code{vector} containing outputs
#' @param x A \code{matrix} containing predictors
#' @param Norm A \code{character} defining loss to use (either 'L1' or 'L2')
#' @return A \code{vector} giving the optimized beta values
#' @author Charles Benfer
#' @importFrom stats
#' @export
#' @examples
#'   x <- matrix(rnorm(600), nrow=200)
#'   epsilon <- rnorm(200, 0, sd=.25)
#'   x <- cbind(rep(1,200), x)
#'   actual_beta <- rnorm(4,5,10)
#'   y <- x%*%actual_beta + epsilon
#'   start_beta <- rnorm(4)
#'   betas(Beta=start_beta,y=y, x=x, Norm="L2")
betas <- function(Beta, f, x, y, Norm){
  optim(Beta, f, Y=y, X=x, norm=Norm)
}

