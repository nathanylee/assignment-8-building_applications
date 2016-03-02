library(plotly)
library(shiny)
library(datasets)
library(dplyr)
library(rsconnect)
library(ggplot2)

#setwd("C:/Users/Nathan/Documents/info498f/assignment-8-building_applications")
#setwd("C:/Users/Nathan/Documents/info498f/assignment-8-building_applications/rsconnect/shinyapps.io/nathanylee")

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