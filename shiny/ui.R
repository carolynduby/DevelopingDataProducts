shinyUI(pageWithSidebar(
  headerPanel("Car Fuel Efficiency Estimator"),
  sidebarPanel(
    helpText("Enter the attributes of the car below."),
    selectInput("transmissionType", "Transmission Type", choices = c('Automatic'='0','Manual'='1')),
    sliderInput('quarterMileTime', 'Quarter Mile Time (seconds)', 0, min = 14, max = 23, step = 1),
    sliderInput('weight', 'Weight (pounds)', 0, min = 1500, max = 5000, step = 1)
  ),
  mainPanel(
    helpText("Predicted fuel efficiency with prediction interval and inputs of calculation appear below."),
    h3('Predicted Fuel Efficiency:'),
    verbatimTextOutput("mpg"),
    h3('Your selections:'),
    h4('Transmission Type'),
    verbatimTextOutput("transmissionType"),
    h4('Quarter Mile Time'),
    verbatimTextOutput("quarterMileTime"),
    h4('Weight'),
    verbatimTextOutput("weight")
  )
))

