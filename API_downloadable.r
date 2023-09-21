# World Bank API Package
if (!require(wbstats)) {
  install.packages("wbstats")
  library(wbstats)
}
# here is how to find indicator id btw
# https://data.worldbank.org/

# WB indicator list
WB_list <- c(
  "personal remittances, paid",
  "Personal remittances, received",
  "Foreign direct investment, net inflows",
  "Unemployment, total",
  "International migrant stock, total",
  "Refugee population by country or territory of asylum",
  "Strength of legal rights index",
  "International tourism, receipts"
)

# Start and end dates for World Bank data
start_date_WB <- 2000
end_date_WB <- 2023

# Create a directory to store the World Bank CSV files
output_dir_WB <- "country_data/raw_data/World Bank/"
dir.create(output_dir_WB, showWarnings = FALSE, recursive = TRUE)

# Initialize an empty list to store dataframes for World Bank data
dataframes_WB <- list()

# Loop through the World Bank indicator list
for (indicator_name in WB_list) {
  # Search for the indicator
  indicator <- wb_search(indicator_name)
  
  # Check if the indicator was found
  if (nrow(indicator) > 0) {
    # Select the first indicator (you can modify this if needed)
    indicator <- indicator[1, ]
    
    # Download the data for the indicator
    df <- wb_data(indicator$indicator_id, start_date = start_date_WB, end_date = end_date_WB)
    
    # Add the data to the list of dataframes
    dataframes_WB[[indicator_name]] <- df
    
  } else {
    cat("Indicator not found:", indicator_name, "\n")
  }
}

# Save each dataframe as a separate CSV file for World Bank data
for (indicator_name in names(dataframes_WB)) {
  df <- dataframes_WB[[indicator_name]]
  filename <- file.path(output_dir_WB, paste0("WB_", indicator_name, ".csv"))
  write.csv(df, filename)
  cat("World Bank Data saved as", filename, "\n")
}

# WHO API Package
library(httr)
library(jsonlite)


