library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Iris' Playground"),
    
    sidebarLayout(
      sidebarPanel(
        radioButtons("species", label="Species",
                     choices = list("Setosa" = "setosa",
                                    "Versicolor" = "versicolor",
                                    "Virginica" = "virginica"),
                     selected = 'setosa'),
        radioButtons("parts", label="Plant parts",
                     choices = list("Sepal" = "Sepal",
                                    "Petal" = "Petal"),
                     selected = 'Sepal'),
        sliderInput("size", label = h3("Marker Size"), min = 1, 
                    max = 20, value = 5),
        sliderInput("red", label = h3("Red"), min = 0, 
                    max = 255, value = 0),
        sliderInput("green", label = h3("Green"), min = 0, 
                    max = 255, value = 0),
        sliderInput("blue", label = h3("Blue"), min = 0, 
                    max = 255, value = 255)
      ),
      mainPanel(
        plotlyOutput('flower_plot')
      )
    )
  )
)