library(shiny)

function(input, output) {

  output$plot <- renderggiraph({
    g <- ggplot(tdat[tdat$retire==input$amount,], aes( x = as.factor(year), y = value) ) + theme_minimal()
    gg <- g + geom_bar_interactive(aes(tooltip = value), stat="identity")
    ggiraph(code =  {print(gg)}, flexdashboard=T, selection_type = "multiple")
  })
  
}