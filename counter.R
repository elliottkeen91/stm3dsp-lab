library(shiny)

ui <- fluidPage(
  titlePanel("Simple counter application"),
  
  sidebarLayout(
    sidebarPanel(
      actionButton("inc", "Increment"),
      actionButton("dec", "Decrement"),
      actionButton("res", "Reset")
    ),
    
    mainPanel(
      h3("Current count:"),
      textOutput("count")
    )
  )
)

server <- function(input, output, session) {
  numbers <- reactiveVal(0)
  textOutput("numbers")
  
  observeEvent(input$inc, {
    numbers(numbers() + 1)
  })
  observeEvent(input$dec, {
    numbers(numbers() - 1)
  })
  
  observeEvent(input$res, {
    numbers(0)
  })
  
  output$count <- renderText({
    numbers()
  })
}

shinyApp(ui, server)