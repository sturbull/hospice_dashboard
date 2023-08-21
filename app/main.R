box::use(
  shiny[div, moduleServer, NS, renderUI, tags, uiOutput],
  shiny.router[router_ui, router_server, route, route_link],
)
box::use(
  app / view / Root,
  app / view / HomePage,
  app / view / DemoPage,
  app / view / PageNotFound,
  app / view /common / NavButton,
)


#' @export
ui <- function(id) {
  ns <- NS(id)
  Root$ui(
    id = ns("root"),
    nav_menu = div(
      tags$ul(
        # class = "ml-4 my-2 flex flex-row gap-x-4",
        class = "-mx-1 my-2 flex flex-col gap-y-2",
        NavButton$ui(
          id = ns("home"),
          href = route_link("/"),
          icon = "home",
          class="gap-x-2 pl-5",
          "Home",

        ),
        NavButton$ui(
          id = ns("demo"),
          href = route_link("demo"),
          icon = "rocket",
          class="gap-x-2 pl-5",
          "Demo",

        ),
      )
    ),
    # div(
    router_ui(
      route("/", HomePage$ui(id = ns("home"))),
      route("demo", DemoPage$ui(id = ns("demo"))),
      page_404 = PageNotFound$ui(ns("page_404"))
    )
    # )
  )

}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    router_server()
    Root$server("root")
    DemoPage$server("demo")
    HomePage$server("home")


    # output$message <- renderUI({
    #   div(
    #     style = "display: flex; justify-content: center; align-items: center; height: 100vh;",
    #     tags$h1(
    #       tags$a("Check out Rhino docs!", href = "https://appsilon.github.io/rhino/")
    #     )
    #   )
    # })
  })
}
