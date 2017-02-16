library(sp)
library(maptools)
library(shiny)
library(colorRamps)

load("data/PLZber.rds")
Namen <- c("street_lamp","traffic_signals")

Namen2 <- Namen

shinyServer(function(input,output) {
  output$map <- renderPlot({
    eval(parse(text=paste("data <- switch(input$var,",paste("'",Namen,"'='",Namen,"'",collapse=",",sep=""),
                          ")",sep="")))
    col1 <- switch(input$color,"blue2red"=blue2red(100),
                   "blue2green"=blue2green(100),"green2red"=green2red(100),"blue2yellow"=blue2yellow(100),
                   "matlab.like"=matlab.like(100))
    spplot(PLZber,data,col.regions=col1)
  })
  output$map2 <- renderPlot({
    eval(parse(text=paste("data <- switch(input$var2,",paste("'",Namen2,"'='",Namen2,"'",collapse=",",sep=""),
                          ")",sep="")))
    col2 <- switch(input$color2,"blue2red"=blue2red(100),
                   "blue2green"=blue2green(100),"green2red"=green2red(100),"blue2yellow"=blue2yellow(100),
                   "matlab.like"=matlab.like(100))
    spplot(PLZber,data,col.regions=col2)
  })
})
