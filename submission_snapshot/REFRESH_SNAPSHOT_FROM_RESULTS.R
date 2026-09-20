repo_root <- normalizePath(getwd(), mustWork = TRUE)
src <- file.path(repo_root, "results", "figures")
dst <- file.path(repo_root, "submission_snapshot", "figures")

if (!dir.exists(src) || !dir.exists(dst)) {
  stop("Run this script from the repository root.")
}

mapping <- c(
  Figure1_Regional_Corridors.png = "Figure_Regional_Corridors_Lembang_0_20_20_30_30_50.png",
  Figure2_Annual_Magnitude_Coverage.png = "Figure_Magnitude_Harmonization_Annual_Coverage.png",
  Figure3_MCMC_Trace_Primary.png = "Figure_MCMC_Trace_Primary.png",
  Figure4_MCMC_Density_Primary.png = "Figure_MCMC_Density_Primary.png",
  Figure5_Hindcast_2024_Count.png = "Figure_Hindcast_2024_Count.png",
  Figure6_Bandung_Context.png = "Figure_Bandung_Context_Fault_Events.png",
  Figure7a_Bandung_E_IDW.png = "Figure_Bandung_Exposure_E_Isopleth_IDW.png",
  Figure7b_Bandung_V_IDW.png = "Figure_Bandung_Vulnerability_V_Isopleth_IDW.png",
  Figure7c_Bandung_C_IDW.png = "Figure_Bandung_CriticalFacilities_C_Isopleth_IDW.png",
  Figure8_Bandung_Forecast_IDW.png = "Figure_Bandung_ETAS_Forecast_30d.png",
  Figure9_Bandung_DPPI_IDW.png = "Figure_Bandung_DPPI_30d.png"
)

for (out_name in names(mapping)) {
  in_file <- file.path(src, mapping[[out_name]])
  if (!file.exists(in_file)) stop("Missing figure: ", in_file)
  file.copy(in_file, file.path(dst, out_name), overwrite = TRUE)
}

message("Submission snapshot figures refreshed from analysis results.")
