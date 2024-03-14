box::use(
  shiny[div, tags, moduleServer,reactive,NS],
  arrow[read_parquet],
  ggplot2[ggplot,aes,geom_bar,theme_minimal,theme,labs,ggtitle],
  plotly[plotlyOutput,renderPlotly,ggplotly],
  dplyr[filter,select,rename]
)

box::use(
  app / logic / ReturnValueFunctions[GetHospiceUser]
)
#' @export
ui <- function(..., id, class = NULL, title_class = NULL) {
  ns <- NS(id)
  div(
    id = id,
    class = paste("py-4", class),
    tags$h2("Plot", class = paste("text-2xl font-semibold text-primary-300", title_class)),
    plotlyOutput(ns("BarPlot"))
    )
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {

    HOSPICE <- reactive({
      hospice <- GetHospiceUser(session)
      return(hospice)
    })

    output$BarPlot <- renderPlotly({

      metrics_patients <- read_parquet("data/metrics_patients_STAGE3.parquet") |>
        filter(hospice_stage2 == HOSPICE())

      plot <- metrics_patients |>
        select(-hospice) |>
        filter(patient_category_stage2 != "Neither On-the-books in Time Period or Contacted in Time Period") |>
        rename(Count = count) |>
        ggplot(aes(y = patient_category_stage2,x = Count, fill = patient_category_stage2))+
        geom_bar(stat="identity") +
        theme_minimal() +
        theme(legend.position = "none") +
        labs(x="Count",y="") +
        ggtitle(paste0("Patient Counts for ", HOSPICE()))

      return(ggplotly(plot,tooltip = "Count"))
    })
  })
}
