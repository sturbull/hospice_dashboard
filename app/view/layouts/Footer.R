box::use(
  shiny[div, icon, tags, moduleServer, NS],
)

box::use(
  app / view / layouts / ThemeToggle
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  tags$footer(
    id = id,
    class = "border-t border-slate-200 dark:border-slate-900 mx-4",

    div(
      class = "mx-auto max-w-7xl px-6 py-12 md:flex md:items-center md:justify-between lg:px-8 md:pb-8",
      div(
        class = "flex justify-center space-x-6 md:order-2",
        tags$a(
          href = "https://www.linkedin.com/company/synergia-ltd",
          alt = "LinkedIn",
          target = "_blank",
          class = "text-slate-400 hover:text-slate-500 dark:text-slate-500 dark:hover:text-slate-600",
          icon("linkedin-in", class = "h-6 w-6")
        ),
        tags$a(
          href = "https://synergia.consulting",
          alt = "Synergia",
          target = "_blank",
          class = "text-slate-400 hover:text-slate-500 dark:text-slate-500 dark:hover:text-slate-600",
          icon("link", class = "h-6 w-6")
        ),

      ),
      tags$a(
        class = "flex gap-3 items-center justify-center mt-4 md:order-1 md:mt-0",
        href = "https://synergia.consulting",
        alt = "Synergia",
        target = "_blank",
        tags$img(
          src = "/static/logo.png",
          alt = "Workflow",
          class = "h-7 w-auto"
        ),
        tags$span(
          class = "text-xl font-bold uppercase text-primary-800 dark:text-slate-300 tracking-wider",
          "Synergia"
        )
      ),
    ),
    tags$p(
      class = "text-center text-xs leading-5 pb-6 text-slate-400 dark:text-slate-600",
      paste("©", format(Sys.Date(), "%Y"), "Synergia Ltd. All rights reserved.")
    ),
  )

}
