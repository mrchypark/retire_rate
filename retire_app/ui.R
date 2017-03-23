library(shiny)
library(ggiraph)

fluidPage(

  titlePanel("퇴직 소득세 계산"),
  
  sidebarLayout(
      sidebarPanel(
        sliderInput("amount", 
                    label= "퇴직금 :", 
                  value = 1,
                  step = 1,
                  min = 1, 
                  max = 26,
                  post = "단계")
        ),
      mainPanel(ggiraphOutput("plot"))
    )
)
 
