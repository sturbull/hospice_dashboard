box::use(
  shiny[div, tags, moduleServer, NS, uiOutput,renderUI],
  shiny.router[is_page],
)

box::use(
  app / logic / ReturnValueFunctions[GetHospiceUser]
)


#' @export
ui <- function(..., id) {
  ns <- NS(id)

  div(
    id = id,

    `data-router-animate` = "true",
    `data-fade-in` = "true",
    div(
      class = "py-4 px-8 relative flex h-content min-h-screen",
      div(
        id = ns("content"),
        class = "relative z-10 flex-grow mx-auto w-full max-w-4xl flex flex-col gap-y-4 justify-center",

        tags$h1(uiOutput(ns("HospiceName")), class = "text-4xl font-bold md:text-6xl lg:text-7xl text-white"),
        tags$h2("HospiceNZ Insights and Volumes Dashboard", class = "text-2xl text-sky-300")
      ),
      div(
        id = ns("bg"),
        class = "absolute inset-0 z-[-1] bg-gradient-to-r from-slate-950 to-indigo-950 pointer-events-none"
      ),
    )


  )

}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    print("Home module server part works!")

    output$HospiceName <- renderUI({
      return(paste0("Welcome ", GetHospiceUser(session),"!"))})

  })

}
