# Install R dependencies required by the full reproducible R Markdown.
pkgs <- c(
  "Rcpp", "readxl", "dplyr", "tidyr", "ggplot2", "lubridate", "sf",
  "scales", "knitr", "purrr", "stringr", "tibble", "posterior",
  "openxlsx", "rmarkdown"
)
miss <- pkgs[!vapply(pkgs, requireNamespace, logical(1), quietly = TRUE)]
if (length(miss)) install.packages(miss, repos = "https://cloud.r-project.org")
message("Dependencies ready: ", paste(pkgs, collapse = ", "))
