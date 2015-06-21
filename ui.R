library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predicting Miles Per Gallon"),
  
  # Sidebar with controls to provide a caption, select a dataset,
  # and specify the number of observations to view. Note that
  # changes made to the caption in the textInput control are
  # updated in the output area immediately as you type
  sidebarLayout(
    sidebarPanel( 
      textInput("caption", "Result Title:", "Forecasted MPG"),
      selectInput("am", "Transmission (0 = automatic, 1 = manual)", choices=c(0,1)),
      numericInput("disp", "Displacement (cubic inches)",225,75,500,25),
      numericInput("hp", "Gross horsepower",150,50,350,25),
      numericInput("wt", "Weight (lb/1000)",3.25,1.5,5.5,.25),
      numericInput("qsec", "1/4 mile time in seconds",18,14.5,23,.5)
      ),
    
    
    # Show the caption, a summary of the dataset and an HTML 
    # table with the requested number of observations
    mainPanel(
      h3(textOutput("caption", container = span)),      
      verbatimTextOutput("summary"),
      htmlOutput("text")
      
    )
  )
))