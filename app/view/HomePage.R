box::use(
  shiny[div, tags, moduleServer, NS],
  shiny.router[is_page],
)

box::use(
  app / view / home / Testing
)


#' @export
ui <- function(..., id) {
  ns <- NS(id)


  div(
    id=id,
    class = "py-4 px-8 h-[110vh]",
    `data-router-animate` = "true",
    `data-fade-in` = "true",
    tags$h1("Home", class = "text-4xl font-bold text-primary-500 md:text-6xl lg:text-7xl dark:text-primary-200"),
    Testing$ui(id = ns("testing"), class="bg-red-800", title_class="text-white"),
    Testing$ui(id = ns("testing2"))
  )

}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    print("Home module server part works!")
    Testing$server("testing")

    # if (is_page("/", session)) {
    #   print("Home page")
    #
    # }else {
    #   print("Not Home page")
    # }
  })
}
