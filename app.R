#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)
# Define server logic 
server <- function(input, output, session){
  # create a reactive expression for repeated code
  dataset <- reactive({
    dataset <- get(input$dataset, "package:datasets")
  })
  # Use reactive expression by calling it as a function
  output$summary <- renderPrint({
    summary(dataset())
  })
  output$table <- renderTable({
    dataset()
    
  })
}
    


# Run the application 
shinyApp(ui, server)
