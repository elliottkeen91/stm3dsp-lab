library(shiny)

ui <- fluidPage(
  titlePanel("Simple counter application"),
  
  sidebarLayout(
    sidebarPanel(
      actionButton("inc", "Increment"),
      actionButton("dec", "Decrement", disabled = FALSE),
      actionButton("res", "Reset"),
      numericInput("amt", "amount", 1, step = 1),
      numericInput("usrIn", "User Input", 0, min = 0, step = 1),
      actionButton("set", "Set")
    ),
    
    mainPanel(
      h3("Current count:"),
      textOutput("count")
    )
  )
)

server <- function(input, output, session) {
  numbers <- reactiveVal(0)

  
  observe({
    if (numbers() == 0) {
     updateActionButton(session, "dec", disabled = TRUE)
    }else { 
      updateActionButton(session, "dec", disabled = FALSE)}
  })
  
  observeEvent(input$set, {
    numbers(input$usrIn)
  })
  
  textOutput("numbers")
  
  observeEvent(input$inc, {
    numbers(numbers() + input$amt)
  })

  observeEvent(input$dec, {
    numbers(max(0,numbers() - input$amt))

    
  })
  
 
  observeEvent(input$res, {
    numbers(0)
  })
  
  output$count <- renderText({
    numbers()
  })
}

shinyApp(ui, server)