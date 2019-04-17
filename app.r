#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
# https://caseyc49.shinyapps.io/workout02-casey-chadwell/

library(shiny)
library(ggplot2)
library(dplyr)
library(reshape2)

# Functions from Warmup 06

#' @title Future Value Function
#' @description Outputs future value of an investment after certain time
#' @param amount initial invested amount (numeric)
#' @param rate annual rate of return (numeric)
#' @param years number of years (numeric)
#' @return Computed future value of investment 
future_value = function(amount, rate, years) {
  if( mode(amount)!= 'numeric' | mode(rate)!= 'numeric' | mode(years)!= 'numeric' ) {
    stop("Inputs must be numeric")
  }
  return(amount * ( 1 + rate ) ^ years)
}

#' @title Future Value of Annuity funciton
#' @description Outputs future value of annuity after time
#' @param contrib contribution in dollars each year (numeric)
#' @param rate annual rate of return (numeric)
#' @param years time in years (numeric)
#' @return Computed future value of annuity
annuity = function(contrib, rate, years) {
  if( mode(contrib)!= 'numeric' | mode(rate)!= 'numeric' | mode(years)!= 'numeric' ) {
    stop("Inputs must be numeric")
  }
  return( contrib * ( ( 1 + rate )^years - 1) / rate )
}

#' @title Future Value of Growing Annuity function
#' @description Outputs the future value of growing annuity
#' @param contrib contribution in dollars after year 1 (numeric)
#' @param rate annual rate of return (numeric)
#' @param growth growth rate (numeric)
#' @param years time in years (numeric)
#' @return Computed future value of growing annuity
growing_annuity = function(contrib, rate, growth, years) {
  if( mode(contrib)!= 'numeric' | mode(rate)!= 'numeric' | mode(years)!= 'numeric' ) {
    stop("Inputs must be numeric")
  }
  return( contrib * ( ( 1 + rate )^years - (1+growth)^years ) / ( rate-growth ) )
}


# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Savings Simulations"),
  fluidRow(
    column(4,
           sliderInput(
             inputId = 'amount',
             label = 'Initial Amount',
             value = 1000,
             min = 1,
             max = 100000,
             step = 500
           ),
           sliderInput(
             'contrib',
             'Annual Contribution',
             value = 2000,
             min = 0,
             max = 50000,
             step = 500
           )
    ),
    column(4,
           sliderInput(
             'rrate',
             'Return Rate (in %)',
             value = 5,
             min = 0,
             max = 20,
             step = 0.1
           ), 
           sliderInput(
             'grate',
             'Growth Rate (in %)',
             value = 2,
             min = 0,
             max = 20,
             step = 0.1
           )
    ),
    column(4,
           sliderInput(
             'years',
             'Years',
             value = 20,
             min = 0,
             max = 50,
             step = 1
           ),
           selectInput(
             'facet',
             'Facet?',
             choices = list(
               'No','Yes'
             ),
             selected = 'No'
           )
    ),
    fluidRow(
      column(12,
             h4(strong("Timelines")),
             plotOutput("distPlot"))
    ),
    fluidRow(
      column(12,
             h4(strong("Balances")),
             verbatimTextOutput('balance',
                                placeholder = TRUE))
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  modalities <- reactive({
    years <-  input$years
    amt <- input$amount
    rt <- input$rrate / 100
    cont <- input$contrib
    gr <- input$grate / 100
    
    no_contr <- rep(0, years)
    fixed_contr <- rep(0, years)
    growing_contr <- rep(0, years)
    years <- 0:years
    
    for (yr in years) {
      no_contr[yr+1] <- future_value(amt, rt, yr)
      fixed_contr[yr+1] <- no_contr[yr + 1] + annuity(cont, rt, yr)
      growing_contr[yr + 1] <- no_contr[yr + 1] + growing_annuity(cont, rt, gr, yr)
    }
    
    modalities <- data.frame(cbind(years, no_contr, fixed_contr, growing_contr))
    colnames(modalities) <- c('year','no_contrib','fixed_contrib','growing_contrib')
    return(modalities)
  })
  output$distPlot <- renderPlot({
    
    balances <- modalities()
    colnames(balances) <- c("Years", "None", "Fixed", "Growing")
    
    melted_df <- melt(balances, id.vars="Years")
    

    the_plot <- ggplot(melted_df, aes(x = Years, y = value, colour = variable)) + 
      geom_point() + 
      geom_line() +
      scale_x_continuous(
        name = 'Time Since Initial Investment (in years)') +
      scale_y_continuous(
        name = 'Account Balance (in $1000)') +
      theme_grey() +
      ggtitle( "Growth Rates by Investment Mode" )
    if (input$facet == 'Yes') {
      the_plot <- the_plot + 
        geom_ribbon(aes(ymin=0,ymax=value,fill=variable),alpha=0.3) +
        scale_fill_manual(values = c('red','green','blue')) +
        facet_grid(. ~ variable) 
        
    }
    the_plot
  }) 
  output$balance <- renderPrint({modalities()})
  
}
# Run the application 
shinyApp(ui = ui, server = server)

