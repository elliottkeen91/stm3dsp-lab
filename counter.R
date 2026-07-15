library(shiny)

ui <- fluidPage(
  titlePanel("Simple counter application"),
  
  sidebarLayout(
    sidebarPanel(
      actionButton("inc", "Increment"),
    ),
    
    mainPanel(
      h3("Current count:"),
      textOutput("count")
    )
  )
)

server <- function(input, output, session) {
  # TODO: Create reactiveVal to store the count
  
  # TODO: Define an observer to update count based on button clicks
  
  # TODO: Render the current count
}


shinyApp(ui, server)