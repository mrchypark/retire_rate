library(shiny)
library(ggiraph)

fluidPage(

  tags$head(
    tags$style(HTML("
      	
        @import url(http://api.mobilis.co.kr/webfonts/css/?fontface=NanumGothicWeb); 
      
      * { font-family: 'NanumGothic', '나눔고딕','NanumGothicWeb', '맑은 고딕', 'Malgun Gothic', Dotum; }
      }

    "))
  ),
  
  
  titlePanel("퇴직 소득세 계산"),
  
  sidebarLayout(
      sidebarPanel(
        sliderInput("amount", 
                    label= "퇴직금 조절", 
                  value = 1,
                  step = 1,
                  min = 1, 
                  max = 26,
                  post = "단계")
        ),
      mainPanel(ggiraphOutput("plot"))
    )
)
 
