library(shiny)

# Define the UI for our layout
shinyUI(fluidPage(
        
        # Title
        titlePanel("Weekly Exercise Minutes"),
        
        # Sidepar panel to enter the number of minutes logged for each type of exercise
        # during the week
        sidebarLayout(
                sidebarPanel(
                        numericInput("endurance", label = h4("Endurance Aerobics"), value = 0, min=0, max=200, step=1),
                        br(),
                        numericInput("speed", label = h4("High-Intensity Aerobics"), value = 0, min=0, max=200, step=1),
                        br(),
                        numericInput("heavyLifting", label = h4("Heavy Weight Lifting"), value = 0, min=0, max=200, step=1),
                        br(),
                        numericInput("mediumLifting", label = h4("Medium Weight Lifting"), value = 0, min=0, max=200, step=1),
                        br(),
                        numericInput("yoga", label = h4("Yoga / Flexibility Training"), value = 0, min=0, max=200, step=1),
                        br(),
                        numericInput("other", label = h4("Other"), value = 0, min=0, max=200, step=1)   
                        ),
                
                mainPanel(
                        tabsetPanel(type="tabs",
                                    tabPanel("Plot", plotOutput("plot")),
                                    tabPanel("Table", tableOutput("table"))
                        )
                )
        )
))