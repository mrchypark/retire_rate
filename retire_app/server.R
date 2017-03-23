library(shiny)

function(input, output) {

  output$plot <- renderggiraph({
    g <- ggplot(tdat[tdat$retire==slideData[input$amount,"amount"],], aes( x = as.factor(year), y = value)) + theme_minimal()
    gg <- g + geom_bar_interactive(aes(fill=input$amount,tooltip = paste0("소득세: ", as.character(value),"원<br> 세율: ",as.character(rate),"%")), stat="identity" ,
                                   show.legend = FALSE)+ scale_x_discrete(name="소득세",breaks=unique(tdat[,2]),
                                          labels=c("1 년후", "2 년후", "3 년후","5 년후","7 년후","10 년후","15 년후","20 년후"))+
      theme(axis.ticks = element_blank(), axis.text.y = element_blank(),axis.title.y = element_blank())+
      theme(plot.title = element_text(lineheight=.8, face="bold"))
      if(nchar(slideData[input$amount,"amount"]/10000)<5){ggg<-gg+ggtitle(paste0("퇴직금이 ", slideData[input$amount,"amount"]/10000,"만원 일때"))}
      if(nchar(slideData[input$amount,"amount"]/10000)==5){ggg<-gg+ggtitle(paste0("퇴직금이 ", slideData[input$amount,"amount"]/100000000,"억원 일때"))}
      
      
    ggiraph(code =  {print(ggg)}, selection_type = "multiple", tooltip_offx = 20, tooltip_offy = -10)
  })
}