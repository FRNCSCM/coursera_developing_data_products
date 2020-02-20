# Define server logic required to draw a scatterplot
library(shiny)
library(plotly)

# Run this script in RStudio to run application
server <- function(input, output) {
  
  # Return the requested dataset
  data <- reactive({ mtcars })
  

  # Generate a summary of the dataset 
  output$summary <- renderPrint({
    dataset <- data()
    summary(dataset)
  })
  
  # Get input for X variable
  xcol <- reactive({
    mtcars[,input$x]
  })
  
  # Get input for X variable
  ycol <- reactive({
    mtcars[,input$y]
  })
  
  # Generate plotly plot
  output$plot <- renderPlotly({
      plot_ly(
      data(),
      x = xcol(),
      y = ycol(), 
      type = 'scatter',
      mode = 'markers'
      )}
  )
  
  # Show the first "n" observations
    output$view <- renderTable({
    head(data(), n = input$obs)
  })
  
}