#' @title Bootstrap Logistic Regression Confidence Intervals
#' @description Computes bootstrap confidence intervals for coefficients estimated by the logistic regression model.
#' @param obs A \code{matrix} containing the full data set with predictors and response.
#' @param resp A \code{integer} representing the response variable column.
#' @param pred A \code{vector} representing the predictor variables.
#' @param alpha A \code{numeric} representing the significance level for the confidence intervals (default is 0.05).
#' @param B A \code{integer} representing the number of bootstrap samples to generate (default is 20).
#' @return A \code{matrix} with coefficients and their corresponding lower and upper confidence intervals
#' @author Ernest Asante
#' @import stats
#' @export
#' @examples
#'   #data obtained from https://stats.oarc.ucla.edu/r/dae/logit-regression/
#'   test_data <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
#'   test_resp <- 1
#'   test_pred <- 2:4
#'   results <- suppressWarnings(bootstrap_logistic_confidence(test_data, test_resp, test_pred))
#'   print(results)
bootstrap_logistic_confidence <- function(obs, resp, pred, alpha = 0.05, B = 20) {
  original_fit <- log_betas(Data = obs, Y = resp, X = pred)
  coeffs <- original_fit$par

  boot_coefs <- matrix(NA, nrow = B, ncol = length(coeffs))

  for (i in 1:B) {
    sampled_data <- obs[sample(nrow(obs), replace = TRUE), ]
    boot_coefs[i, ] <- log_betas(Data = sampled_data, Y = resp, X = pred)$par
  }

  ci_matrix <- matrix(NA, nrow = length(coeffs), ncol = 3)
  colnames(ci_matrix) <- c("Actual", "Lower", "Upper")
  for (j in 1:length(coeffs)) {
    se <- sd(boot_coefs[, j])
    z_value <- qnorm(1 - alpha / 2)
    ci_matrix[j, ] <- c(coeffs[j], coeffs[j] - z_value * se, coeffs[j] + z_value * se)
  }

  return(ci_matrix)
}

