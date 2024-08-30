# Pairwise Comparison of Methods in Machine Learning Metrics

## Overview

This repository contains R functions designed to compare methods across a CSV files that represents various metrics in machine learning evaluation. The function calculates how many datasets each method outperforms compared to other methods. Results are organized and saved as CSV files in a specified folder for easy interpretation and further analysis.


## How to cite

```plaintext
@misc{pairComparison2024,
  author = {Elaine Cecília Gatto},
  title = {pairComparisonL: A package },  
  year = {2024},
  note = {R package version 0.1.0. Licensed under CC BY-NC-SA 4.0},
  doi = {},
  url = {https://github.com/cissagatto/pairComparison}
}
```



## How to Use the Code

### 1. Package

First, install and call the package 

```r
library(pairComparision)
```

### 2. Computing


#### A. For one single csv file


```r

names.methods <- c("Model_1", "Model_2", "Model_3", "Model_4")

filename <- "C:/Users/Cissa/Documents/pairComparison/data/accuracy.csv"

results = pair.comparison(filename = filename, 
                FolderOrigin = FolderData,
                FolderDestiny = FolderResults, 
                measure.name = "accuracy",
                names.methods = names.methods) 
                
# Acessando os resultados para uma medida específica
print(results$Accuracy$greater_or_equal)
print(results$Accuracy$greater)
print(results$Accuracy$less_or_equal)
print(results$Accuracy$less)
print(results$Accuracy$equal)


```



#### B. For more than one single csv file


```r

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
results  = pair.comparison.all.measures(names.csvs = full_paths,
                             FolderOrigin = FolderData, 
                             FolderDestiny = FolderResults,
                             names.methods = names.methods, 
                             names.measures = measure_names)
                             
# Acessando os resultados
print(results$greater_or_equal)
print(results$greater)
print(results$less_or_equal)
print(results$less)
print(results$equal)
                             
```



#### Example Output

For a given CSV file, the result might look like this:

```csv
"","Model_1","Model_2","Model_3","Model_4"
"Model_1",14,9,5,6
"Model_2",7,14,2,4
"Model_3",9,12,14,9
"Model_4",8,10,5,14
```

In this matrix:
- The cell at row `Model_1` and column `Model_2` shows `9`, meaning `Model_1` outperforms `Model_2` in 9 datasets.




## Function

### `pair.comparison`

The `pair.comparison` function compares methods across a single CSV file by determining how many datasets each method outperforms another. It processes a given CSV file and saves the comparison results in a structured manner in a results folder.

#### Parameters

- **`filename`**: A character string specifying the full path of the CSV file to be processed. The CSV should have a structure where each row represents a dataset and each column (except the first) represents a method's performance in that dataset.

- **`FolderOrigin`**: A character string specifying the path to the folder where the CSV file is located. This parameter is currently unused but can be included for compatibility with other functions.

- **`FolderDestiny`**: A character string specifying the path to the folder where results will be saved. The function will create a subfolder here for each measure.

- **`measure.name`**: A character string specifying the name of the measure being processed. This name will be used to organize the results.

- **`names.methods`**: A character vector containing the names of the methods used as column names in the data. These names will be used for labeling the results.



#### Returns

The function does not return any value. It writes multiple CSV files with the comparison results to the specified folder. The results are stored in the following files:

- **`greater-or-equal-datasets.csv`**: Contains the number of datasets in which each method is greater than or equal to the other methods.
- **`greater-datasets.csv`**: Contains the number of datasets in which each method is greater than the other methods.
- **`less-or-equal-datasets.csv`**: Contains the number of datasets in which each method is less than or equal to the other methods.
- **`less-datasets.csv`**: Contains the number of datasets in which each method is less than the other methods.
- **`equal-datasets.csv`**: Contains the number of datasets in which each method is equal to the other methods.



### Documentation

For more detailed documentation on each function, check out the `~/pairComparison/docs`folder



## 📚 **Contributing**

We welcome contributions from the community! If you have suggestions, improvements, or bug fixes, please submit a pull request or open an issue in the GitHub repository.



## Acknowledgment
- This study was financed in part by the Coordenação de Aperfeiçoamento de Pessoal de Nível Superior - Brasil (CAPES) - Finance Code 001.
- This study was financed in part by the Conselho Nacional de Desenvolvimento Científico e Tecnológico - Brasil (CNPQ) - Process number 200371/2022-3.
- The authors also thank the Brazilian research agencies FAPESP financial support.

## 📧 **Contact**

For any questions or support, please contact:
- **Prof. Elaine Cecilia Gatto** (elainececiliagatto@gmail.com)
  

# Links

| [Site](https://sites.google.com/view/professor-cissa-gatto) | [Post-Graduate Program in Computer Science](http://ppgcc.dc.ufscar.br/pt-br) | [Computer Department](https://site.dc.ufscar.br/) |  [Biomal](http://www.biomal.ufscar.br/) | [CNPQ](https://www.gov.br/cnpq/pt-br) | [Ku Leuven](https://kulak.kuleuven.be/) | [Embarcados](https://www.embarcados.com.br/author/cissa/) | [Read Prensa](https://prensa.li/@cissa.gatto/) | [Linkedin Company](https://www.linkedin.com/company/27241216) | [Linkedin Profile](https://www.linkedin.com/in/elainececiliagatto/) | [Instagram](https://www.instagram.com/cissagatto) | [Facebook](https://www.facebook.com/cissagatto) | [Twitter](https://twitter.com/cissagatto) | [Twitch](https://www.twitch.tv/cissagatto) | [Youtube](https://www.youtube.com/CissaGatto) |


---

Feel free to adjust any specific details or add additional sections based on your needs.
