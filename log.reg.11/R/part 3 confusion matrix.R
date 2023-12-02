#' @title “Confusion Matrix”  (using a cut-off value for prediction at 0.5)
#' @description based on this cut-off value, create the confusion matrix and also output the following metrics: prevalence, accuracy, sensitivity, specificity, false discovery rate, and diagnostic odds ratio
#' @param  Data: A  \code{matrix} containing the data we want to perform logistic regression on.
#' @param X:  A  \code{vector} denoting the columns of \code{Data} representing the predictor variables.
#' @param y : A  \code{integer} denoting the column of \code{Data} representing the response variable.
#' @param cut_off : A number of the value for prediction, default is 0.5. (i.e. assign value 1 for predictions above 0.5 and value 0 for prediction below or equal to 0.5)
#' @return A list of the following attributes: `confusion_matrix`, `prevalence`, `accuracy`, `sensitivity`, `specificity`, `false_discovery_rate`, `diagnostic_odds_ratio`
#' @author Group 11
#' @import MASS
#' @export
#' @examples
#' #data obtained from https://stats.oarc.ucla.edu/r/dae/logit-regression/
#' test_data <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
#'   test_resp <- 1
#'   test_pred <- 2:4
#' # Call your confusion_matrix function
#' result <- confusion_matrix(Data = test_data, X=test_pred, y=test_resp, cut_off = 0.5)
#' print(result)


confusion_matrix <- function(Data, X, y, cut_off = 0.5) {

  #calculate the beta values
  Data <- cbind(as.matrix(Data[,y]),rep(1, nrow(Data)), as.matrix(Data[,X]))
  X <- 3:(2+length(X))
  y <- 1
  beta <- log_betas(Data = Data, X = X, Y = y)$par



  # first of all Calculate the predicted probabilities
  predicted_probs <- (1 / (1 + exp(-(Data[,c(2,X)]) %*% beta)))

  # Convert continuous probabilities to binary classification labels
  predicted_labels <- ifelse(predicted_probs > cut_off, 1, 0)

  # Compare our predictions and our responses y

  TP <- sum(Data[,y] == 1 & predicted_labels == 1)
  FP <- sum(Data[,y] == 0 & predicted_labels == 1)

  FN <- sum(Data[,y] == 1 & predicted_labels == 0)
  TN <- sum(Data[,y] == 0 & predicted_labels == 0)
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

