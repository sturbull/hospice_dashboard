box::use(
  shiny[h1, h2, a, div, moduleServer, NS, tags],
)

box::use(
  app / view / layouts / AppLayout,
  app / view / layouts / ThemeToggle,
)

# FONT_URL <- "https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,400;0,500;0,600;0,700;1,400;1,600&display=swap"
FONT_URL <- "https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;900&display=swap"

#' @export
ui <- function(..., id, title = "Synergia Analytics", nav_menu = NULL, app_menu = NULL) {
  ns <- NS(id)
  div(
    tags$head(
      tags$title(title),
      tags$link(
        rel="stylesheet",
        href="static/css/tailwind.css"
      ),
      tags$link(
        rel = "preconnect",
        href = "https://fonts.gstatic.com"
      ),
      tags$link(
        rel = "preload",
        as = "style",
        href = FONT_URL
      ),
      tags$link(
        rel = "stylesheet",
        href = FONT_URL,
        media = "print",
        onload = 'this.media="all"'
      )
    ),
    AppLayout$ui(
      id = ns("layout"),
      title = title,
      app_menu = app_menu,
      nav_menu = nav_menu,

      ...
    )
  )


}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    print("Root module server part works!")
  })
}
