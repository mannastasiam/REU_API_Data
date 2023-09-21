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

# Start and end dates
start_date <- 2000
end_date <- 2023

# Create a directory to store the CSV files
output_dir <- "country_data/raw_data/World Bank/"
dir.create(output_dir, showWarnings = FALSE, recursive = TRUE)

# Initialize an empty list to store dataframes
dataframes <- list()

# Loop through the indicator list
for (indicator_name in WB_list) {
  # Search for the indicator
  indicator <- wb_search(indicator_name)
  
  # Check if the indicator was found
  if (nrow(indicator) > 0) {
    # Select the first indicator (you can modify this if needed)
    indicator <- indicator[1, ]
    
    # Download the data for the indicator
    df <- wb_data(indicator$indicator_id, start_date = start_date, end_date = end_date)
    
    # Add the data to the list of dataframes
    dataframes[[indicator_name]] <- df
    
  } else {
    cat("Indicator not found:", indicator_name, "\n")
  }
}

# Save each dataframe as a separate CSV file
for (indicator_name in names(dataframes)) {
  df <- dataframes[[indicator_name]]
  filename <- file.path(output_dir, paste0("WB_", indicator_name, ".csv"))
  write.csv(df, filename)
  cat("Data saved as", filename, "\n")
}

# Optionally, you can also save a combined CSV file if needed
	#combined_data <- do.call(rbind, dataframes)
	#write.csv(combined_data, file.path(output_dir, "Combined_WB_Data.csv"))
	#cat("Combined data saved as Combined_WB_Data.csv\n")
