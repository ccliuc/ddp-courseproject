library(shiny)
shinyUI(
        
        pageWithSidebar(
                # Application title
                headerPanel("Stopping distance prediction"),
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
                        p('First, choose a number from the drop down list on the left side as the degree in the polynominal regression model.'),
                        p('Second, input a speed value.'),
                        p('Third, click the submit button.'),
                        p('After clicking the submit button, the app will predict the stopping distance.'),
                        p('Meanwhile, the prediction curve is shown.'),
                        p(),                       
                        h3('Results of prediction'),
                        h4('You entered the speed (unit mph)'),
                        verbatimTextOutput("inputValue"),
                        h4('Which resulted in a prediction of stopping distance (unit ft)'),
                        verbatimTextOutput("prediction"),
                        h4('You chose the number of degree to fit a polynomial regression model'),
                        verbatimTextOutput("odegree"),
                        h4('Scatter plot and prediction curve'),
                        plotOutput('newPlot')
                )
        )
)