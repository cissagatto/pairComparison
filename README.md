### Paired Comparison of Methods in Machine Learning

A paired comparison of methods in machine learning refers to a direct comparison between two models or algorithms across multiple tasks or datasets. The goal is to determine which model performs better in a head-to-head comparison on a set of metrics, such as accuracy, precision, recall, or any other relevant performance measure. In this context, each dataset serves as a paired observation, where the performance of one model is directly compared to the performance of another. This method is particularly useful for understanding the relative strengths and weaknesses of different models in specific scenarios.


## How to cite

```plaintext
@misc{pairComparison2024,
  author = {Elaine Cecília Gatto},
  title = {pairComparison: A package to performing comparisons between pairs of methods. },  
  year = {2024},
  note = {R package version 0.1.0. Licensed under CC BY-NC-SA 4.0},
  doi = {10.13140/RG.2.2.28587.04642},
  url = {https://github.com/cissagatto/pairComparison}
}
```


### Mathematical Contextualization

Let’s formalize this concept mathematically:

1. **Models and Datasets**:
   - Consider $M$ models (or methods) $m_{1}, m_{2}, \dots, m_{M}$.
   - These models are evaluated on $N$ datasets $D_{1}, D_{2}, \dots, D_{N}$.

2. **Performance Metric**:
   - Let $P_{i,j}$ denote the performance metric of model $m_{i}$ on dataset $D_j$. This metric could be accuracy, F1-score, or any other relevant measure.

3. **Pairwise Comparison**:
   - For each pair of models $m_{i}$ and $m_{k}$, you compare their performance on each dataset $D_{j}$. Specifically:
     - Define a comparison indicator function $C_{i,k,j}$ as:

       $$C_{i,k,j}
      \left\{ 
      \begin{array}{cl}
      1 & \text{if } P_{i,j} > P_{k,j} \text{ (Model \( m_i \) outperforms Model \( m_k \) on \( D_j \))}\\
      0 & \text{if } P_{i,j} = P_{k,j} \text{ (Model \( m_i \) ties with Model \( m_k \) on \(D_j\)}\\
      -1 & \text{if } P_{i,j} < P_{k,j} \text{ (Model \( m_i \) underperforms compared to Model \( m_k \) on \( D_j \))}
      \end{array} 
      \right$$

4. **Summarizing Pairwise Performance**:
   - The total number of times model $m_{i}$ outperforms model $m_{k}$ across all datasets can be computed as:
     
     $$W_{i,k} = \sum_{j=1}^{N} \text{I}(P_{i,j} > P_{k,j})$$
     
   - Similarly, the number of ties and losses can be computed:

     $$T_{i,k} = \sum_{j=1}^{N} \text{I}(P_{i,j} = P_{k,j}),$$
     $$L_{i,k} = \sum_{j=1}^{N} \text{I}(P_{i,j} < P_{k,j})$$
     
   where $W_{i,k}$ is the number of datasets where model $m_{i}$ outperforms model $m_{k}$, $T_{i,k}$ is the number of ties, and $L_{i,k}$ is the number of losses.

### Example Matrix Interpretation

Given the matrix you provided:

|         | Model_1 | Model_2 | Model_3 | Model_4 |
|---------|---------|---------|---------|---------|
| **Model_1** |       14 |        9 |        5 |        6 |
| **Model_2** |        7 |       14 |        2 |        4 |
| **Model_3** |        9 |       12 |       14 |        9 |
| **Model_4** |        8 |       10 |        5 |       14 |

- **Interpretation**: 
  - The value in the cell at row "Model_1" and column "Model_2" is **9**. This means that Model_1 outperforms Model_2 on **9 datasets**.
  - Similarly, the value in the cell at row "Model_2" and column "Model_3" is **2**, indicating that Model_2 outperforms Model_3 on **2 datasets**.

### Significance in Machine Learning

In machine learning, paired comparisons help in:

1. **Model Selection**: By comparing models pairwise across datasets, you can identify which model is generally better or more consistent.
2. **Understanding Performance Variability**: Some models may perform exceptionally well on certain datasets but poorly on others. Paired comparisons allow for the identification of such patterns.
3. **Statistical Testing**: Paired comparisons are also the basis for statistical tests, such as the Wilcoxon signed-rank test or the Friedman test, which help to determine if the observed differences in performance are statistically significant.

In summary, paired comparisons provide a systematic way to evaluate and compare the performance of multiple models across different datasets, helping practitioners make informed decisions in model selection and evaluation.



## How to Use the Code

### 1. Package

First, install the package via github

```r
# install.packages("devtools")
library("devtools")
devtools::install_github("https://github.com/cissagatto/pairComparison")
library(pairComparison)
```

### 2. Computing


#### A. For one single csv file


```r

names.methods <- c("Model_1", "Model_2", "Model_3", "Model_4")

filename <- "~/pairComparison/data/accuracy.csv"

results = pair.comparison(filename = filename, 
                FolderOrigin = FolderData,
                FolderDestiny = FolderResults, 
                measure.name = "accuracy",
                names.methods = names.methods)                

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
