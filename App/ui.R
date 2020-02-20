# Define UI for app that draws a scatterplot
library(shiny)
library(plotly)

ui <- fluidPage(
  
  # App title
  titlePanel("Developing Data Products Week 4"),
  
  # Sidebar layout with input and output definitions 
  sidebarLayout(
    
    # Sidebar panel for inputs
    sidebarPanel(
      
     # Variable x input
      selectInput(inputId = "x",
                  label = "X Variable", 
                  choices = names(mtcars)),
      
      # Variable y input
      selectInput(inputId = "y",
                  label = "Y Variable",
                  names(mtcars)),
      selected = names(mtcars)[[2]],
      
      # Input: Numeric entry for number of obs to view
      numericInput(inputId = "obs",
                   label = "Number of observations to view:",
                   value = 10),
      
      
    ),
    
    # Main panel for displaying outputs
    mainPanel(
      
      # Output: Formatted text for caption
      h3(textOutput("caption", container = span)),
      
      # Output: Verbatim text for data summary
      verbatimTextOutput("summary"),
      
      # Output: Plotly scatterplot
      plotlyOutput(outputId = 'plot'),
      
      # Output: HTML table with requested number of observations
      tableOutput("view")
      
    )
  )
)