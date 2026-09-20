repo_root <- normalizePath(getwd(), mustWork = TRUE)

if (!all(dir.exists(file.path(repo_root, c("data", "results", "analysis"))))) {
  stop("Run this helper from the repository root: the folder containing data/, results/, and analysis/.")
}

rmarkdown::render(
  input = file.path(
    repo_root,
    "analysis",
    "Lembang_Bayesian_ETAS_DPPI.Rmd"
  ),
  params = list(
    project_root = repo_root,
    analysis_mode = "full",
    refit_mcmc = TRUE,
    rebuild_outputs = TRUE
  ),
  envir = new.env()
)
