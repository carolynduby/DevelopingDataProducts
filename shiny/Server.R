
estimateFuelEfficiency <- function(transmissionType, quarterMileSeconds, weightPounds) {

  data(mtcars)
  fit <- lm(mpg ~ factor(am) + wt + qsec, mtcars)
  prediction <- predict(fit, newdata = data.frame(am = transmissionType, wt = weightPounds/1000, qsec=quarterMileSeconds), interval = ("prediction"))
  paste(round(prediction[1,1], 0), "mpg (", round(prediction[1, 2], 0), "to", round(prediction[1, 3], 0), "mpg prediction interval)")
}

shinyServer(
  function(input, output) {
    
    output$transmissionType <- renderText({ifelse(input$transmissionType == 0, "Automatic", "Manual")})
    output$quarterMileTime <- renderText({paste(input$quarterMileTime, "seconds")})
    output$weight <- renderText({paste(input$weight, "pounds")})
    output$mpg <- renderText({estimateFuelEfficiency(input$transmissionType, input$quarterMileTime, input$weight)})  
  }
)