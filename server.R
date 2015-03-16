library(shiny)
library(datasets)
data(cars)

stoppingDis <- function(inputSpeed, inputDegree) {
        degree <- as.numeric(inputDegree) 
        fm <- lm(dist ~ poly(speed, degree), data = cars)
        predict(fm, data.frame(speed = inputSpeed))[[1]]
}

shinyServer(
        function(input, output) {
                output$inputValue <- renderText({input$speed})
                output$prediction <- renderText({stoppingDis(input$speed, input$idegree)})
                output$odegree <- renderText({input$idegree})
                output$newPlot <- renderPlot({
                        plot(cars, xlab = "Speed (mph)", ylab = "Stopping distance (ft)",
                             las = 1, xlim = c(0, 25))
                        d <- seq(0, 25, length.out = 200)
                        
                        fm <- lm(dist ~ poly(speed, as.numeric(input$idegree)), data = cars)
                        lines(d, predict(fm, data.frame(speed = d)), col="red")
                        
                })
        }
)