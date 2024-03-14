
box::use(
  utils[read.csv],
  dplyr[filter,pull],
  arrow[read_parquet]
)


GetHospiceUser <- function(session, file_name = "app/static/shiny_dashboard_permissions.csv"){
  user_hospice_df <- read.csv(file_name)
  if(is.null(session$user)){
    user_hospice <- "Cranford"
  }else{
    user_hospice <- user_hospice_df |>
      filter(User == session$user) |>
      pull(Hospice)

  }
  return(user_hospice)
}



GetPatientCounts <- function(HOSPICE){
  metrics_patients <- read_parquet("data/metrics_patients_STAGE3.parquet") |>
    filter(hospice_stage2 == HOSPICE) |>
    filter(patient_category_stage2 == "Patient On-the-books in Time Period") |>
    pull(count)
  return(metrics_patients)
}


GetDeathCounts <- function(HOSPICE){
  metrics_deaths <- read_parquet("data/metrics_deaths_STAGE3.parquet") |>
    filter(hospice_stage2 == HOSPICE) |>
    filter(active_death_stage2 == TRUE) |>
    pull(count)
  return(metrics_deaths)
}
