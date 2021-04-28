#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinycustomloader)
library(colourpicker)
library(ggplot2)
library(plotly)
library(gapminder)
library(knitr)


# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("World's GDP and Life Expectancy"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            
            textInput("title", "Title (for the graph)", "GDP vs. life exp"),
            
            selectInput("year", "Year",
                        choices = c("All", unique(gapminder$year))),
            
            selectInput("continent", "Continent",
                        choices = c("All", levels(gapminder$continent))),
            
            sliderInput(inputId = "life", label = "Life expectancy",
                        min = 0, max = 120,
                        value = c(40, 90)),

            numericInput("size", "Point size", 1, 1),
            
            colourInput("color", "Point color", value = "#0934ab"),
            
            downloadButton("download_data")

        ),

        # Show a plot of the generated distribution
        mainPanel(
            
            # Output: Tabset with plot, summary, and table
            tabsetPanel(type = "tabs",
                        
                        tabPanel("Graph", withLoader(plotlyOutput("plot")) ),
                        tabPanel("Table", withLoader(DT::dataTableOutput("table"))),
                        tabPanel("User Guide", HTML(markdown::markdownToHTML(knit("user_guide.Rmd"))))
                        
            )
        )
    )
))
