library(sp)
library(maptools)
library(shiny)
library(colorRamps)
library(leaflet)

load("data/PLZber.rds")
Namen <- c("street_lamp","traffic_signals","restaurant")

load("data/info_restaurant_Berlin.RData")

shinyServer(function(input,output) {
  output$map <- renderPlot({
    eval(parse(text=paste("data <- switch(input$var,",paste("'",Namen,"'='",Namen,"'",collapse=",",sep=""),
                          ")",sep="")))
    col1 <- switch(input$color,"blue2red"=blue2red(100),
                   "blue2green"=blue2green(100),"green2red"=green2red(100),"blue2yellow"=blue2yellow(100),
                   "matlab.like"=matlab.like(100))
    spplot(PLZber,data,col.regions=col1)
  })
  output$map2 <- renderLeaflet({
    bgmap1 <- switch(input$bgmap,"OpenStreetMap"="OpenStreetMap.DE","Stamen Watercolor"="Stamen.Watercolor","OpenStreetMap Mapnik"="OpenStreetMap.Mapnik",
                     "OpenStreetMap - black and white"="OpenStreetMap.BlackAndWhite")
    leaflet() %>% 
      addProviderTiles(bgmap1) %>% 
      setView(lng = 13.40495, lat = 52.52001, zoom = 10)%>%
      addMarkers(lat = info$lat, 
               lng = info$lon,
               clusterOptions = markerClusterOptions(),
               popup = as.character(info$name))
      })
})
