library(shiny)
library(ggiraph)

fluidPage( tags$head(tags$meta(name="viewport", content="width=device-width, initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no")),

  titlePanel(h2("은퇴퇴퇴퇴 소득세 계산")
             ),
  
  sidebarLayout(
      
      sidebarPanel(
            selectInput("amount", 
                    label= "퇴직금 :", 
                    unique(tdat$verb), 
                    selected = "1000만원",
                    selectize=FALSE),
            p("* 막대그래프를 터치하여 확인하세요.")
        ),
      mainPanel(ggiraphOutput("plot"))
    )
)
 
