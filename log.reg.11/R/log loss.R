#' @title Log Loss
#' @description This function gives a \code{numeric} representing the loss given
#' a \code{vector} of observations and a \code{matrix} of coefficients
#' @param Obs A \code{vector} containing observations we want to
#' create a logistic model for.
#' @param betas A \code{matrix} containing hypothesized beta values.
#' @return A \code{numeric} giving value of loss at \code{beta}
#' @author Charles Benfer
#' @importFrom stats
#' @export
#' @examples
#' data <- rlogis(20)
#' guess <- matrix(rnorm(400), nrow = 20)
#' log_loss(betas = guess, obs = data)
log_loss <- function(betas, obs){

  beta_theo <- solve(t(betas)%*%betas)%*%t(betas)%*%obs
  p <- rep(NA, length(obs))
  for(i in 1:length(obs)){
  p[i] <- 1/(1+exp(-t(betas[i,])%*%beta_theo))
  }

  (t(log(p))%*%(-obs) - t(log(1-p))%*%(1-obs))

}

log_loss(test_data, test_betas)
