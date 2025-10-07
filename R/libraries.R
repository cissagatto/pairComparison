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
# WORKSPACE
##############################################################################
FolderRoot <- "~/pairComparison"
FolderScripts <- "~/pairComparison/R"

##############################################################################
# FUNCTION: install (if necessary) and load packages
##############################################################################
install_and_load <- function(pkgs, repos = "https://cloud.r-project.org") {
  for (p in pkgs) {
    # Check if the package is already installed
    if (!requireNamespace(p, quietly = TRUE)) {
      message(sprintf("Package '%s' not found — installing...", p))
      
      # Try installing from CRAN; if it fails, try from Bioconductor
      tryCatch(
        install.packages(p, repos = repos),
        error = function(e) {
          message(sprintf("Failed to install '%s' from CRAN: %s", p, e$message))
          
          # Try installing BiocManager if not already available
          if (!requireNamespace("BiocManager", quietly = TRUE)) {
            message("Installing 'BiocManager' to try Bioconductor installation...")
            install.packages("BiocManager", repos = repos)
          }
          
          # Try installing the package from Bioconductor
          message(sprintf("Attempting to install '%s' via Bioconductor...", p))
          BiocManager::install(p, ask = FALSE)
        }
      )
    }
    
    # Load the package after installation
    library(p, character.only = TRUE)
  }
}

##############################################################################
# LIST OF REQUIRED PACKAGES
##############################################################################
packages_needed <- c(
  "ggplot2",
  "reshape2",
  "dplyr",
  "ggforce",
  "stringr",
  "tidyr"
)


# Execute installation and loading
install_and_load(packages_needed)

