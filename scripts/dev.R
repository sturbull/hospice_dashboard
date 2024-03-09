source("./scripts/tailwind/tailwind.R")
source("./scripts/node/node.R")

build_node_packages()
rhino::build_js()
rhino::build_sass()
build_tailwind(watch=TRUE)


cached_func_with_file <- function(dir,
                                  file,
                                  func,
                                  case.sensitive = FALSE) {
  dir <- normalizePath(dir, mustWork = TRUE)
  value <- NULL
  filePattern <- getOption(
    "shiny.autoreload.pattern",
    ".*\\.(r|html?|js|css|png|jpe?g|gif)$"
  )
  last_mtimes <- NULL
  function(...) {
    file.path.func <- if (case.sensitive) file.path else file.path.ci
    fname <- file.path.func(dir, file)
    files <- list.files(dir, filePattern, recursive = TRUE, ignore.case = TRUE)
    files <- sort_c(files)
    mtimes <- file.info(files)$mtime
    names(mtimes) <- files
    if (!identical(last_mtimes, mtimes)) {
      value <<- func(fname, ...)
      last_mtimes <<- mtimes
    }
    value
  }
}
shiny_env <- environment(shiny:::cachedFuncWithFile)
unlockBinding("cachedFuncWithFile", shiny_env)
body(shiny_env$cachedFuncWithFile) <- body(cached_func_with_file)
lockBinding("cachedFuncWithFile", shiny_env)
options(shiny.autoreload = TRUE)

# shiny::shinyOptions(shiny.autoreload = TRUE)
# shiny::shinyOptions(shiny.autoreload.pattern = glob2rx("app/*\\.R$"))
shiny::runApp(launch.browser = TRUE)