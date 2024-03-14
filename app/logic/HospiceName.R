box::use(
  shiny[div, tags, moduleServer,uiOutput,renderUI,NS]
  )

box::use(
  app / logic / ReturnValueFunctions[GetHospiceUser]
)

#' @export
ui <- function(..., id, class = NULL, title_class = NULL) {
  ns <- NS(id)

  div(
    id = id,
    class = paste("py-4", class),
    tags$h2(uiOutput(ns("HospiceName")), class = paste("text-2xl font-semibold text-primary-300", title_class)),
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$HospiceName <- renderUI({

      return(GetHospiceUser(session))

    })
  })
}
