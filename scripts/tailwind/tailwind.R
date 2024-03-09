library(jsonlite)
library(processx)
source("./scripts/node/node.R")

build_tailwind <- function(watch = FALSE) {
  cli::cli_alert_info(" 📥 Copying tailwind.config into .rhino directory")
  file.copy(from = "scripts/tailwind/tailwind.config.js", to = ".rhino/tailwind.config.js", overwrite = TRUE)

  if (watch) {
    cli::cli_alert_info(" ♾️️ Initializing node process")
    # .npm("run", "tailwind","--","--minify --watch", async = TRUE)
    .npm("run", "tailwind", "--", "--watch", async = TRUE)
    cli::cli_alert_success("🧁 Running Tailwind CSS in detached `watch` mode")
  } else {
    # Build once
    .npm("run", "tailwind", "--", "--minify")
    cli::cli_alert_success("🧁 Tailwind CSS build completed!")
  }
}
