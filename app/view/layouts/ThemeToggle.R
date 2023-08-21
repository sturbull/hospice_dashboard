box::use(
  shiny[div, icon, tags, NS],
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  div(
    tags$button(
      id = ns("dark"),
      class = "py-4 px-8 dark:hidden",
      onclick = "App.setTheme('dark')",
      icon("moon", class = "text-xl font-semibold text-slate-300 hover:text-primary-400"),
    ),
    tags$button(
      id = ns("light"),
      class = "hidden py-4 px-8 dark:inline-block",
      onclick = "App.setTheme('light')",
      icon("sun", class = "text-xl font-semibold text-slate-500 hover:text-primary-400"),
    )
  )
}
