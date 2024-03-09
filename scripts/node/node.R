NODE_DEPENDENCIES = list(
)

NODE_DEV_DEPENDENCIES = list(
  "tailwindcss" = "^3.4.1"
)
NODE_SCRIPTS = list(
  "tailwind" = "tailwindcss -c ./tailwind.config.js -i ../scripts/tailwind/tailwind.css -o ../app/static/css/tailwind.css"
)

build_node_packages <- function() {
  package_json_path <- .node_path("package.json")
  if (!file.exists(package_json_path)) {
    cli::cli_abort("⛔ No package.json found, please run rhino first!")
  }
  # Read and parse package.json
  package_json <- jsonlite::read_json(package_json_path, simplifyVector = TRUE)
  if (is.null(package_json) || is.null(package_json$scripts)) {
    cli::cli_abort("⛔ Failed to read package.json!")
  }

  # Add the required dependencies & scripts
  deps = .append_to_package_json(package_json, "dependencies", NODE_DEPENDENCIES)
  dev_deps = .append_to_package_json(deps$package_json, "devDependencies", NODE_DEV_DEPENDENCIES)
  scripts = .append_to_package_json(dev_deps$package_json, "scripts", NODE_SCRIPTS)

  package_json = scripts$package_json

  # Save the modified package.json
  write(toJSON(package_json, auto_unbox = TRUE, pretty = TRUE), file = package_json_path)

  # Install the dependencies (if any)
  if (deps$install_req || dev_deps$install_req) {
    cli::cli_alert_info(" 🚀 Running NPM install")
    .npm("install", "--no-audit", "--no-fund")
  }

  cli::cli_alert_success("🌱 Node setup completed!")
}


.npm <- function(..., status_ok = 0, async = FALSE) {
  args <- c(...)
  if (async) {
    env_vars <- Sys.getenv()
    cwd <- normalizePath(.node_path(), mustWork = FALSE)
    npm_process <- processx::process$new(
      "npm.cmd",
      args = args,
      wd = cwd,
      echo_cmd = TRUE,
      env = env_vars,
      windows_verbatim_args = TRUE,
      windows_detached_process = TRUE
    )
    cli::cli_alert_info(" 🛠️ process started in detached mode... ")
    print(npm_process)

  } else {
    withr::with_dir(.node_path(), {
      status <- system2(command = "npm", args = args)
    })
    if (status != status_ok) {
      cli::cli_abort(paste("⛔ System command `npm` exited with status ", status))
    }
  }
}


.node_path <- function(...) {
  fs::path(".rhino", ...)
}

.append_to_package_json <- function(package_json, section_key, to_be_installed) {
  install_req = FALSE
  section = package_json[[section_key]]

  for (i in seq_along(to_be_installed)) {
    key <- names(to_be_installed)[i]
    current_val <- section[[key]]
    new_value <- to_be_installed[[i]]

    if (is.null(current_val) || current_val != new_value) {
      if (is.null(current_val)) {
        cli::cli_alert_info(paste0(" 📦️ Installing `", key, "` into package.", section_key))
      } else {
        cli::cli_alert_info(paste0(" 📦️ Updating `", key, "` in package.", section_key, " from `", current_val, "` -> `", new_value, "`"))
      }

      package_json[[section_key]][[key]] <- new_value
      install_req = TRUE
    }
  }
  return(list(package_json = package_json, install_req = install_req))
}