#back end
library(MASS)
input <- 'prevalence'
value_name <- input
metric_plot <- plot_confusion_matrix(Data, y, X, value_name = "prevalence")


# Define UI for application that plots one of the confusion matrix metrics
library(shiny)
ui <- fluidPage(

  # Application title
  titlePanel("Confusion Matrix Plot"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      helpText('In order to view the plots, you must have your data set saved as "Data", your response column saved as
               "y" and your predictor column(s) saved as "X" in your R session.'),
      selectInput('metric',
                  'Metric to Plot',
                  c("prevalence","accuracy", "sensitivity", "specificity", "false_discovery_rate","diagnostic_odds_ratio"))
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("metric_plot")
    )
  )
)


server <- function(input, output){

  output$metric_plot <- renderPlot({

    metric_plot <- plot_confusion_matrix(Data, y, X, value_name = input$metric)

  })

}

shinyApp(ui = ui, server = server)
