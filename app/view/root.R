box::use(
  shiny[h1, h2, div, moduleServer, NS, tags],
  shiny.tailwind[use_tailwind],
)

box::use(
  app / components / react[AppLayout],
)

# FONT_URL <- "https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,400;0,500;0,600;0,700;1,400;1,600&display=swap"
FONT_URL <- "https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;900&display=swap"

#' @export
ui <- function(..., id) {
  ns <- NS(id)

  div(
    use_tailwind(
      tailwindConfig = "app/styles/tailwind.config.js",
    ),
    tags$head(
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
    AppLayout(
      navMenu = div(
        h2("Nav Menu", class = "text-2xl font-bold m-4"),
        tags$ul(
          class="mx-4 my-2",
          tags$li("Menu Item 1", class = "text-lg font-medium"),
          tags$li("Menu Item 2", class = "text-lg font-medium"),
        )
      ),
      h1("Page Title", class = "text-4xl font-bold"),
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