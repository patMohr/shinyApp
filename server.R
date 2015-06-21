library(shiny)
library(datasets)
shinyServer(function(input, output) {  
  am <- reactive({input$am})
  disp <- reactive({input$disp})  
  hp <- reactive({input$hp})
  wt <- reactive({input$wt})
  qsec <- reactive({input$qsec})
  
  output$caption <- renderText({
    input$caption
  })
  
  output$summary <- renderText({
     mpg= 14.36 + 3.47045*as.numeric(am()) + 0.01124*disp() - 0.02117*hp() - 4.0843*wt() + 1.00690*qsec()
    
    print(round(mpg,2))  
  })
  
  output$text <- renderUI({
    str1 ="USER GUIDE"
    str2 = "This application forecasts MPG based on user input details for a given vehicle."
    str3 = "Users can adjuste the input for transmission type, engine displacement, horsepower, 
    weight and quarter mile time."
    str4= "The application will dynamically calculate a new estimated MPG when an input is changed."
    str5 = "The estimated MPG is based on a regression model from the R mtcars data set."
    HTML(paste(str1,"",str2,"",str3,"",str4,"",str5, sep = '<br/>'))
  #print(paste(str1,str2))
    })
  
})