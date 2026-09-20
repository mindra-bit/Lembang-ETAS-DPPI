# Bayesian ETAS and Dynamic Preparedness Priority Index for the Lembang Fault–Bandung City Region

This repository provides the computational materials supporting the Bayesian spatio-temporal ETAS and Dynamic Preparedness Priority Index (DPPI) analysis for the Lembang Fault and Bandung City, Indonesia. The regional ETAS model is separated from the city-level preparedness application so that seismic triggering is not artificially truncated by administrative boundaries, while exposure, vulnerability, and critical-facility indicators remain tied to the jurisdiction where preparedness decisions are made.

## Repository contents

- `analysis/` — complete R and R Markdown workflow.
- `data/input/` — audited analysis inputs in open CSV/GeoJSON formats.
- `data/final/` — principal derived tabular outputs.
- `results/tables/` — posterior, branching, forecast, hindcast, and sensitivity summaries reported in the study.
- `submission_snapshot/` — compact manuscript-oriented R Markdown and summary tables.
- `documentation/` — reproducibility and runtime notes.

Publication figures and large posterior-chain archives are generated outputs and are not duplicated in this lightweight GitHub repository. The analysis can refit the Bayesian ETAS models directly from the supplied audited inputs.

## Reproduce the analysis

From the repository root:

```r
rmarkdown::render(
  "analysis/Lembang_Bayesian_ETAS_DPPI.Rmd",
  params = list(
    project_root = normalizePath("."),
    analysis_mode = "full",
    refit_mcmc = TRUE,
    rebuild_outputs = TRUE
  ),
  envir = new.env()
)
```

Alternatively:

```r
source("analysis/RUN_RMD_FROM_REPO_ROOT.R")
```

The full refit is stochastic but uses the documented random seed. The archived result tables in `results/tables/` provide the numerical values reported in the manuscript for direct verification.

## Reproducibility settings

- Random seed: `20260919`
- Primary analysis period: 1 January 2018 to 31 December 2024
- Primary threshold: `Mcat >= 2.5`
- Strict harmonized sensitivity threshold: `Mw >= 3.4`
- Forecast origin: 1 January 2025
- DPPI posterior propagation: 4,000 draws
- Weight sensitivity: 20,000 Dirichlet(1,1,1,1) weight vectors

## Scientific interpretation

The primary ETAS model uses reported catalogue magnitude (`Mcat`) with explicit provenance; undocumented magnitude types are not relabeled as `Mw`. The strict harmonized `Mw` subset is used as a sensitivity analysis. The ETAS output is a conditional finite-horizon seismicity forecast, not deterministic earthquake prediction or an earthquake early-warning system. DPPI is a relative preparedness-priority index, not expected loss, damage probability, or absolute seismic risk.

The Bandung City DPPI application is retrospective: the seismic component is a 30-day conditional forecast initialized on 1 January 2025 using earthquake observations through 31 December 2024, combined with 2024 population exposure, provisional socioeconomic vulnerability, and health critical-facility exposure.

## Spatial inputs

The regional fault and buffer geometries and the exact Bandung City district unions are stored as GeoJSON. The regional regency/city boundary layer is topology-preserving simplified for cartographic context only; it is not used to estimate ETAS parameters or DPPI values.

## Data availability

The BMKG earthquake catalog used as the primary catalog is available from Mendeley Data (DOI: `10.17632/zmzywny59b.1`). Bandung City input data are available through the Bandung City Open Data portal. The processed audit tables, analysis scripts, derived result tables, and reproducibility materials supporting the study are available in this repository.

Repository: https://github.com/mindra-bit/Lembang-ETAS-DPPI

Accessed on **20 September 2026**.
