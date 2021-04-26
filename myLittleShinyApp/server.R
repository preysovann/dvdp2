#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
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

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    filtered_data <- reactive({
        data <- gapminder
        data <- subset(
            data,
            lifeExp >= input$life[1] & lifeExp <= input$life[2]
        )
        
        if (input$continent != "All") {
            data <- subset(
                data,
                continent == input$continent
            )
        }
        
        if(input$year != "All"){
            data <-subset(
                data,
                year == input$year
            )
        }
        
        data
    })
    
    output$table <- DT::renderDataTable({
        data <- filtered_data()
        data
    })
    
    output$download_data <- downloadHandler(
        filename = function() {
            paste("gapminder-exported-data-", Sys.Date(), ".csv", sep="")
        },
        content = function(file) {
            write.csv(filtered_data(), file)
        }
    )
    
    output$plot <- renderPlotly({
        
        ggplotly({
            data <- filtered_data()
            
            p <- ggplot(data, aes(gdpPercap, lifeExp)) +
                geom_point(size = input$size, col = input$color) +
                scale_x_log10() +
                ggtitle(input$title) +
                geom_hline(yintercept = mean(data$lifeExp), color="red")
            
            p
        })
    })
})
