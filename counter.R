library(shiny)

ui <- fluidPage(
  titlePanel("Simple counter application"),
  
  sidebarLayout(
    sidebarPanel(
      actionButton("inc", "Increment"),
      actionButton("dec", "Decrement"),
      actionButton("res", "Reset"),
      numericInput("amt", "amount", 1, step = 1)
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
    numbers(numbers() + input$amt)
  })
  
  
  observeEvent(input$dec, {
    if (numbers(numbers() - input$amt) < 0){
      numbers()
    } else{
      numbers(numbers() - input$amt)
    }
  })
 
  observeEvent(input$res, {
    numbers(0)
  })
  
  output$count <- renderText({
    numbers()
  })
}

shinyApp(ui, server)