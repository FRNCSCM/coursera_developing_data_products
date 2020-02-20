# Define server logic required to draw a histogram ----
library(shiny)
library(plotly)
server <- function(input, output) {
  
  # Return the requested dataset
  data <- reactive({ mtcars })
  

  # Generate a summary of the dataset 
  output$summary <- renderPrint({
    dataset <- data()
    summary(dataset)
  })
  
  
  xcol <- reactive({
    mtcars[,input$x]
  })
  
  ycol <- reactive({
    mtcars[,input$y]
  })
  
  
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