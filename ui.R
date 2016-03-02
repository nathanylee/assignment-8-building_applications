library(plotly)
library(shiny)
library(dplyr)

shinyUI(fluidPage(
    # Create a title
    titlePanel('Iris Dataset'),
    # Create sidebar layout
    sidebarLayout(
      
      # Side panel for controls
      sidebarPanel(
        # Create radio buttons manipulating the variable on the X-Axis
        #selectInput(
          radioButtons("xaxis", label=h3("X Axis Input"),
            choices = list("Sepal Length" = "Sepal.Length",
                           "Sepal Width" = "Sepal.Width", 
                           "Pedal Length" = "Petal.Length",
                           "Pedal Width" = "Petal.Width")
          ),
       # ),
        # Create selection box manipulating the variable on the Y-Axis
        selectInput("yaxis", label=h3("Y Axis Input"),
                    choices = list(
                      "Sepal Width" = "Sepal.Width",
                      "Sepal Length" = "Sepal.Length", 
                      "Petal Length" = "Petal.Length",
                      "Petal Width" = "Petal.Width")
                    
        )
      ),
      
      # Main panel: display scatter plot and header that indicates what two variables are being compared.
      mainPanel(
        h3(textOutput("caption")),
        plotOutput('scatter')
      )
    )
))

