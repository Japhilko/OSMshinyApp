library(shiny)

shinyUI(navbarPage("Geographic Visualisations",
                   tabPanel("Shapefile",
                            sidebarPanel(
                              selectInput("var", 
                                          label = "Choose a variable to display",
                                          choices = c("restaurant","street_lamp","traffic_signals"),
                                          selected = "restaurant")
                            ),
                            sidebarPanel(
                              selectInput("color", 
                                          label = "Choose a color code to display",
                                          choices = c('blue2red','blue2green',"green2red","blue2yellow","matlab.like"),
                                          selected = "blue2red")
                            ),
                            # Show a plot of the generated distribution
                            mainPanel(
                              plotOutput("map")
                            )),
                   tabPanel("Leaflet",
                            headerPanel("Restaurants in Berlin"),
                            # Show a plot of the generated distribution
                            sidebarPanel(
                              selectInput("bgmap", 
                                          label = "Choose a background for the map",
                                          choices = c("OpenStreetMap","Stamen Watercolor","OpenStreetMap Mapnik","OpenStreetMap - black and white"),
                                          selected = "OpenStreetMap")
                            ),
                            leafletOutput("map2")
                            )
)
)