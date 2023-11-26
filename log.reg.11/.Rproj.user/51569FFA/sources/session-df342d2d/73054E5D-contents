#' @title Evaluate Linear Loss Function
#' @description This function delivers the value of the loss function for a given
#' value of \code{beta}
#' @param Beta A \code{vector} containing coeffs
#' @param Y A \code{vector} containing outputs
#' @param X A \code{matrix} containing predictors
#' @param norm A \code{character} defining loss to use (default is 'L2')
#' @return A \code{numeric} giving value of loss at \code{beta}
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
#'   squared_error(start_beta, Y=y, X=x, norm="L2")
squared_error <- function(Beta, Y, X, norm){

  if(norm == "L2"){

    out <- t(Y - X%*%Beta)%*%(Y-X%*%Beta)

  }

  else{

    out <- abs(Y - X%*%Beta)%*%rep(1, length(Y))

  }

  return(out)

}
