box::use(
  shiny[div, tags, moduleServer, NS]
)

box::use(
  app / logic / PlotPatientCategories
)

box::use(
  app / logic / ReportPatientCounts
  )


box::use(
  app / logic / ReportDeathCounts
  )



#' @export
ui <- function(..., id) {
  ns <- NS(id)
  div(
    id = id,
    class = "bg-slate-200 flex flex-row gap-x-4 p-4 h-[110vh] dark:bg-slate-950",
    `data-router-animate` = "true",
    div(
      id = ns("sidebar"),
      class = "bg-white h-full w-96 p-6 rounded-lg shadow-lg dark:bg-slate-900",
      tags$h2("Sidebar Title", class = "text-slate-700 dark:text-white font-semibold text-xl pb-2"),
      tags$p(
        "This is a sidebar description. We can put things in here to explain how to use the page",
        tags$br(),
        tags$br(),
        "You can (sort of) format things with line breaks and stuff. It's not great, but it's something!",
        class = "text-slate-600 dark:text-slate-400 "),
    ),
    div(
      id = ns("content"),
      class = "bg-white h-full flex-grow px-8 py-6 rounded-lg shadow-lg dark:bg-slate-900",
      tags$h1("Patients", class = "text-4xl font-bold text-sky-500"),
      PlotPatientCategories$ui(id = ns("patient_categories")),

    ),

    div(
      id = ns("content"),
      class = "bg-white h-full flex-grow px-8 py-6 rounded-lg shadow-lg dark:bg-slate-900",
      tags$h1("Key Information", class = "text-4xl font-bold text-sky-500"),
     ReportPatientCounts$ui(id = ns("patient_counts")),
     ReportDeathCounts$ui(id = ns("death_counts")),

    )
  )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    print("Demo module server part works!")
    PlotPatientCategories$server("patient_categories")
    ReportPatientCounts$server("patient_counts")
    ReportDeathCounts$server("death_counts")

  })
}
