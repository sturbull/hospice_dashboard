box::use(
  shiny[icon, tags, NS],
)

#' @export
ui <- function(..., id, href, icon = NULL, class = NULL) {
  ns <- NS(id)
  tags$li(
    id = id,
    tags$a(
      href = href,
      class = paste("group hover:bg-primary-100 hover:text-primary-500 flex items-center px-4 py-2 text-sm font-bold rounded-md", class),
      icon(icon, class = "pr-3 text-slate-400 group-hover:text-primary-400"),
      ...
    ))
}
