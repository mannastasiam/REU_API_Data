# Attach necessary libraries
if (!require(httr)) {
  install.packages("httr")
  library(httr)
}

# WHO API base path
base.path <- "https://ghoapi.azureedge.net/api/$metadata#Indicator"  # Replace with the actual WHO API base URL

# Define a list of WHO indicator codes
WHO_list <- c(
  "AIR_10",
  "AIR_11",
  "AIR_12"
  # Add more indicator codes as needed
)

# Create a directory to store the WHO CSV files
output_dir_WHO <- "country_data/raw_data/WHO/"
dir.create(output_dir_WHO, showWarnings = FALSE, recursive = TRUE)

# Initialize an empty list to store dataframes for WHO data
dataframes_WHO <- list()

# Loop through the WHO indicator list
for (indicator_code in WHO_list) {
  # Download the data for the indicator code
  url <- paste(base.path, "IndicatorData/", indicator_code, sep = "")
  response <- GET(url)
  
  # Check if the response contains data (you may need to adjust this based on the actual API response structure)
  if (length(content(response)) > 0) {
    # Save the data to a CSV file in the output directory
    csv_file <- file.path(output_dir_WHO, paste(indicator_code, ".csv", sep = ""))
    writeLines(as.character(content(response)), con = csv_file)  # Convert to character and write
    cat("Data for indicator code:", indicator_code, "downloaded and saved as", csv_file, "\n")
  } else {
    cat("No data available for indicator code:", indicator_code, "\n")
  }
}
