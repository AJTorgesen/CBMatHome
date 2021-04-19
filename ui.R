
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

ui <- dashboardPage(title = "CBM at Home",
    dashboardHeader(disable = TRUE),
    dashboardSidebar(disable = TRUE,
                     sidebarMenu(
                         id = "tabs",
                         menuItem("Home", tabName = "home"),
                         menuItem("Choose Grade", tabName = "grade"),
                         menuItem("Instructional Video", tabName = "video"),
                         menuItem("Probe", tabName = "probe"),
                         menuItem("Ears", tabName = "ears")
                     )),
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
        
        #tags$head(tags$script(HTML(js))),
        uiOutput("navbar"),
        div(id = "language", style = "position: absolute;",
            tags$a("Español|", href = "https://qmi-fcrr.shinyapps.io/MBCenelHogar/", style = "float:left;"), p("English", style = "float:left;")
        ),
        tabItems(
            tabItem(tabName = "home",
                div(id = "title",
                    img(src = "CBM-title.png", style = "width:100%;")    
                ),
                div(style = "position: relative;",
                div(id = "opening-video", class = "video-container",
                    HTML('<iframe src="https://www.youtube.com/embed/-YhL9nbk1CA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
                    # HTML('<video preload="metadata" width="100%" controls>
                    #                                 <source src="Videos/CBM at Home Intro_revised.mp4" type="video/mp4">
                    #                                 <track label="English" kind="subtitles" srclang="en" src="Videos/CBM_at_Home_Intro_revised.vtt" default>
                    #                                 </video>'
                    # )  
                ),
                div(id = "logos",
                    span("Brought to you by:", class = "logo-title"),
                    br(),br(),
                    img(src = "QMI-logo.png", style = "width:100%; float: left;"),
                    img(src = "CTL-logo.png", style = "width:100%; float: left;")
                ),
                div(id = "logos2",
                    span("Funding provided by:", class = "logo-title"),
                    br(),br(),
                    img(src = "rer-logo.png", style = "width:50%; float: left;"),
                    img(src = "ncil-logo.png", style = "width:50%; float: left;")
                )
                ),
                br(),
                div(id = "next-button",
                    actionBttn("getGradeSel2", label = "Next", style = "material-flat", size = "lg")
                )
                
            ),
            tabItem(tabName = "grade",
                div(id = "title",
                    img(src = "choosegrade.png", style = "width:100%;;")    
                ),
                div(id = "grade-select", style = "width: 80%; margin: auto; margin-top: 30px;",
                    radioGroupButtons(
                        inputId = "Grade",
                        label = NULL,
                        #status = "info",
                        choices = c("K", "1", "2", "3"),
                        justified = TRUE
                    )
                    
                ),
                div(id = "next-button2",
                    actionBttn("getInsVideo", label = "Next", style = "material-flat", size = "lg")
                )
            ),
            tabItem(tabName = "video",
                    div(id="videos-tab",
                        
                        div(id = "instruction-video",
                            span("Instructional Video", class = "video-titles"),
                            uiOutput("video2")
                        ),
                        
                        div(id = "instruction-video-2",
                            span("Entering Your Child's Score", class = "video-titles"),
                            uiOutput("video3")
                        )
                    ),
                    div(id = "next-button3",
                        actionBttn("getTestMat", label = "Next", style = "material-flat", size = "lg")
                    )
            ),
            tabItem(tabName = "probe",
                div(id = "probe-box",
                    div(id = "directions-box",
                        br(),
                        uiOutput("directions1"),
                        uiOutput("print_box"),
                        hr(class = "directions"),
                        uiOutput("directions2"),
                        uiOutput("remind"),
                        #Timer
                        div(id="timer",
                            actionBttn('start','Start', style = "simple"),
                            actionBttn('stop','Stop', style = "simple"),
                            actionBttn('reset','Reset', style = "simple"),
                            br(),br(),
                            textOutput('timeleft'),
                            
                        ),
                        hr(class = "directions"),
                        uiOutput("directions3")
                        
                    ),
                    div(id = "passage-box",
                        br(),
                        uiOutput("passage_title"),
                        
                        br(),
                        div(id = "passage",
                            uiOutput("passage_text")    
                        ),
                        br(),hr(),
                        #Word Counting Calculator
                        uiOutput("wordCalc"),
                        br(),br(),
                        actionBttn("getResults", "Next", style = "material-flat")
                        ),
                    br(),br()
                    )
            ),
            tabItem(tabName = "ears",
                    div(id = "results-video",
                        div(id = "results-box",
                            uiOutput("results")
                        ),
                        uiOutput("results_video"),
                        div(id = "contributors", style = "margin-top: 10%;",
                            div(id = "contributors-box", style = "float: left; padding: 10px; background-color: white;",
                                actionBttn("con-link", tags$a(href = "https://docs.google.com/document/d/1knCvSeDHHr6VWJcZniNG4_Q3whzTn62lq7Q2BnONskY/edit?usp=sharing",
                                                              target = "_blank", "Contact and Technical Information", style = "color: white;"), style = "material-flat", color = "primary", size = "lg")    
                            )    
                        )
                    ),
                    
                    div(id = "resources-box",
                        span("Resources", style = "font-size: 3vw; margin-bottom: 0px;"),
                        uiOutput("resources")    
                    )
                    
            )
        ),
        tags$script(src = "wordcount.js")
    )
)
