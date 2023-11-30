#' @title plot for “Confusion Matrix” 
#' @description The possibility for the user to plot of any of the above metrics evaluated over a grid of cut-off values for prediction going from 0.1 to 0.9 with steps of 0.1.
#' @param  beta: A  \code{matrix} to denote the coefficient vector.
#' @param X:  A  \code{coloumn vector} containing the predictor.
#' @param y : A  \code{coloumn vector} containing the responses.
#' @param value_name : A character, representing the user's choice of which value in the matrix user wants to plot. It needs to be one of six `prevalence`, `accuracy`, `sensitivity`, `specificity`, `false_discovery_rate`, `diagnostic_odds_ratio` , the default is "prevalence"
#' @return A plot of the value choiced from user versus cut_off_value(from0.1 to 0.9 with step of 0.1)
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
#' plot_confusion_matrix(y,X,beta, value_name = "accuracy")
plot_confusion_matrix <- function(y, X, beta, value_name = "prevalence"){
  cut_off_value <- seq(0.1,0.9, by = 0.1)
  
  confusion_matrix_value <- matrix(NA, nrow = 6, ncol = 9)
  rownames(confusion_matrix_value) <- c("prevalence","accuracy", "sensitivity", "specificity", "false_discovery_rate","diagnostic_odds_ratio")
  colnames(confusion_matrix_value) <- seq(0.1, 0.9, by=0.1)

  for(i in 1:9){
      result <- confusion_matrix(beta, X, y, cut_off = cut_off_value[i])
      confusion_matrix_value[1,i] <- result$prevalence
      confusion_matrix_value[2,i] <- result$accuracy
      confusion_matrix_value[3,i] <- result$sensitivity
      confusion_matrix_value[4,i] <- result$specificity
      confusion_matrix_value[5,i] <- result$false_discovery_rate
      confusion_matrix_value[6,i] <- result$diagnostic_odds_ratio
  }
    if(value_name %in% rownames(confusion_matrix_value)){
    selected_data <- confusion_matrix_value[value_name,]
    main_title <- paste(value_name, "vs", "cut_off_value" )
    plot(selected_data,cut_off_value, type = "p", col = "blue" 
         , xlab="cut-off value"
         , ylab= value_name
         , main = main_title)
    grid()
    } else {
      cat(value_name, "do not exist.\n")
    }
}   


# Reference：https://chat.openai.com/share/d17d0b56-4d16-4200-8ab9-668d61c9ac1b