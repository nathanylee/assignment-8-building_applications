library(plotly)
library(shiny)
library(datasets)
library(dplyr)
library(rsconnect)
library(ggplot2)

#---This line of code was used to set the working directory for testing the app in RStudio, but had to be taken out 
#---because it messed up the shinyapps.io upload
#setwd("C:/Users/Nathan/Documents/info498f/assignment-8-building_applications")

#dataset <- data(iris)
dataset <- iris

shinyServer(function(input, output) {
  #output$scatter <- renderPlotly({
    #plot_ly(data = dataset, x = input$xaxis, y = input$yaxis, mode = "markers", color = Species)
  #})
  #output$scatter <- renderPlotly({
    #plot_ly(data = dataset, x = Sepal.Length, y = Sepal.Width, mode = "markers", color = Species)
    
  #})
  
  # Create header for the scatter plot
  graph_header <- reactive({
    paste(input$xaxis, " compared to ", input$yaxis)
  })
  
  # Return header for the scatter plot
  output$caption <- renderText({
    graph_header()
  })
  
  # Create the scatter plot
  output$scatter <- renderPlot({
    p <- ggplot(iris, aes_string(x=input$xaxis, y=input$yaxis, colour="Species")) + geom_point()
    print(p)
  })
})