##############################################################################
# Copyright (C) 2024                                                         #
#                                                                            #
# CC BY-NC-SA 4.0                                                            #
#                                                                            #
# Canonical URL https://creativecommons.org/licenses/by-nc-sa/4.0/           #
# Attribution-NonCommercial-ShareAlike 4.0 International CC BY-NC-SA 4.0     #
#                                                                            #
# Prof. Elaine Cecilia Gatto | Prof. Ricardo Cerri | Prof. Mauri Ferrandin   #
#                                                                            #
# Federal University of São Carlos - UFSCar - https://www2.ufscar.br         #
# Campus São Carlos - Computer Department - DC - https://site.dc.ufscar.br   #
# Post Graduate Program in Computer Science - PPGCC                          # 
# http://ppgcc.dc.ufscar.br - Bioinformatics and Machine Learning Group      #
# BIOMAL - http://www.biomal.ufscar.br                                       #
#                                                                            #
# You are free to:                                                           #
#     Share — copy and redistribute the material in any medium or format     #
#     Adapt — remix, transform, and build upon the material                  #
#     The licensor cannot revoke these freedoms as long as you follow the    #
#       license terms.                                                       #
#                                                                            #
# Under the following terms:                                                 #
#   Attribution — You must give appropriate credit , provide a link to the   #
#     license, and indicate if changes were made . You may do so in any      #
#     reasonable manner, but not in any way that suggests the licensor       #
#     endorses you or your use.                                              #
#   NonCommercial — You may not use the material for commercial purposes     #
#   ShareAlike — If you remix, transform, or build upon the material, you    #
#     must distribute your contributions under the same license as the       #
#     original.                                                              #
#   No additional restrictions — You may not apply legal terms or            #
#     technological measures that legally restrict others from doing         #
#     anything the license permits.                                          #
#                                                                            #
##############################################################################

##############################################################################
# PAIR COMPARISON ANALYSIS SCRIPT
# Author: [Your Name]
# Date: [YYYY-MM-DD]
#
# Description:
#   This script performs pairwise model comparison for a single CSV file
#   using the 'pairComparison' package.
##############################################################################

# Clear workspace
rm(list = ls())




##############################################################################
# Define Folder Paths
##############################################################################
FolderRoot    <- "~/pairComparison"            # Root project folder
FolderScripts <- "~/pairComparison/R"          # Folder containing R scripts
FolderData    <- "~/pairComparison/data"       # Folder containing CSV data files
FolderResults <- "~/pairComparison/results"    # Folder to save comparison results



##############################################################################
# Load Required Libraries
##############################################################################
library(pairComparison)


# Optional: load additional scripts if necessary
# setwd(FolderScripts)
# source("libraries.R")        # Script to load extra libraries
# source("utils.R")            # Utility functions
# source("pair-comparison.R")  # Main pair comparison functions



##############################################################################
# Pairwise Comparison for a Single CSV File
##############################################################################

# Define model (method) names and desired order
method.names       <- c("Model_1", "Model_2", "Model_3", "Model_4")
method.names.order <- c("Model_1", "Model_2", "Model_3", "Model_4")

# Define input CSV file
filename <- file.path(FolderData, "accuracy.csv")

# Load dataset
data <- read.csv(filename, row.names = 1, check.names = FALSE)

# Extract dataset names and method names
dataset.names <- rownames(data)
method.names  <- colnames(data)

# Run pair comparison for a single metric (accuracy)
results <- pair.comparison(
  filename      = filename,
  FolderOrigin  = FolderData,
  FolderDestiny = FolderResults,
  measure.name  = "accuracy",
  names.methods = method.names
)

##############################################################################
# Display Results
##############################################################################
cat("\n===== Pairwise Comparison Results (Accuracy) =====\n")
print(results$greater_or_equal)
print(results$less_or_equal)
print(results$greater)
print(results$less)
print(results$equal)



##############################################################################
# Pairwise Comparison for Multiple CSV Files
##############################################################################

# Set working directory to the data folder
setwd(FolderData)

# Get all CSV files in the directory
files <- list.files(pattern = "\\.csv$", full.names = TRUE)

# Normalize file paths for consistency
full_paths <- normalizePath(files)

# Extract measure names from file names (without extensions)
extract_measure_names <- function(file_paths) {
  file_names <- basename(file_paths)
  measure_names <- tools::file_path_sans_ext(file_names)
  return(measure_names)
}

measure_names <- extract_measure_names(full_paths)

# Define the method names (models)
method.names.order <- c("Model_1", "Model_2", "Model_3", "Model_4")

##############################################################################
# Perform Pairwise Comparison for All Measures
##############################################################################
results <- pair.comparison.all.measures(
  names.csvs     = full_paths,
  FolderOrigin   = FolderData,
  FolderDestiny  = FolderResults,
  names.methods  = method.names.order,
  names.measures = measure_names
)

##############################################################################
# Plot Example Heatmap (Single Measure)
##############################################################################
cat("\n===== Example Heatmap for 'accuracy' =====\n")
print(results$accuracy$greater_or_equal)

# Prepare dataframe for heatmap
comparison_df <- as.data.frame(results$accuracy$greater_or_equal)

# Plot the heatmap
pc.plot.heatmap2(
  comparison_df  = comparison_df,
  title          = "Model Comparison Heatmap (Accuracy)",
  desired_order  = method.names.order
)



##############################################################################
# HEATMAP GENERATION FOR ALL RESULT DIRECTORIES
# Author: [Your Name]
# Date: [YYYY-MM-DD]
#
# Description:
#   This script iterates over all result directories produced by the
#   'pairComparison' workflow, loads the corresponding pairwise comparison
#   CSV files, and generates a heatmap (PDF) for each measurement.
##############################################################################

##############################################################################
# Set Base Path
##############################################################################
base_path <- "~/pairComparison/results"
setwd(base_path)

# Get all result directories (non-recursive)
directories <- list.dirs(full.names = TRUE, recursive = FALSE)
directory_names <- basename(directories)

# Retrieve measurement types from pairComparison package
measurements <- pc.measures()



##############################################################################
# Function to Process Each Directory
##############################################################################
process_directory <- function(index) {
  
  # Identify current directory and corresponding measurement
  current_path     <- directories[index]
  measurement_name <- directory_names[index]
  
  # Retrieve measurement type (1 = higher is better, 0 = lower is better)
  measurement_type <- dplyr::filter(measurements, names == measurement_name)$type
  suffix <- ifelse(measurement_type == 1, "greater", "less")
  
  # Build input file path
  file_name <- paste0(measurement_name, "-", suffix, "-datasets.csv")
  file_path <- file.path(current_path, file_name)
  
  # Define the desired method order
  method.names.order <- c("Model_1", "Model_2", "Model_3", "Model_4")
  
  # Load data
  data <- read.csv(file_path, check.names = FALSE)
  
  # Handle unwanted 'X' column created when saving CSV with row names
  if ("X" %in% colnames(data)) {
    rownames(data) <- data$X
    data <- data[, !names(data) %in% "X"]
  }
  
  # Generate the heatmap
  heatmap_plot <- pc.plot.heatmap2(
    comparison_df = data,
    title         = paste("Comparison Heatmap -", measurement_name),
    desired_order = method.names.order
  )
  
  # Define and create output folder if it doesn’t exist
  output_folder <- file.path(base_path, measurement_name)
  dir.create(output_folder, showWarnings = FALSE, recursive = TRUE)
  
  # Save heatmap as PDF
  save.heatmap.as.pdf(
    heatmap_plot,
    file_path = output_folder,
    file_name = paste0(measurement_name, "-", suffix),
    width = 10,
    height = 6
  )
  
  # Clean up memory
  gc()
}



##############################################################################
# Process All Directories
##############################################################################
lapply(seq_along(directories), process_directory)




##############################################################################
# End of Script
##############################################################################


