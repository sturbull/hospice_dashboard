box::use(
  shiny[div, tags, moduleServer, NS],
)
box::use(
  app / view / home / Testing
)


#' @export
ui <- function(..., id) {
  ns <- NS(id)
  div(
    id=id,
    class = "py-4 px-8",
    `data-router-animate` = "true",
    tags$h1("Demo Page", class = "text-4xl font-bold text-sky-500"),
    Testing$ui(id = ns("testing"))
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    print("Demo module server part works!")
  })
}
