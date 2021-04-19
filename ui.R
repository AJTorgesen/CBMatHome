library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(shinyjs)
library(shinyjqui)
library(waiter)
library(sever)

# js <- '
# $(function() {
#     var header = $(".navbar-clear");
# $(window).scroll(function() {
# var scroll = $(window).scrollTop();
# 
# if (scroll >= 10) {
# header.removeClass("navbar-clear").addClass("navbar-white");
# } else {
# header.removeClass("navbar-white").addClass("navbar-clear");
# }
# });
# });
# '

ui <- dashboardPage(title = "CBM Homepage",
                    dashboardHeader(disable = TRUE),
                    dashboardSidebar(disable = TRUE
                    ),
                    dashboardBody(
                        use_waiter(),
                        use_steward(),
                        use_sever(),
                        #Uncomment to publish
                        waiter_show_on_load(spin_hexdots()),
                        useShinyjs(),
                        #Include Google Analytics
                        tags$head(includeHTML(("www/google-analytics.html"))),
                        tags$head(tags$script(src= 'https://platform-api.sharethis.com/js/sharethis.js#property=5f36c534bccc40001298d5a5&product=inline-share-buttons', async='async')),
                        tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "style.css")),
                        
                        div(id = "title",
                            img(src = "CBM-title.png", class = "titlescript"),
                            img(src = "MBC-title.png", class = "titlescript")
                            
                        ),
                        tags$a(href = "https://qmi-fcrr.shinyapps.io/CBMatHome/", div(id = "english")),
                        tags$a(href = "https://qmi-fcrr.shinyapps.io/MBCenelHogar/", div(id = "spanish"))
                    )
)
