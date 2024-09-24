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

teste = data.frame(read.csv(filename))
nomes.datasets = teste[,1]

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

names.methods = c("Lo", "G", "H.Ra", "NH.Ra", "H.J.K1",
                  "H.Ro.K1", "H.J.K2", "H.Ro.K2", "H.J.K3",  
                  "H.Ro.K3", "H.J.T0", "H.Ro.T0", "H.J.T1", 
                  "H.Ro.T1", "NH.J.K1", "NH.Ro.K1", "NH.J.K2", 
                  "NH.Ro.K2", "NH.J.K3", "NH.Ro.K3", "NH.J.T0", 
                  "NH.Ro.T0", "NH.J.T1", "NH.Ro.T1")

measure_names <- extract_measure_names(full_paths)

# Perform comparison for all measures
results = pair.comparison.all.measures(names.csvs = full_paths,
                                       FolderOrigin = FolderData, 
                                       FolderDestiny = FolderResults,
                                       names.methods = names.methods, 
                                       names.measures = measure_names)


#############################################################################
# Acessando os resultados para uma medida específica
print(results$accuracy$greater_or_equal)

comparison_df = data.frame(results$accuracy$greater_or_equal)
pc.plot.heatmap(comparison_df, title = "Model Comparison Heatmap")

resultado = data.frame(read.csv("C:/Users/Cissa/Documents/pairComparison/data/accuracy.csv"))
colnames(resultado)


##############################################################################
# Set the base path
base_path <- "C:/Users/Cissa/Documents/pairComparison/results"
setwd(base_path)

# Get directory names and paths
directories <- list.dirs(full.names = TRUE, recursive = FALSE)
directory_names <- basename(directories)

# Get measurement types
measurements <- pc.measures()

# Define the desired order of methods
desired_order <- c("Lo", "G", "H.Ra", "NH.Ra", "H.J.K1", "H.Ro.K1", 
                   "H.J.K2", "H.Ro.K2", "H.J.K3", "H.Ro.K3", 
                   "H.J.T0", "H.Ro.T0", "H.J.T1", "H.Ro.T1", 
                   "NH.J.K1", "NH.Ro.K1", "NH.J.K2", "NH.Ro.K2", 
                   "NH.J.K3", "NH.Ro.K3", "NH.J.T0", "NH.Ro.T0", 
                   "NH.J.T1", "NH.Ro.T1")

# Function to process each directory
process_directory <- function(index) {
  # Get current directory path and corresponding measurement
  current_path <- directories[index]
  measurement_name <- directory_names[index]
  
  # Load the measurement type for the current directory
  measurement_type <- filter(measurements, names == measurement_name)$type
  suffix <- ifelse(measurement_type == 1, "greater", "less")
  
  # Build file names and paths
  file_name <- paste(measurement_name, "-", suffix, "-datasets.csv", sep = "")
  file_path <- file.path(current_path, file_name)
  
  # Read data
  data <- read.csv(file_path)
  names(data)[1] <- "Method1"  # Rename the first column
  
  # Generate the heatmap
  heatmap_plot <- pc.plot.heatmap(data, title = "Comparison Heatmap", desired_order)
  
  # Save the heatmap as a PDF
  output_folder <- file.path("C:/Users/Cissa/Documents/pairComparison/results", measurement_name)
  dir.create(output_folder, showWarnings = FALSE, recursive = TRUE)  # Create directory if it doesn't exist
  save.heatmap.as.pdf(heatmap_plot, file_path = output_folder, file_name = paste(measurement_name, "-", suffix, sep = ""), width = 10, height = 6)
  
  gc()  # Call garbage collection to free memory
}

# Process each directory
lapply(seq_along(directories), process_directory)

