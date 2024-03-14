box::use(
  shiny[div, tags, moduleServer,reactive,NS,icon, uiOutput,renderUI],
  arrow[read_parquet],
  ggplot2[ggplot,aes,geom_bar,theme_minimal,theme,labs,ggtitle],
  dplyr[filter,select,rename,pull]
)

box::use(
  app / logic / ReturnValueFunctions[GetHospiceUser,GetDeathCounts]
)
#' @export
ui <- function(..., id, class = NULL, title_class = NULL) {
  ns <- NS(id)
  div(
    id = id,
    class = paste("py-4", class),
    tags$h2("", class = paste("text-2xl font-semibold text-primary-300", title_class)),
    uiOutput(ns("DeathsValue"))
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {

    HOSPICE <- reactive({
      hospice <- GetHospiceUser(session)
      return(hospice)
    })

    output$DeathsValue <- renderUI({

      metrics_deaths <- GetDeathCounts(HOSPICE())


      return(paste0("There were ", metrics_deaths, " deaths."))
    })
  })
}
