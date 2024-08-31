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


### Simplified Formalization of Pairwise Model Comparison

The goal of this approach is to generate a matrix $M \times M$ where each element represents the total number of datasets in which a model $m_{i}$ outperforms another model $m_{j}. If we have 10 models, the result will be a $10 \times 10$ matrix, showing the pairwise comparisons between each model.

#### 1. Metrics Where Higher Values are Better (Best Value = 1)
For evaluation metrics where a higher value indicates better performance (e.g., accuracy, F1-score):

- **Comparison Rule**: If the value of $m_{i}$ is greater than $m_{j}$ on a specific dataset, then count that dataset as a win for $m_{1}$ (assign a score of 1). Otherwise, assign a score of 0.

Formally, for each pair $m_{i}, m_{j} across all datasets $D_{1}, D_{2}, \dots, D_{N}$:

```math
C_{i,j} = \sum_{k=1}^{N} \text{I}(P_{i,k} > P_{j,k})
```

Where \( \text{I} \) is the indicator function:

```math
\text{I}(P_{i,k} > P_{j,k}) =
\begin{cases}
1 & \text{if } P_{i,k} > P_{j,k} \\
0 & \text{otherwise}
\end{cases}
```

Here, $C_{i,j}$ represents the total number of datasets where model $m_{i}$ outperforms model $m_{j}$.

#### 2. Metrics Where Lower Values are Better (Best Value = 0)
For evaluation metrics where a lower value indicates better performance (e.g., error rate, Hamming loss):

- **Comparison Rule**: If the value of $m_{i}$ is less than $m_{j}$ on a specific dataset, then count that dataset as a win for $m_{i}$ (assign a score of 1). Otherwise, assign a score of 0.

Formally, for each pair $(m_{i},m_{j})$ across all datasets $D_{1}, D_{2}, \dots, D_{N}$:

```math
C_{i,j} = \sum_{k=1}^{N} \text{I}(P_{i,k} < P_{j,k})
```

Where \( \text{I} \) is the indicator function:

```math
\[
\text{I}(P_{i,k} < P_{j,k}) =
\begin{cases}
1 & \text{if } P_{i,k} < P_{j,k} \\
0 & \text{otherwise}
\end{cases}
\]
```

Here, \( C_{i,j} \) represents the total number of datasets where model \( m_i \) outperforms model \( m_j \) based on the metric where lower is better.

### Additional Comparisons
The code can also perform additional comparisons to calculate:

1. **\( m_1 \geq m_2 \)**: The number of datasets where \( m_1 \) is either better than or equal to \( m_2 \).
2. **\( m_1 \leq m_2 \)**: The number of datasets where \( m_1 \) is either worse than or equal to \( m_2 \).
3. **\( m_1 = m_2 \)**: The number of datasets where \( m_1 \) and \( m_2 \) have exactly the same performance.

These additional comparisons can be useful for other types of analysis, such as determining ties or dominance in a set of models.

### Final Matrix
The final output is a comparison matrix \( \mathbf{C} \) of size \( M \times M \), where each entry \( C_{i,j} \) contains the count of datasets in which model \( m_i \) was better than (or equal to) model \( m_j \) according to the specific metric being analyzed. 

This matrix serves as a comprehensive summary of the pairwise performance comparisons across all models and datasets, allowing for a detailed understanding of model performance in machine learning contexts.


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

- **`measure.name`**: A character string specifying the name of the measure being processed. This name will be used to organize the results (see `pc.mesures()`).

- **`names.methods`**: A character vector containing the names of the methods used as column names in the data. These names will be used for labeling the results.



#### Returns

The function does not return any value. It writes multiple CSV files with the comparison results to the specified folder. The results are stored in the following files:

- **`greater-or-equal-datasets.csv`**: Contains the number of datasets in which each method's performance value is greater than or equal to the other method.
- **`greater-datasets.csv`**: Contains the number of datasets in which each method's performance value is greater than the other method.
- **`less-or-equal-datasets.csv`**: Contains the number of datasets in which each method's performance value is less or equal than the other method.
- **`less-datasets.csv`**: Contains the number of datasets in which each method's performance value is less than the other method.
- **`equal-datasets.csv`**: Contains the number of datasets in which each method's performance value is equal to the other method.



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
