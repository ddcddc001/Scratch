library(shiny)
library(shinydashboard)
library(shinyBS)
# library(shinydashboardPlus)
library(ggplot2)
library(visNetwork)

data("iris")


# UI ----------------------------------------------------
## Header
header <- dashboardHeader(title = "Shiny Toolbox")

## Sidebar contents
sidebar <- dashboardSidebar(
                sidebarMenu(
                  id = "sidebar",
                  menuItem("ToolSet 1", tabName = "toolset_1", icon = icon("th"),
                           badgeLabel = " > ", badgeColor = "light-blue"),
                  menuItem("ToolSet 2", tabName = "toolset_2", icon = icon("th"),
                          badgeLabel = " > ", badgeColor = "maroon"),
                  menuItem("ToolSet 3", tabName = "toolset_3", icon = icon("th"),
                           badgeLabel = " > ", badgeColor = "green"),
                  menuItem("ToolSet 4", tabName = "toolset_4", icon = icon("th"),
                           badgeLabel = " > ", badgeColor = "orange"),
                  menuItem("ToolSet 5", tabName = "toolset_5", icon = icon("th"),
                           badgeLabel = " > ", badgeColor = "purple")
                ),
                
                # tags$hr(),
                # 
                # sliderInput("slider1","Value",1,100,30),
                # 
                # dateRangeInput("dateRange", "Date Range:",
                #                format = "yyyy-mm-dd", startview = "month",
                #                separator = "to"),
                # dateInput("date1", "Date Input", value = ""),
                # textInput("text1", "Text Input:", value = "", placeholder = "placeholder"),
                # 
                # numericInput("numeric1", "Numeric Input:", value = 0),
                
                tags$hr(),
                tags$div(title="Title\n by\n tags",
                  fileInput(inputId = "loaddatafile", 
                            label = "Load CSV data file", 
                            accept = c("CSV Data File",".csv"),
                            buttonLabel = "Load csv data file",
                            placeholder = "No file selected"),
                )
                
                # bsTooltip(id = "numeric1", 
                #           title = "Title of tooltip", 
                #           placement = "bottom", trigger = "hover")
          )
          
## Body content:
body <- dashboardBody(
          tabItems(
            
            # [toolset_1] ...........................................................
            tabItem(tabName = "toolset_1",
                    # Upper box: controls
                    fluidRow(
                        box(
                          width = 12,
                          title = "ToolSet-1",
                          status = "primary",
                          solidHeader = TRUE,
                          collapsible = FALSE,
                          column(
                            width = 4,
                            actionButton(inputId = "btnToolset1_1", label = "Function 1",
                                       style = "width: 45%; margin-bottom: 12px; font-weight: bold"),
                            actionButton(inputId = "btnToolset1_2", label = "Function 2",
                                       style = "width: 45%; margin-bottom: 12px; font-weight: bold"),
                            textInput(inputId = "inputToolset1_1", label = "Input_1:", 
                                      value = "", placeholder = "placeholder", width = "90%"),
                          ),
                          column(
                            width = 4,
                            actionButton(inputId = "btnToolset1_3", label = "Function 3",
                                         style = "width: 50%; margin-bottom: 12px; font-weight: bold"),
                            actionButton(inputId = "btnToolset1_4", label = "Function 4",
                                         style = "width: 50%; margin-bottom: 12px; font-weight: bold")
                          ),
                          column(
                            width = 4,
                            actionButton(inputId = "btnToolset1_5", label = "Function 5",
                                         style = "width: 100%; margin-bottom: 12px; font-weight: bold"),
                            actionButton(inputId = "btnToolset1_6", label = "Function 6",
                                         style = "width: 100%; margin-bottom: 12px; font-weight: bold")
                          )
                        )
                    ),
                    # Split
                    tags$hr(style = "border-top: 3px solid skyblue"),
                    # Lower box: output
                    fluidRow(
                        box(
                          width = 12,
                          title = "Output",
                          status = "primary",
                          solidHeader = TRUE,
                          collapsible = FALSE,
                          textOutput(outputId = "ts1_text1"),
                          tags$hr(),
                          tabBox(
                            title = "Data Tables",
                            id = "ts1_data",
                            width = 12,
                            tabPanel("diamonds", DT::dataTableOutput("ts1_table1")),
                            tabPanel("mtcars", DT::dataTableOutput("ts1_table2")),
                            tabPanel("iris", DT::dataTableOutput("ts1_table3"))
                          )
                        )
                    )
            ),
            
            # [toolset_2] ...........................................................
            tabItem(tabName = "toolset_2",
                    # Upper box: controls
                    fluidRow(
                      box(
                        width = 12,
                        title = "ToolSet-1",
                        status = "primary",
                        solidHeader = TRUE,
                        collapsible = FALSE,
                        column(
                          width = 4,
                          actionButton(inputId = "btnToolset2_1", label = "Function 1",
                                       style = "width: 45%; margin-bottom: 12px; font-weight: bold"),
                          actionButton(inputId = "btnToolset2_2", label = "Function 2",
                                       style = "width: 45%; margin-bottom: 12px; font-weight: bold"),
                          textInput(inputId = "inputToolset2_1", label = "Input_1:", 
                                    value = "", placeholder = "placeholder", width = "90%"),
                        ),
                        column(
                          width = 4,
                          actionButton(inputId = "btnToolset2_3", label = "Function 3",
                                       style = "width: 50%; margin-bottom: 12px; font-weight: bold"),
                          actionButton(inputId = "btnToolset2_4", label = "Function 4",
                                       style = "width: 50%; margin-bottom: 12px; font-weight: bold")
                        ),
                        column(
                          width = 4,
                          actionButton(inputId = "btnToolset2_5", label = "Function 5",
                                       style = "width: 100%; margin-bottom: 12px; font-weight: bold"),
                          actionButton(inputId = "btnToolset2_6", label = "Function 6",
                                       style = "width: 100%; margin-bottom: 12px; font-weight: bold")
                        )
                      )
                    ),
                    # Split
                    tags$hr(style = "border-top: 3px solid crimson"),
                    # Lower box: output
                    fluidRow(
                      tabBox(
                        id = "ts2_box1",
                        title = "Toolset2-Box1",
                        width = 12,
                        # title = tagList(shiny::icon("gear"), "tabBox status"),
                        selected = "diamonfs",
                        tabPanel("diamonds", DT::dataTableOutput("ts2bx1_table1")),
                        tabPanel("mtcars", DT::dataTableOutput("ts2bx1_table2")),
                        tabPanel("iris", DT::dataTableOutput("ts2bx1_table3"))
                      )                      
                    ),
                    fluidRow(
                      tabBox(
                        id = "ts2_box2",
                        title = "Toolset2-Box2",
                        width = 6, height = "200px",
                        selected = "tab2",
                        tabPanel(value = "tab1", title = "box2_tab1"),
                        tabPanel(value = "tab2", title = "box2_tab2")
                      ),
                      tabBox(
                        id = "ts2_box3",
                        title = "Toolset2-Box3",
                        side = "right", 
                        width = 6, height = "200px",
                        selected = "tab3",
                        tabPanel(value = "tab1", title = "box3_tab1"),
                        tabPanel(value = "tab2", title = "box3_tab2"),
                        tabPanel(value = "tab3", title = "box3_tab2", "Note that when side=right, the tab order is reversed.")
                      )
                    )
            ),
            
            # [toolset_3] ...........................................................
            tabItem(tabName = "toolset_3",
                    # Upper box: controls
                    fluidRow(
                      column(
                          width = 4,
                          actionButton(inputId = "btnToolset3_1", label = "Function 1",
                                       style = "width: 45%; margin-bottom: 12px; font-weight: bold"),
                          actionButton(inputId = "btnToolset3_2", label = "Function 2",
                                       style = "width: 45%; margin-bottom: 12px; font-weight: bold"),
                          textInput(inputId = "inputToolset3_1", label = "Input_1:", 
                                    value = "", placeholder = "placeholder", width = "90%"),
                        ),
                        column(
                          width = 4,
                          actionButton(inputId = "btnToolset3_3", label = "Function 3",
                                       style = "width: 50%; margin-bottom: 12px; font-weight: bold"),
                          actionButton(inputId = "btnToolset3_4", label = "Function 4",
                                       style = "width: 50%; margin-bottom: 12px; font-weight: bold")
                        ),
                        column(
                          width = 4,
                          actionButton(inputId = "btnToolset3_5", label = "Function 5",
                                       style = "width: 100%; margin-bottom: 12px; font-weight: bold"),
                          actionButton(inputId = "btnToolset3_6", label = "Function 6",
                                       style = "width: 100%; margin-bottom: 12px; font-weight: bold")
                        )
                    ),
                    # Split
                    tags$hr(style = "border-top: 3px solid green"),
                    # Lower box: output
                    fluidRow(
                      tabBox(
                        id = "ts3_box1",
                        title = "Toolset3-Box1",
                        width = 12,
                        selected = "diamonfs",
                        tabPanel("diamonds", DT::dataTableOutput("ts3_table1")),
                        tabPanel("mtcars", DT::dataTableOutput("ts3_table2")),
                        tabPanel("iris", DT::dataTableOutput("ts3_table3"))
                      )                      
                    )
            ),
            # [toolset_4] ...........................................................
            tabItem(tabName = "toolset_4",
                    # Upper box: controls
                    fluidRow(
                      box(
                        width = 12,
                        column(
                          width = 4,
                          actionButton(inputId = "btnToolset4_1", label = "Function 1",
                                       style = "width: 45%; margin-bottom: 12px; font-weight: bold"),
                          actionButton(inputId = "btnToolset4_2", label = "Function 2",
                                       style = "width: 45%; margin-bottom: 12px; font-weight: bold"),
                          textInput(inputId = "inputToolset4_1", label = "Input_1:", 
                                    value = "", placeholder = "placeholder", width = "90%"),
                        ),
                        column(
                          width = 4,
                          actionButton(inputId = "btnToolset4_3", label = "Function 3",
                                       style = "width: 50%; margin-bottom: 12px; font-weight: bold"),
                          actionButton(inputId = "btnToolset4_4", label = "Function 4",
                                       style = "width: 50%; margin-bottom: 12px; font-weight: bold")
                        ),
                        column(
                          width = 4,
                          actionButton(inputId = "btnToolset4_5", label = "Function 5",
                                       style = "width: 100%; margin-bottom: 12px; font-weight: bold"),
                          actionButton(inputId = "btnToolset4_6", label = "Function 6",
                                       style = "width: 100%; margin-bottom: 12px; font-weight: bold")
                        )
                      )
                    ),
                    # Split
                    tags$hr(style = "border-top: 3px solid orange"),
                    # Lower box: output
                    fluidRow(
                      tabBox(
                        id = "ts5_box1",
                        title = "Toolset5-Box1",
                        width = 12,
                        tabPanel("diamonds", DT::dataTableOutput("ts4_table1")),
                        tabPanel("mtcars", DT::dataTableOutput("ts4_table2")),
                        tabPanel("iris", DT::dataTableOutput("ts4_table3"))
                      )
                    )
            ),
            
            # [toolset_5] ...........................................................
            tabItem(tabName = "toolset_5",
              # fluidPage(
              # Split
              tags$hr(style = "border-top: 3px solid purple"),
              fluidRow(
                column(
                  width = 4,
                  style = "padding: Opx; margin: Opx;",
                  
                  box(
                    width = 12,
                    style = "padding: 8px; margin: Opx; height: 88vh; background-color: #fafafa",
                    title = "parameters",
                    status = "primary",
                    solidHeader = TRUE,
                    
                    tabBox(
                      id = "tabbox_r1c1",
                      width = 12,
                      tabPanel("Search Parameters",
                               tags$hr(style = "border: 2px solid grey"),
                               textInput("paramC", "C", value=""),
                               textInput("paramN", "N", value=""),
                               dateInput("paramD", "D", value="", format="dd/mm/yy"),
                               actionButton("btnParamSearch", label = "Search",
                                            style = "width: 120px; margin-bottom: 12px; font-weight: bold"),
                               tags$hr(style = "border: 2px solid grey"),
                               fileInput("paramF", "Load file", accept = c('CSV files', '*.csv')),
                               actionButton("btnFileSearch", label = "FileSearch",
                                          style = "width: 120px; margin-bottom: 12px; font-weight: bold")
                      ),
                      tabPanel("Search Systems",
                               DT::dataTableOutput("table_sele_2")
                      )
                    )
                  )
                ),
                
                column(
                  width = 8,
                  style = "padding: Opx; margin: Opx;",
                  # style = "padding: 8px; margin: Opx; height: 88vh; background-color: #fafafa",
                  
                  box(
                    title = "DataTables",
                    status = "primary",
                    solidHeader = TRUE,
                    width = 12,
                    tabBox(
                      title = "Data Tables",
                      id = "tab4data",
                      width = 12,
                      # height = "85vh",
                      tabPanel("diamonds", DT::dataTableOutput("ts5_table1")),
                      tabPanel("mtcars", DT::dataTableOutput("ts5_table2")),
                      tabPanel("iris", DT::dataTableOutput("ts5_table3"))
                    )
                  )
                )
              )
              # )
            )
            #End
          )
      )

ui <- dashboardPage(header=header, 
                    sidebar = sidebar, 
                    body = body,
                    skin = "green",
                    title = "Toolbox Demo"
                )



# SERVER -------------------------------------------------

# [server: toolset-1]
svr_toolset_1 <- function(input, output){
  output$ts1_text1 <- renderText("Output area of toolset 1")
  
  output$ts1_table1 <- DT::renderDataTable({
    DT::datatable(diamonds,
                  options = list(scrollX=TRUE, scrollY=TRUE))
  })
  
  output$ts1_table2 <- DT::renderDataTable({
    DT::datatable(mtcars,
                  options = list(scrollX=TRUE, scrollY=TRUE))
  })
  
  output$ts1_table3 <- DT::renderDataTable({
    DT::datatable(iris,
                  options = list(scrollX=TRUE, scrollY=TRUE))
  })
}

# [server: toolset-2]
svr_toolset_2 <- function(input, output){
  output$ts2bx1_table1 <- DT::renderDataTable({
    DT::datatable(diamonds,
                  options = list(scrollX=TRUE, scrollY=TRUE))
  })
  
  output$ts2bx1_table2 <- DT::renderDataTable({
    DT::datatable(mtcars,
                  options = list(scrollX=TRUE, scrollY=TRUE))
  })
  
  output$ts2bx1_table3 <- DT::renderDataTable({
    DT::datatable(iris,
                  options = list(scrollX=TRUE, scrollY=TRUE))
  })
}

# [server: toolset-3]
svr_toolset_3 <- function(input, output){
  output$ts3_table1 <- DT::renderDataTable({
    DT::datatable(diamonds,
                  options = list(scrollX=TRUE, scrollY=TRUE))
  })
  
  output$ts3_table2 <- DT::renderDataTable({
    DT::datatable(mtcars,
                  options = list(scrollX=TRUE, scrollY=TRUE))
  })
  
  output$ts3_table3 <- DT::renderDataTable({
    DT::datatable(iris,
                  options = list(scrollX=TRUE, scrollY=TRUE))
  })
}

# [server: toolset-4]
svr_toolset_4 <- function(input, output){
  output$ts4_table1 <- DT::renderDataTable({
    DT::datatable(diamonds,
                  options = list(scrollX=TRUE, scrollY=TRUE))
  })
  
  output$ts4_table2 <- DT::renderDataTable({
    DT::datatable(mtcars,
                  options = list(scrollX=TRUE, scrollY=TRUE))
  })
  
  output$ts4_table3 <- DT::renderDataTable({
    DT::datatable(iris,
                  options = list(scrollX=TRUE, scrollY=TRUE))
  })
}

# [server: toolset-5]
svr_toolset_5 <- function(input, output){
  output$ts5_table1 <- DT::renderDataTable({
    DT::datatable(diamonds,
                  options = list(scrollX=TRUE, scrollY=TRUE))
  })
  
  output$ts5_table2 <- DT::renderDataTable({
    DT::datatable(mtcars,
                  options = list(scrollX=TRUE, scrollY=TRUE))
  })
  
  output$ts5_table3 <- DT::renderDataTable({
    DT::datatable(iris,
                  options = list(scrollX=TRUE, scrollY=TRUE))
  })
}





server <- function(input, output, session) {
  # # Ask PIN code at startup
  # showModal(modalDialog(
  #   title = "Please input your PIN code",
  #   passwordInput("startupPINCode", "PIN Code", placeholder = "Type your PIN code here"),
  #   div("Note1 blablabla..."),
  #   div("Note1 blablabla..."),
  #   footer = tagList(
  #     actionButton("startupOK","OK", width = 160)
  #   ),
  #   easyClose = FALSE
  # ))
  # observeEvent(input$startupOK,{
  #   removeModal()
  #   cat("PIN Code =", input$startupPINCode, "\n")
  # })
  
  # addTooltip(session = session,
  #            id = "numeric1", 
  #            title = "Title of tooltip", 
  #            placement = "bottom", trigger = "hover")
  
  

  svr_toolset_1(input, output)
  svr_toolset_2(input, output)
  svr_toolset_3(input, output)
  svr_toolset_4(input, output)
  svr_toolset_5(input, output)



  # Event: input$openfile
  observeEvent(input$loaddatafile, {
    rfile <- input$loaddatafile
    cat("file name = ",rfile$name, "\n")
    cat("file path = ",rfile$datapath, "\n")
    cat("file size = ",rfile$size, "\n")
    cat("file type = ",rfile$type, "\n")
  })
  
  
  # Stop server after brower closed
  session$onSessionEnded(function() {
    stopApp(message("Shiny App Stopped!"))
  })
  
}



# Shiny main loop ------------------------------
# options(shiny.host = "0.0.0.0", shiny.port = 7777, shiny.launch.browser = T)
# shinyApp(ui, server)

options(shiny.host = "0.0.0.0", shiny.port = 7777, shiny.launch.browser = F)
app<-shinyApp(ui, server)
runApp(app)
