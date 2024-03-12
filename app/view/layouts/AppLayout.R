box::use(
  shiny[div, tags, NS],
)

box::use(
  app / view / layouts / AppBar,
  app / view / layouts / Footer,
)
#' @export
ui <- function(..., id, title = NULL, nav_menu = NULL, app_menu = NULL) {
  ns <- NS(id)
  div(
    id = ns("root"),
    class = "bg-slate-50 dark:bg-slate-950 text-slate-800 dark:text-slate-200 ",
    # class = "bg-slate-50 dark:bg-slate-950 text-slate-800 dark:text-slate-200 overflow-hidden h-screen",
    AppBar$ui(
      id = ns("app_bar"),
      title = title,
      app_menu
    ),
    div(
      class = "w-full flex overflow-hidden h-screen",
      # div(
      #   class="fixed z-[51] w-12 h-16 bg-red-500"
      # ),
      div(
        id = ns("main"),
        class = "flex flex-col flex-grow subtle-scrollbar overflow-y-scroll min-h-screen pt-16",
        tags$main(
          class = "flex-grow",
          ...
        ),
        Footer$ui(
          id = ns("footer")
        )

      )
    )

  )
}
