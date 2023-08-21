box::use(
  shiny[div, icon, tags, moduleServer, NS],
)

box::use(
  app / view / layouts / ThemeToggle
)

#' @export
ui <- function(..., id, class = NULL, title = "") {
  ns <- NS(id)
  div(
    id = id,
    # class = "h-16 fixed top-0 z-30 w-[calc(100vw-6px)] backdrop-blur flex-none transition-colors duration-500 lg:z-50 lg:border-b lg:border-slate-900/10 dark:border-slate-50/[0.06] bg-slate-50/75 supports-backdrop-blur:bg-white/60 dark:bg-slate-950/75",
    class = "h-16 fixed top-0 z-30 w-[calc(100vw-6px)] backdrop-blur flex-none transition-colors duration-500 lg:z-50 border-b border-slate-300/50 dark:border-slate-800/50 bg-slate-50/75 dark:bg-slate-950/75",
    div(
      class = "max-w-8xl mx-auto flex items-center",
      div(
        class="flex pl-4 gap-4 items-center",
        tags$img(
          src = "/static/logo.png",
          alt = "Workflow",
          class = "h-7 w-auto"
        ),
        tags$span(
          class = "text-2xl font-bold text-slate-700 dark:text-slate-200",
          title
        )
      ),
      ...,

      tags$div(
        class = "ml-auto flex items-center justify-end",

        ThemeToggle$ui(ns("theme_toggle")),
      ),
      # div(
      #   class = "flex-grow",
      #
      # )

    )
  )

}

# #' @export
# server <- function(id) {
#   moduleServer(id, function(input, output, session) {
#     print("Testing module server part works!")
#   })
# }
