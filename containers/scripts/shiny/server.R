library(shiny)

shinyServer(function(input, output) {
  data <- reactive({ 
    FUN <- switch(input$family,
                  "Normal" = rnorm,
                  "Uniform" = runif,
                  "Exponential" = rexp)
    FUN(input$n)
  })
  
  output$histogram <- renderPlot({
    hist(data(), breaks = input$bins)
  })

})
