#' @title plot for “Confusion Matrix”
#' @description The possibility for the user to plot of any of the above metrics evaluated over a grid of cut-off values for prediction going from 0.1 to 0.9 with steps of 0.1.
#' @param  Data: A  \code{matrix} containing the data we want to perform logistic regression on.
#' @param X:  A  \code{vector} denoting the columns of \code{Data} representing the predictor variables.
#' @param y : A  \code{integer} denoting the column of \code{Data} representing the response variable.
#' @param value_name : A character, representing the user's choice of which value in the matrix user wants to plot. It needs to be one of six `prevalence`, `accuracy`, `sensitivity`, `specificity`, `false_discovery_rate`, `diagnostic_odds_ratio` , the default is "prevalence"
#' @return A plot of the value chosen from user versus cut_off_value(from0.1 to 0.9 with step of 0.1)
#' @author Group 11
#' @import stats
#' @import MASS
#' @export
#' @examples
#' #data obtained from https://stats.oarc.ucla.edu/r/dae/logit-regression/
#' test_data <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
#'   test_resp <- 1
#'   test_pred <- 2:4
#' result <- confusion_matrix(Data = test_data, X= test_pred, y = test_resp, cut_off = 0.5)
#' plot_confusion_matrix(Data = test_data, y = test_resp,X = test_pred , value_name = 'false_discovery_rate')
plot_confusion_matrix <- function(Data, y, X, value_name = "prevalence"){
  cut_off_value <- seq(0.1,0.9, by = 0.1)


  confusion_matrix_value <- matrix(NA, nrow = 6, ncol = 9)
  rownames(confusion_matrix_value) <- c("prevalence","accuracy", "sensitivity", "specificity", "false_discovery_rate","diagnostic_odds_ratio")
  colnames(confusion_matrix_value) <- seq(0.1, 0.9, by=0.1)

  for(i in 1:9){
      result <- confusion_matrix(Data = Data, X = X, y = y, cut_off = cut_off_value[i])
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
