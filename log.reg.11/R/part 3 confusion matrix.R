#' @title “Confusion Matrix”  (using a cut-off value for prediction at 0.5)
#' @description based on this cut-off value, create the confusion matrix and also output the following metrics: prevalence, accuracy, sensitivity, specificity, false discovery rate, and diagnostic odds ratio
#' @param  beta: A  \code{matrix} to denote the coefficient vector.
#' @param X:  A  \code{coloumn vector} containing the predictor.
#' @param y : A  \code{coloumn vector} containing the responses.
#' @param cut_off : A number of the value for prediction, default is 0.5. (i.e. assign value 1 for predictions above 0.5 and value 0 for prediction below or equal to 0.5)
#' @return A list of the following attributes: `confusion_matrix`, `prevalence`, `accuracy`, `sensitivity`, `specificity`, `false_discovery_rate`, `diagnostic_odds_ratio`
#' @author Group 11
#' @importFrom stats runif
#' @export
#' @examples 
#' # Generate synthetic data
#' set.seed(123)
#' n <- 100
#' X <- cbind(1, rnorm(n))  # Assuming X includes a column of 1's for the intercept
#' beta <- c(-1, 2)         # Coefficients (intercept = -1, slope = 2)
#' y <- ifelse((1 / (1 + exp(-X %*% beta))) > 0.5, 1, 0)  # Generate binary labels
#' # Call your confusion_matrix function
#' result <- confusion_matrix(beta, X, y, cut_off = 0.5)


confusion_matrix <- function(beta, X, y, cut_off = 0.5) {
  # first of all Calculate the predicted probabilities
  predicted_probs <- (1 / (1 + exp(-X %*% beta)))

  # Convert continuous probabilities to binary classification labels
  predicted_labels <- ifelse(predicted_probs > cut_off, 1, 0)
  
  # Compare our predictions and our responses y
  
  TP <- sum(y == 1 & predicted_labels == 1)
  FP <- sum(y == 0 & predicted_labels == 1)
  
  FN <- sum(y == 1 & predicted_labels == 0)
  TN <- sum(y == 0 & predicted_labels == 0)
  total_positive <- TP + FN
  total_negative <- FP + TN
  
  # Create the list for result
  confuse_matrix <- matrix(c(TN, FP, FN, TP), nrow = 2)
  rownames(confuse_matrix) <-  c("Actual Positive", "Actual Negative")
  colnames(confuse_matrix) <-  c("Predicted Positive", "Predicted Negative")
  
  prevalence <- total_positive / (total_positive + total_negative)
  accuracy <- (TP + TN) / (total_positive + total_negative)
  sensitivity <- TP / (TP + FN)
  specificity <- TN / (TN + FP)
  false_discovery_rate <- FP / (FP + TP)
  diagnostic_odds_ratio <- (TP * TN) / (FP * FN)
  
  # Create the list and return it
  final_confusion_matrix <- list(
    confuse_matrix = confuse_matrix,
    prevalence = prevalence,
    accuracy = accuracy,
    sensitivity = sensitivity,
    specificity = specificity,
    false_discovery_rate = false_discovery_rate,
    diagnostic_odds_ratio = diagnostic_odds_ratio
  )
  return(final_confusion_matrix)
}

#refrence:
# https://chat.openai.com/share/d17d0b56-4d16-4200-8ab9-668d61c9ac1b

