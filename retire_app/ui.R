library(shiny)
library(ggiraph)

fluidPage(

  tags$head(
    tags$style(HTML("
      	
        @import url(http://api.mobilis.co.kr/webfonts/css/?fontface=NanumGothicWeb); 
      
      * { font-family: 'NanumGothic', '나눔고딕','NanumGothicWeb', '맑은 고딕', 'Malgun Gothic', Dotum; }
      }
      <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' />
    "))
  ),
  
  
  titlePanel(h2("퇴직 소득세 계산")),
  
  sidebarLayout(
      sidebarPanel(
        selectInput("amount", 
                    label= "퇴직금 :", 
                    unique(tdat$verb), 
                    selected = "1000만원",
                    selectize=FALSE)
        ),
      mainPanel(ggiraphOutput("plot"))
    )
)
 
