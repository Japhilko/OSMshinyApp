library(shiny)

shinyUI(navbarPage("Indicators",
                   tabPanel("Indicator 1",
                            sidebarPanel(
                              selectInput("var", 
                                          label = "Choose a variable to display",
                                          choices = c("street_lamp","traffic_signals"),
                                          selected = "street_lamp")
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
                   tabPanel("Indicator 2",
                            sidebarPanel(
                              selectInput("var2", 
                                          label = "Choose a variable to display",
                                          choices = c("street_lamp","traffic_signals"),
                                          selected = 'street_lamp')
                            ),
                            sidebarPanel(
                              selectInput("color2", 
                                          label = "Choose a color code to display",
                                          choices = c('blue2red','blue2green',"green2red","blue2yellow","matlab.like"),
                                          selected = "blue2red")
                            ),
                            # Show a plot of the generated distribution
                            mainPanel(
                              plotOutput("map2")
                            ))
)
)