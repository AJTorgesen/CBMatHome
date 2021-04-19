
library(shiny)


shinyServer(function(input, output, session) {
  
  # Loader ----
  sever()
  Sys.sleep(1) #  something that takes time
  
  waiter_hide()
  
#Nav Bar
#-----------------------------------------------------------------------------------------
  #Nav Bar display output
  output$navbar <- renderUI({
    div(class = "navbar-clear",
        div(id = "home", class = "navbar-button", "Home", style = "border-left: none;"),
        div(id = "grade", class = "navbar-button", "Grade Selection"),
        div(id = "video", class = "navbar-button", "Instructional Video"),
        div(id = "probe", class = "navbar-button", "Test Materials"),
        div(id = "ears", class = "navbar-button", "Risk for Reading Difficulties")
    )
  })
  
  #Nav Bar logic for changing tabs on click
  onclick("home", 
          updateTabItems(session, "tabs", "home")        
  )
  onclick("grade", 
          updateTabItems(session, "tabs", "grade")        
  )
  onclick("video",
          updateTabItems(session, "tabs", "video")        
  )
  onclick("probe",
          updateTabItems(session, "tabs", "probe")        
  )
  onclick("ears",
          updateTabItems(session, "tabs", "ears")        
  )
  observe(
    toggleClass("home", "navbar-selected", condition = input$tabs == "home")
  )
  observe(
    toggleClass("grade", "navbar-selected", condition = input$tabs == "grade")
  )
  observe(
    toggleClass("video", "navbar-selected", condition = input$tabs == "video")
    
  )
  observe(
    toggleClass("probe", "navbar-selected", condition = input$tabs == "probe")
    
  )
  observe(
    toggleClass("ears", "navbar-selected", condition = input$tabs == "ears")
    
  )
#-----------------------------------------------------------------------------------------
  
#Grade Select  
#----------------------------------------------------------------------------------------
  observeEvent(input$getHomepage, {
    updateTabItems(session, "tabs", "home")
    toggleClass("home", "navbar-selected", condition = input$tabs == "home")
  })
  
  observeEvent(input$getGradeSel, {
    updateTabItems(session, "tabs", "grade")
    toggleClass("grade", "navbar-selected", condition = input$tabs == "grade")
  })
  
  observeEvent(input$getGradeSel2, {
    updateTabItems(session, "tabs", "grade")
    toggleClass("grade", "navbar-selected", condition = input$tabs == "grade")
  })
  
   observeEvent(input$getInsVideo, {
    updateTabItems(session, "tabs", "video")
    toggleClass("video", "navbar-selected", condition = input$tabs == "video")
  })
   
   observeEvent(input$getTestMat, {
    updateTabItems(session, "tabs", "probe")
    toggleClass("probe", "navbar-selected", condition = input$tabs == "probe")
  }) 
  
  
#Instructional Video Tab
#-----------------------------------------------------------------------------------------
  #Display a different video depending on grade level selected
  output$video2 <- renderUI({
    if(input$Grade == "K")
    {
      div(class = "video-container2",
        HTML('<iframe src="https://www.youtube.com/embed/Yer8rCZBHbc?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
      )
    }
    else 
    {
      div(class = "video-container2",
          HTML('<iframe src="https://www.youtube.com/embed/4MGYpsS64Qc?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
      )
    }
  })
   
   output$video3 <- renderUI({
     if(input$Grade == "K")
     {
       div(class = "video-container2",
        HTML('<iframe src="https://www.youtube.com/embed/bHyDU-W4Zdw?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')    
       )
     }
     else
     {
       div(class = "video-container2",
        HTML('<iframe src="https://www.youtube.com/embed/jh3wMFL1A7c?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')    
       )
     }
   })
#-----------------------------------------------------------------------------------------
  
#Test Materials Tab
#-----------------------------------------------------------------------------------------
  #Checklist of directions (different for K and 1-3)
  output$directions1 <- renderUI({
    
    if(input$Grade != "K")
    {
    div(id = "directions1-3", class = "directions",
        h4("Follow these steps to test your child and learn about their risk for reading difficulties."),br(),
        h4(strong("Before Testing"), style = "text-decoration: underline;"),
        h4(icon("circle-o", lib = "font-awesome"), "Gather print or electronic testing materials, a pencil, and a timer."),
        h4(icon("circle-o", lib = "font-awesome"), "Make sure child is sitting a comfortable distance from the text."),
        
    )
    }
    else
    {
      div(id = "directionsK", class = "directions",
          h4("Follow these steps to test your child and learn about their risk for reading difficulties."),br(),
          h4(strong("Before Testing"), style = "text-decoration: underline;"),
          h4(icon("circle-o", lib = "font-awesome"), "Gather print or electronic testing materials, a pencil, and a timer."),
          h4(icon("circle-o", lib = "font-awesome"), "Make sure child is sitting a comfortable distance from the text."),
          
          
      )
    }
  })
  
  output$directions2 <- renderUI({
    
    if(input$Grade != "K")
    {
      div(id = "directions1-3_2", class = "directions",
          h4(strong("During Testing"), style = "text-decoration: underline;"),
          h4(icon("circle-o", lib = "font-awesome"), "Read the bolded directions below to your child."),
          h4(strong("Please read this story out loud. If you get stuck, I will tell you the word so you can keep reading. Do your best reading. Start here (point to first word). Ready? Begin.")),
          h4(icon("circle-o", lib = "font-awesome"),"Start your timer when your child reads the first word.(Do not count title)"),
          h4(icon("circle-o", lib = "font-awesome"),"Time your child for ", strong("60 seconds "), "(1 minute) while they read."), 
          h4(icon("circle-o", lib = "font-awesome"),"Follow along, and mark through incorrect words with a slash ( / )."),br()
      )
    }
    else
    {
      div(id = "directionsK_2", class = "directions",
          h4(strong("During Testing"), style = "text-decoration: underline;"),
          h4(icon("circle-o", lib = "font-awesome"), "Read the bolded directions below to your child."),
          h4(strong("Here are some letters (point to child’s page). When I say ‘Begin’, start here and go across the page. Tell me the name of each letter. If you come to a letter you don’t know, I’ll tell it to you. Ready? Begin.")),
          h4(icon("circle-o", lib = "font-awesome"),"Start your timer after you say begin."),
          h4(icon("circle-o", lib = "font-awesome"),"Time your child for ", strong("60 seconds "), "(1 minute) while they read."), 
          h4(icon("circle-o", lib = "font-awesome"),"Follow along, and mark incorrect letters with a slash ( / )."),br()
          
      )
    }
  })
  
  
  
  output$directions3 <- renderUI({
    
    if(input$Grade != "K")
    {
      div(id = "directions1-3_3", class = "directions",
          h4(strong("After Testing"), style = "text-decoration: underline;"),
          h4(icon("circle-o", lib = "font-awesome"), 'Use your mouse and highlight words read on the passage to the right. Start with the first word of the passage (ignore the title), and highlight until the last word your child read in 60 seconds. After highlighting the content, press the “Generate Word Count” button.'),
          h4(icon("circle-o", lib = "font-awesome"), "Enter the number of errors in the red box to the right."),
          h4(icon("circle-o", lib = "font-awesome"), 'Press the "Next" button to learn about your child’s risk for reading difficulties.')
      )
    }
    else
    {
      div(id = "directionsK_3", class = "directions",
          h4(strong("After Testing"), style = "text-decoration: underline;"),
          h4(icon("circle-o", lib = "font-awesome"), 'Use your mouse and highlight letters named on the list to the right. Start with the first letter on the list, and highlight until the last letter your child named in 60 seconds. After highlighting the content, press the “Generate Letter Count” button.'),
          h4(icon("circle-o", lib = "font-awesome"), "Enter the number of errors in the red box to the right"),
          h4(icon("circle-o", lib = "font-awesome"), 'Press the "Next" button to learn about your child’s risk for reading difficulties.')
          
      )
    }
  })
  
  
  
  #Reminder image on the bottom right of the directions side of the page.
  output$remind <- renderUI({
    if(input$Grade == "K")
    {
      img(src = "Reminders-box.svg", style = "width:50%; float: left; margin-left:5%;")
    }
    else
    {
      img(src = "Reminders-box2.svg", style = "width:50%; float: left; margin-left:5%;")
    }
  })
  
  #Titles of passages 1-3 (centered above the reading passage)
  output$passage_title <- renderUI({
    if(input$Grade == "1")
    {
      h4("Trip to the Farm (162 words)", style = "width: max-content; margin: auto; font-size: 26px;")
    }
    else if(input$Grade == "2")
    {
      h4("How to Build an Ant Farm (184 words)", style = "width: max-content; margin: auto; font-size: 24px;")
    }
    else if(input$Grade == "3")
    {
      h4("Jumping Goldfish (296 words)", style = "width: max-content; margin: auto; font-size: 20px;")
    }
  })
  
  #Passage text. Kindergarten is a matrix of 10 rows of 11 letters for LNF. 1-3 are passages of increasing difficulty.
  output$passage_text <- renderUI({
    if(input$Grade == "K")
    {
      div(id = "LNF", style = "font-size: 26px;",
          fluidRow(
            column(1, span("n")),
            column(1, span("t")),
            column(1, span("F")),
            column(1, span("K")),
            column(1, span("W")),
            column(1, span("R")),
            column(1, span("Q")),
            column(1, span("x")),
            column(1, span("a")),
            column(1, span("c")),
            column(1, span("X")),
            column(1)
          ),hr(style = "margin-top: 10px; margin-bottom: 10px;"),
          fluidRow(
            column(1, span("Y")),
            column(1, span("i")),
            column(1, span("m")),
            column(1, span("N")),
            column(1, span("V")),
            column(1, span("q")),
            column(1, span("M")),
            column(1, span("r")),
            column(1, span("p")),
            column(1, span("v")),
            column(1, span("f")),
            column(1)
          ),hr(style = "margin-top: 10px; margin-bottom: 10px;"),
          fluidRow(
            column(1, span("o")),
            column(1, span("T")),
            column(1, span("J")),
            column(1, span("l")),
            column(1, span("b")),
            column(1, span("e")),
            column(1, span("C")),
            column(1, span("Z")),
            column(1, span("U")),
            column(1, span("D")),
            column(1, span("S")),
            column(1)
          ),hr(style = "margin-top: 10px; margin-bottom: 10px;"),
          fluidRow(
            column(1, span("B")),
            column(1, span("g")),
            column(1, span("y")),
            column(1, span("L")),
            column(1, span("s")),
            column(1, span("E")),
            column(1, span("u")),
            column(1, span("P")),
            column(1, span("w")),
            column(1, span("k")),
            column(1, span("d")),
            column(1)
          ),hr(style = "margin-top: 10px; margin-bottom: 10px;"),
          fluidRow(
            column(1, span("O")),
            column(1, span("A")),
            column(1, span("G")),
            column(1, span("j")),
            column(1, span("z")),
            column(1, span("H")),
            column(1, span("h")),
            column(1, span("l")),
            column(1, span("M")),
            column(1, span("K")),
            column(1, span("B")),
            column(1)
          ),hr(style = "margin-top: 10px; margin-bottom: 10px;"),
          fluidRow(
            column(1, span("J")),
            column(1, span("j")),
            column(1, span("F")),
            column(1, span("s")),
            column(1, span("Q")),
            column(1, span("Y")),
            column(1, span("u")),
            column(1, span("v")),
            column(1, span("g")),
            column(1, span("D")),
            column(1, span("S")),
            column(1)
          ),hr(style = "margin-top: 10px; margin-bottom: 10px;"),
          fluidRow(
            column(1, span("o")),
            column(1, span("c")),
            column(1, span("l")),
            column(1, span("y")),
            column(1, span("W")),
            column(1, span("H")),
            column(1, span("G")),
            column(1, span("f")),
            column(1, span("C")),
            column(1, span("k")),
            column(1, span("r")),
            column(1)
          ),hr(style = "margin-top: 10px; margin-bottom: 10px;"),
          fluidRow(
            column(1, span("E")),
            column(1, span("l")),
            column(1, span("x")),
            column(1, span("e")),
            column(1, span("A")),
            column(1, span("t")),
            column(1, span("R")),
            column(1, span("P")),
            column(1, span("h")),
            column(1, span("N")),
            column(1, span("a")),
            column(1)
          ),hr(style = "margin-top: 10px; margin-bottom: 10px;"),
          fluidRow(
            column(1, span("Z")),
            column(1, span("d")),
            column(1, span("q")),
            column(1, span("V")),
            column(1, span("m")),
            column(1, span("q")),
            column(1, span("z")),
            column(1, span("b")),
            column(1, span("n")),
            column(1, span("X")),
            column(1, span("T")),
            column(1)
          ),hr(style = "margin-top: 10px; margin-bottom: 10px;"),
          fluidRow(
            column(1, span("p")),
            column(1, span("L")),
            column(1, span("U")),
            column(1, span("i")),
            column(1, span("O")),
            column(1, span("N")),
            column(1, span("R")),
            column(1, span("c")),
            column(1, span("Q")),
            column(1, span("t")),
            column(1, span("x")),
            column(1)
          )
          
      )
    }
    else if(input$Grade == "1")
    {
      span("My class went to a farm.  An old man was there who told us what it is like to live on the farm.  He walked us to the barn.  In the barn he let us pet a big horse.  The horse takes the man over the open land to round up his cows. 
                We did not get to see the cows.  They were far away eating grass.  At this farm, the cows do not give milk. They are sold for meat.
                 Next to the barn was a pig pen.  The pigs were tan and brown.  They did not smell too good!  The man said that he sells the pigs so that we can have ham, pork, and ribs. 
                The last stop we made was at the hen house.  The hens give eggs every day.  The old man does not sell the eggs or the hens.  He eats them!  The man fixed our class some fresh eggs, too.  It was a fun trip. ",
           style = "font-size:26px"
           )
    }
    else if(input$Grade == "2")
    {
      span("Ant farms are easy to make and fun to watch.  Ask an adult to help you get the things you need, including the ants!  Start with a large glass jar or a small fish bowl.   Next, find an ant pile and use a shovel to dig up enough ants and dirt to fill the jar.  Be sure to leave them some walking room on top of the dirt. 
      Once you have ants in your “farm”, put the lid on the jar. Get some paper and wrap it around the jar, using tape to keep it in place.  This will help the ants feel like they are underground and they will get right to work making tunnels. Just take off the paper when you want to see what they have done. 
        You will need to feed the ants every couple of days.  Always put the food in the same place.  The ants will come and get it!  They like tiny bits of fruits and vegetables.  You can also give them a drop of honey, sugar, or a small piece of bread dipped in sugar water.",
           style = "font-size:24px"
           )
    }
    else if(input$Grade == "3")
    {
      span("Ana has a pet goldfish. It is orange in color. The goldfish lives in a large round
        bowl filled with water. It has some nice green plants and little purple pebbles on the
        bottom. The bowl makes a great home for the fish. Ana’s fish swims around its bowl all
        day. Her goldfish gets fed twice a day. The fish food looks like dry flakes. Ana puts a tiny
        bit of food on the water and the goldfish slowly comes up to eat.
        One day, Ana came home from school. She looked into the fish bowl. Her goldfish
        was not there! Ana and her mother looked around. The fish was on the floor! This was
        not good. Goldfish can’t breathe outside of the water. Ana’s mother quickly put the fish
        back in the bowl. It turned around. After a while, it began to swim.
        A few days later, Ana saw that her goldfish was not in the bowl. It was on the floor
        again! She put the fish back in the bowl. Once again, the fish turned around. But after
        a minute, it began to swim! Two days later, Ana and her mother were in the kitchen.
        Suddenly, the goldfish jumped out of the water and landed on the floor. They quickly put
        the fish back in the water.
        Ana’s mother went to the pet store to solve their problem. The clerk told her
        that the best thing for jumping goldfish is to put a soft net over the bowl. Her mother
        purchased the net and put it over the fish bowl. Every time the fish tried to jump out, it
        fell back down into the water. The net worked great!
        Ana and her mother were happy. The goldfish did not jump onto the floor again.",
        style = "font-size:20px"   
        )
    }
    
  })
  #Send a message to javascript "wordcount.js". That file will handle the word/letter count functions.
  observeEvent(input$generate, {
    session$sendCustomMessage("generate",TRUE)
  })
  
  observeEvent(input$generateL, {
    session$sendCustomMessage("generateL",TRUE)
  })
  
  #Display word and letter counts in their respective boxes.
  output$wordcountbox <- renderUI({
      h3(input$wordcount)
  })
  output$totalcountbox <- renderUI({
    h3(input$wordcount-input$errorcount)
  })
  
  output$totalcountboxL <- renderUI({
    h3(input$lettercount-input$errorcountL)
  })
  
  output$lettercountbox <- renderUI({
    h3(input$lettercount)
  })
  
  #UI display of the word/letter counting section at the bottom of the passage section of the page. Creates an almost equation like structure
  #for displaying the number of words/letters read and subracting the errors for the total word/letter count.
  output$wordCalc <- renderUI({
    if(input$Grade != "K")
    {
    div(id = "count-box",
        actionBttn("generate", "Generate Word Count", style = "bordered", color = "primary", size = "xs"),
        
        uiOutput("wordcountbox"),
        div(id = "words", h3("Word(s)")),
        div(id = "minus", h3("-")),
        div(id = "errorbox", numericInput("errorcount", label = NULL, value = 0, min = 0, max = 162, step = 1)),
        div(id = "errors", h3("Error(s)")),
        br(),br(),br(),
        div(id = "equals", h3("=")),
        uiOutput("totalcountbox"),
        div(id = "wpm", h3("Words per Minute")),
        br()
    )
    }
    else
    {
      div(id = "count-box",
        actionBttn("generateL", "Generate Letter Count", style = "bordered", color = "primary", size = "xs"),
        uiOutput("lettercountbox"),
        div(id = "words", h3("Letter(s)")),
        div(id = "minus", h3("-")),
        div(id = "errorbox", numericInput("errorcountL", label = NULL, value = 0, min = 0, max = 162, step = 1)),
        div(id = "errors", h3("Error(s)")),
        br(),br(),br(),
        div(id = "equals", h3("=")),
        uiOutput("totalcountboxL"),
        div(id = "wpm", h3("Letters per Minute")),
        br()
      )
    }
  })
  
  #Display the "Print Materials" button and give it function. Open a different .pdf for each grade level.
  output$print_box <- renderUI({
    if(input$Grade == "K")
    {
      div(id = "download",
          actionBttn("download", tags$a(href = "Print Materials/K-grade-passage.pdf", target = "_blank", "Printable Instructions and Materials", style = "color: white;"), style = "material-flat", color = "primary", size = "sm")    
      )
    }
    else if(input$Grade == "1")
    {
      div(id = "download",
          actionBttn("download", tags$a(href = "Print Materials/1st-grade-passage.pdf", target = "_blank", "Printable Instructions and Materials", style = "color: white;"), style = "material-flat", color = "primary", size = "sm")    
      )
    }
    else if(input$Grade == "2")
    {
      div(id = "download",
          actionBttn("download", tags$a(href = "Print Materials/2nd-grade-passage.pdf", target = "_blank", "Printable Instructions and Materials", style = "color: white;"), style = "material-flat", color = "primary", size = "sm")    
      )
    }
    else if(input$Grade == "3")
    {
      div(id = "download",
          actionBttn("download", tags$a(href = "Print Materials/3rd-grade-passage.pdf", target = "_blank", "Printable Instructions and Materials", style = "color: white;"), style = "material-flat", color = "primary", size = "sm")    
      )
    }
    
  })
  
  
  #Timer Logic
  
  # Initialize the timer, 60 seconds, not active.
  timer <- reactiveVal(60)
  active <- reactiveVal(FALSE)
  
  # Output the time left.
  output$timeleft <- renderText({
    paste("Time left: ", timer(),"s")
  })
  
  # observer that invalidates every second. If timer is active, decrease by one.
  observe({
    invalidateLater(1000, session)
    isolate({
      if(active())
      {
        timer(timer()-1)
        if(timer()<1)
        {
          active(FALSE)
          sendSweetAlert(session = session, title = "Countdown Complete", "Please Stop", type = "error")
        }
      }
    })
  })
  
  # observers for actionbuttons
  observeEvent(input$start, {active(TRUE)})
  observeEvent(input$stop, {active(FALSE)})
  observeEvent(input$reset, {timer(60)})
  
  isResult <- reactiveVal(FALSE)
  result <- reactiveVal(0)
  atRisk <- reactiveVal(FALSE)
  
  #Logic for the get Results button displayed as "Next". Calculates the final score and brings the user to the Results tab.
  observeEvent(input$getResults, {
    #results = result()
    isResult(TRUE)
    if(input$Grade == "K")
    {
      results = input$lettercount-input$errorcountL
      result(results)
      
      if(results < 26)
      {
        atRisk(TRUE)
      }
      else if(results >= 26)
      {
        atRisk(FALSE)
      }
    }
    else if(input$Grade == "1")
    {
      results = input$wordcount-input$errorcount
      result(results)
      if(results < 12)
      {
        atRisk(TRUE)
      }
      else if(results >= 12)
      {
        atRisk(FALSE)
      }
    }
    else if(input$Grade == "2")
    {
      results = input$wordcount-input$errorcount
      result(results)
      if(results < 62)
      {
        atRisk(TRUE)
      }
      else if(results >= 62)
      {
        atRisk(FALSE)
      }
    }
    else if(input$Grade == "3")
    {
      results = input$wordcount-input$errorcount
      result(results)
      if(results < 80)
      {
        atRisk(TRUE)
      }
      
      else if(results >= 80)
      {
        atRisk(FALSE)
      }
    }
    updateTabItems(session, "tabs", "ears")
    toggleClass("ears", "navbar-selected", condition = input$tabs == "ears")
    
  })
#----------------------------------------------------------------------------------------------------------

#Risk for Reading Difficulties Tab
#----------------------------------------------------------------------------------------------------------  
  
  #Display the results to the user above the explanation video. Color depends of score of the child. Red=At Risk, Green=Not At Risk
  #Set up in a way to provide orange and yellow colors if needed based on other cut-points
  #Yaacov still needs to provide cut-points for 3rd grade.
  output$results <- renderUI({
    if(isResult())
    {
      if(atRisk())
      {
        div(span("Score: ", style = "color:black"),
            span(result(), style = "color: red;"),
            br(),
            span("At risk for reading difficulties", style = "color:red"))
      }
      else
      {
        div(span("Score: ", style = "color:black"),
            span(result(), style = "color: green;"),
            br(),
            span("Not at risk for reading difficulties", style = "color:green"))
      }
    }
    else
    {
      span("Please Input Score", style = "font-size: 3vw; text-shadow: none;")
    }
  })
  
  output$results_video <- renderUI({
    if(isResult())
    {
      if(atRisk())
      {
        div(class = "video-container2",
          HTML('<iframe src="https://www.youtube.com/embed/jSZSwIhXcZM?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
        )
      }
      else
      {
        div(class = "video-container2",
          HTML('<iframe src="https://www.youtube.com/embed/YSdRM1nXgGA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
        )
      }
    }
    else
    {
      div(class = "video-container2",
          HTML('<iframe src="https://www.youtube.com/embed/YSdRM1nXgGA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>')
      )
    }
  })
  
  
  
  #Display a box on the right side of the page with resource links and descriptions of those links. Also provide images of the website/organization.
  output$resources <- renderUI({
    div(id = "resource-list",
      div(id = "NCIL", style = "width: 33%; border-right: black solid thin; float:left; height:inherit;",
          tags$a(href = "https://improvingliteracy.org/", target = "_blank", img(src = "ncil-logo.png", style = "width:90%; margin: 5%;")),
          br(),
          p(strong(tags$a(href = "https://improvingliteracy.org/checklist#/personas", target = "_blank", "Literacy Skills Checklist: ")),
            span("Get personalized resource recommendations based on your child’s reading skills."),
            style = "width: 90%; margin: auto;"
          ), br(),
          p(strong(tags$a(href = "https://improvingliteracy.org/kit/supporting-your-childs-literacy-development", target = "_blank", "Supporting Your Child’s Literacy Development Toolkit: ")),
            span("Tutorials, infographics, and resources for supporting your child’s reading development."),
            style = "width: 90%; margin: auto;"
          ), br(),
          p(strong(tags$a(href = "https://improvingliteracy.org/brief/advocating-my-childs-literacy-needs", target = "_blank", '“Advocating for My Child’s Literacy Needs” Literacy Brief: ')),
            span("Learn how to work with your child’s school to support your child’s reading development."),
            style = "width: 90%; margin: auto;"
          ), br()
      ),
      div(id = "FCRR",  style = "width: 33%; border-right: black solid thin; float:left; height:inherit;",
          tags$a(href = "https://www.fcrr.org/", target = "_blank", img(src = "fcrr-logo.png", style = "width:90%; margin: 5%; margin-top:37%;")),
          br(),
          p(strong(tags$a(href = "https://fcrr.org/sites/g/files/upcbnu2836/files/media/PDFs/At_Home_Learning.pdf", target = "_blank", "At-Home Learning guide: ")),
            span("List of technology-based and printable resources for supporting your child’s reading and other academic skills."),
            style = "width: 90%; margin: auto; margin-top: 14%;"
          ), br(),
          p(strong(tags$a(href = "https://www.fcrr.org/student-center-activities", target = "_blank", "Student Center Activities: ")),
            span("Short reading activities targeting different important early reading skills."),
            style = "width: 90%; margin: auto;"
          ), br()
      ),
      div(id = "Colorin", style = "width: 33%; float: left; height: inherit;",
          tags$a(href = "https://www.colorincolorado.org/", target = "_blank", img(src = "colorin-logo.png", style = "width:90%; margin: 5%; margin-top:27%;")),
          br(),
          p(span("Bilingual resources for parents and families of English language learner."),
            style = "width: 90%; margin: auto; margin-top: 14%;"
          ), br()
      )
    )
  })
#------------------------------------------------------------------------------------------------------------

})


#Contributors link
#https://docs.google.com/document/d/1knCvSeDHHr6VWJcZniNG4_Q3whzTn62lq7Q2BnONskY/edit?usp=sharing
  


