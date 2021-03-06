library(shiny)
shinyUI(
        
        pageWithSidebar(
                # Application title
                headerPanel("Stopping Distance Prediction"),
                sidebarPanel(
                        selectInput(inputId = "idegree",
                                label = "Choose the number of degree to fit a polynomial regression model",
                                choices = c(1, 2, 3, 4),
                                selected = 1),
                        numericInput('speed', 'Speed mph', 10),
                        submitButton('Submit')
                ),
                mainPanel(
                        h3('Documentation'),
                        p('This shiny application builds a polynomial regression model to predict the stopping distance of a car given an input speed.'),
                        p('The training data set is "cars" in R package.'),
                        p('1. Choose a number from the drop down list on the left side as the degree in the polynomial regression model.'),
                        p('2. Input a speed value.'),
                        p('3. Click the submit button.'),
                        p('After clicking the submit button, the app will predict the stopping distance.'),
                        p('Meanwhile, the prediction curve is shown.'),
                        p('The ui.R and server.R code can be found on github https://github.com/ccliuc/ddp-courseproject'),
                        p(),                       
                        h3('Results of prediction'),
                        h4('You chose the number of degree to fit a polynomial regression model'),
                        verbatimTextOutput("odegree"),
                        h4('You entered the speed (unit mph)'),
                        verbatimTextOutput("inputValue"),
                        h4('Which resulted in a prediction of stopping distance (unit ft)'),
                        verbatimTextOutput("prediction"),
                        h4('Scatter plot and prediction curve'),
                        plotOutput('newPlot')
                )
        )
)