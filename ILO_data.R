# ILO API Package
library(tidyverse)
if (!require(Rilostat)) {
  install.packages("Rilostat")
  library(Rilostat)
}
# The below selection is longer than it should be, but I'll go back and fix it when I figure out how the ILO package
# Create a directory to store the ILO files
output_dir_ILO <- "country_data/raw_data/International Labor Organization/"
dir.create(output_dir_ILO, showWarnings = FALSE, recursive = TRUE)

# Using Rilostat package to download data
working_pov <- get_ilostat(id = "EMP_2EMP_SEX_AGE_CLA_NB_A", segment = "indicator")
inflow_sex_country <- get_ilostat(id = "MFL_NCIT_SEX_CCT_NB_A", segment = "indicator")
education <- get_ilostat(id = "MFL_FWAP_SEX_EDU_NB_A", segment = "indicator")
occupation <- get_ilostat(id = "MFL_FEMP_SEX_OCU_NB_A", segment = "indicator")
unemployment <- get_ilostat(id = "MST_TUNE_SEX_EDU_CCT_RT_A", segment = "indicator")
outside_wf <- get_ilostat(id = "MST_TEIP_SEX_EDU_CBR_NB_A", segment = "indicator")
outflow <- get_ilostat(id = "MNA_OPOP_SEX_CDS_NB_A", segment = "indicator")

# Save each dataframe as a separate CSV file for ILO data
write.csv(working_pov, file = file.path(output_dir_ILO, "ILO_Working_Poverty.csv"), row.names = FALSE)
write.csv(inflow_sex_country, file = file.path(output_dir_ILO, "ILO_inflow_sex_country.csv"), row.names = FALSE)
write.csv(education, file = file.path(output_dir_ILO, "ILO_education.csv"), row.names = FALSE)
write.csv(occupation, file = file.path(output_dir_ILO, "ILO_occupation.csv"), row.names = FALSE)
write.csv(unemployment, file = file.path(output_dir_ILO, "ILO_unemployment.csv"), row.names = FALSE)
write.csv(outside_wf, file = file.path(output_dir_ILO, "ILO_outsidewf.csv"), row.names = FALSE)
write.csv(outflow, file = file.path(output_dir_ILO, "ILO_outflow.csv"), row.names = FALSE)
