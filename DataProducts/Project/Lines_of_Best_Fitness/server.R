library(shiny)

shinyServer(function(input, output) {
  
  # Reactive expression to generate the requested histogram. This is 
  # called whenever the inputs change.        

  
  values = reactive({
          data.frame("Endurance" <- input$endurance, 
               "Intense Aerobics" <- input$speed, 
               "Heavy Weights" <- input$heavyLifting, 
               "Med Weights" <- input$mediumLifting, 
               "Flex" <- input$yoga, 
               "Other" <- input$other)
  })

  labels = c("Endurance", "Intense Aerobics", "Heavy Weight", "Med Weight", "Flex", "Other")
  
  
  output$plot = renderPlot({
         
          
    barplot(as.numeric(values()[1,]),
         main = 'Weekly workout minutes, per exercise type',
         names.arg = labels,
         cex.names = 0.85,
         col="steelblue"
         )
  })
  

  
  # Generate an HTML table view of the data
  output$table <- renderTable({
    data.frame(categories = labels, minutes = as.numeric(values()[1,]))
  })      
})