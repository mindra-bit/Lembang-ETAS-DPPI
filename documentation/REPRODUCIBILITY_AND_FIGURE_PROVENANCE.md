# Reproducibility and figure provenance

The computational record is contained in `analysis/`, `data/`, and `results/`. It reconstructs the audited catalogues, Bayesian ETAS posterior summaries, branching diagnostics, posterior predictive forecasts, 2024 temporal holdout, Bandung City preparedness components, DPPI, and sensitivity analyses.

The manuscript-oriented record is contained in `submission_snapshot/`. It provides a compact R Markdown summary and the tables used for inspection of the reported results. Publication figures can be regenerated from the computational workflow.

For scientific recomputation, run `analysis/Lembang_Bayesian_ETAS_DPPI.Rmd` from the repository root. The GitHub workflow refits the Bayesian ETAS models from the supplied audited inputs using the documented random seed. Because MCMC is stochastic, a fresh refit can differ slightly from the archived manuscript values; the reported numerical summaries are retained in `results/tables/` for direct verification.

Map smoothing by inverse-distance weighting is used for visualization only. Inferential socioeconomic quantities remain district-level inputs, while the ETAS forecast component is evaluated on the computational grid.
