box::use(
  shiny[div, tags, moduleServer],
)

#' @export
ui <- function(..., id, class = NULL, title_class = NULL) {
  div(
    id = id,
    class = paste("py-4", class),
    tags$h2("Testing", class = paste("text-2xl font-semibold text-primary-300", title_class)),
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    print("Testing module server part works!")
  })
}
