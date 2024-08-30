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


# Clear workspace
rm(list=ls())



##############################################################################
# Define Folder Paths
##############################################################################
FolderRoot <- "~/pairComparison"               # Root folder for the project
FolderScripts <- "~/pairComparison/R"           # Folder containing R scripts
FolderData <- "~/pairComparison/data"           # Folder containing CSV data files
FolderResults <- "~/pairComparison/results"     # Folder to save results




##############################################################################
# Load Required Libraries
##############################################################################
library(pairComparison)

# Note: Uncomment and modify the following lines if additional scripts are required
# setwd(FolderScripts)
# source("libraries.R")       # Script to load necessary libraries
# source("utils.R")           # Utility functions
# source("pair-comparison.R") # Main pair comparison functions




##############################################################################
# Comparison for a Single CSV File
##############################################################################
# Define method names and file path
names.methods <- c("Model_1", "Model_2", "Model_3", "Model_4")
filename <- "C:/Users/Cissa/Documents/pairComparison/data/accuracy.csv"

# Perform comparison for a single measure
results = pair.comparison(filename = filename, 
                          FolderOrigin = FolderData,
                          FolderDestiny = FolderResults, 
                          measure.name = "accuracy",
                          names.methods = names.methods) 

# Acessando os resultados para uma medida específica
print(results$greater_or_equal)
print(results$less_or_equal)
print(results$greater)
print(results$less)
print(results$equal)



##############################################################################
# Comparison for Multiple CSV Files
##############################################################################
# Set working directory to the folder containing the CSV files
setwd(FolderData)

# Get list of all CSV files in the directory
files <- list.files(full.names = TRUE) 
# Normalize file paths for consistency
full_paths <- sapply(files, normalizePath)

# Extract measure names from file paths
extract_measure_names <- function(file_paths) {
  # Extract file names from paths
  file_names <- basename(file_paths)
  # Remove file extensions to get measure names
  measure_names <- tools::file_path_sans_ext(file_names)
  return(measure_names)
}

measure_names <- extract_measure_names(full_paths)

# Perform comparison for all measures
results = pair.comparison.all.measures(names.csvs = full_paths,
                             FolderOrigin = FolderData, 
                             FolderDestiny = FolderResults,
                             names.methods = names.methods, 
                             names.measures = measure_names)

# Acessando os resultados para uma medida específica
print(results$accuracy$greater_or_equal)


comparison_df = data.frame(results$accuracy$greater_or_equal)
pc.plot.heatmap(comparison_df, title = "Model Comparison Heatmap")


