library(shiny)
library(dplyr)
library(plotly)

shinyServer(function(input, output) {
  output$flower_plot <- renderPlotly({
    data("iris")
    filtered <- filter(iris, Species == input$species)
    xAxisName <- paste0(input$parts, ".Length")
    yAxisName <- paste0(input$parts, ".Width")
    colorBar <- paste0("rgb(",input$red,", ", input$green, ", ", input$blue, ")")
    name <- input$species
    graph_title <- paste(toupper(substr(name, 1, 1)), substr(name, 2, nchar(name)), sep="")
        
    p <- plot_ly(filtered,
                 x = filtered[[xAxisName]],
                 y = filtered[[yAxisName]],
                 mode = 'markers',
                 marker = list(color = colorBar,
                               size =input$size))

    layout(p,
           title = graph_title,
           yaxis = list(title = paste0(input$parts, " Width")),
           xaxis = list(title = paste0(input$parts, " Length"))
           )
  })
})