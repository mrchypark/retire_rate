library(shiny)
library(ggiraph)
fluidPage(
  
  titlePanel("퇴직 소득세 계산"),
  
  sidebarLayout(
      sidebarPanel(sliderInput("amount", 
                  "퇴직금 :", 
                  value = 500000,
                  step = 500000,
                  min = min(tdat[,1]), 
                  max = max(tdat[,1]))),
      mainPanel(ggiraphOutput("plot"))
    )
)

