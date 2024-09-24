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
#
##############################################################################

FolderRoot = "~/pairComparison"
FolderScripts = "~/pairComparison/R"



#' Subtract Two Numbers
#'
#' This function subtracts the second numeric input from the first numeric 
#' input and returns the result.
#' It checks if the input values are numeric.
#'
#' @param x A numeric value. This is the number from which
#'  \code{y} will be subtracted.
#' @param y A numeric value. This is the number that will be 
#' subtracted from \code{x}.
#'
#' @return A numeric value. The result of \code{x} minus \code{y}. 
#' If either \code{x} or \code{y} 
#' is not numeric, the function returns an error message.
#'
#' @examples
#' subtraction(10, 5) # returns 5
#' subtraction(3, 7)  # returns -4
#' subtraction(4.5, 1.5) # returns 3
#' subtraction('a', 3) # returns an error message
#'
#' @export
subtraction <- function(x, y) {
  if (!is.numeric(x) | !is.numeric(y)) {
    stop("Both inputs must be numeric")
  }
  return(x - y)
}


#' Compare Two Numbers for Greater Than
#'
#' This function compares two numeric inputs and returns `TRUE` if the 
#' first number is greater than
#' the second number, and `FALSE` otherwise. It checks if the input values 
#' are numeric.
#'
#' @param x A numeric value. This is the first number to be compared.
#' @param y A numeric value. This is the second number to be compared.
#'
#' @return A logical value. Returns `TRUE` if \code{x} is greater than 
#' \code{y}, and `FALSE` otherwise.
#' If either \code{x} or \code{y} is not numeric, the function returns 
#' an error message.
#'
#' @examples
#' bigger(5, 3) # returns TRUE
#' bigger(2, 4) # returns FALSE
#' bigger(3, 3) # returns FALSE
#' bigger('a', 3) # returns an error message
#'
#' @export
bigger <- function(x, y) {
  if (!is.numeric(x) | !is.numeric(y)) {
    stop("Both inputs must be numeric")
  }
  return(x > y)
}



#' Compare Two Numbers for Equality
#'
#' This function compares two numeric inputs and returns `TRUE` if the 
#' first number is equal to
#' the second number, and `FALSE` otherwise. It checks if the input 
#' values are numeric.
#'
#' @param x A numeric value. This is the first number to be compared.
#' @param y A numeric value. This is the second number to be compared.
#'
#' @return A logical value. Returns `TRUE` if \code{x} is equal to 
#' \code{y}, and `FALSE` otherwise.
#' If either \code{x} or \code{y} is not numeric, the function returns 
#' an error message.
#'
#' @examples
#' equal(3, 3) # returns TRUE
#' equal(4, 5) # returns FALSE
#' equal(6, 6) # returns TRUE
#' equal('a', 3) # returns an error message
#'
#' @export
equal <- function(x, y) {
  if (!is.numeric(x) | !is.numeric(y)) {
    stop("Both inputs must be numeric")
  }
  return(x == y)
}


#' Compare Two Numbers for Less Than
#'
#' This function compares two numeric inputs and returns `TRUE` if the 
#' first number is less than
#' the second number, and `FALSE` otherwise. It checks if the input values 
#' are numeric.
#'
#' @param x A numeric value. This is the first number to be compared.
#' @param y A numeric value. This is the second number to be compared.
#'
#' @return A logical value. Returns `TRUE` if \code{x} is less than 
#' \code{y}, and `FALSE` otherwise.
#' If either \code{x} or \code{y} is not numeric, the function returns 
#' an error message.
#'
#' @examples
#' less(3, 5) # returns TRUE
#' less(4, 4) # returns FALSE
#' less(6, 2) # returns FALSE
#' less('a', 3) # returns an error message
#'
#' @export
less <- function(x, y) {
  if (!is.numeric(x) | !is.numeric(y)) {
    stop("Both inputs must be numeric")
  }
  return(x < y)
}


#' Compare Two Numbers for Greater or Equal
#'
#' This function takes two numeric inputs and returns `TRUE` if the first 
#' number is greater than
#' or equal to the second number, and `FALSE` otherwise. It checks if the 
#' input values are numeric.
#'
#' @param x A numeric value. This is the first number to be compared.
#' @param y A numeric value. This is the second number to be compared.
#'
#' @return A logical value. Returns `TRUE` if \code{x} is greater than or
#'  equal to \code{y}, and `FALSE` otherwise.
#' If either \code{x} or \code{y} is not numeric, the function returns an 
#' error message.
#'
#' @examples
#' biggerEqual(5, 3) # returns TRUE
#' biggerEqual(2, 4) # returns FALSE
#' biggerEqual(3, 3) # returns TRUE
#' biggerEqual('a', 3) # returns an error message
#'
#' @export
biggerEqual <- function(x, y) {
  if (!is.numeric(x) | !is.numeric(y)) {
    stop("Both inputs must be numeric")
  }
  return(x >= y)
}




#' Compare Two Numbers for Less Than or Equal To
#'
#' This function compares two numeric inputs and returns `TRUE` if the 
#' first number is less than
#' or equal to the second number, and `FALSE` otherwise. It checks if the 
#' input values are numeric.
#'
#' @param x A numeric value. This is the first number to be compared.
#' @param y A numeric value. This is the second number to be compared.
#'
#' @return A logical value. Returns `TRUE` if \code{x} is less than or
#'  equal to \code{y}, and `FALSE` otherwise.
#' If either \code{x} or \code{y} is not numeric, the function returns 
#' an error message.
#'
#' @examples
#' lessEqual(3, 5) # returns TRUE
#' lessEqual(4, 4) # returns TRUE
#' lessEqual(6, 2) # returns FALSE
#' lessEqual('a', 3) # returns an error message
#'
#' @export
lessEqual <- function(x, y) {
  if (!is.numeric(x) | !is.numeric(y)) {
    stop("Both inputs must be numeric")
  }
  return(x <= y)
}





#' Count Elements Greater Than a Value
#'
#' This function counts the number of elements in \code{x} that are 
#' greater than the specified 
#' value \code{y}. It performs an element-wise comparison between
#'  \code{x} and \code{y} and returns 
#' the count of elements that satisfy the condition.
#'
#' @param x A numeric vector. The vector of values to be compared.
#' @param y A numeric value. The threshold value for comparison.
#'
#' @return An integer representing the number of elements in \code{x}
#'  that are greater than \code{y}.
#' 
#' @examples
#' add.bigger(c(1, 2, 3, 4), 2)  # Returns 2 (3, 4 are > 2)
#' add.bigger(c(10, 5, 3), 4)   # Returns 2 (10, 5 are > 4)
#' add.bigger(c(1, 2, 3), 3)    # Returns 0 (no elements are > 3)
#'
#' @export
add.bigger <- function(x, y) {
  if (!is.numeric(x) | !is.numeric(y)) {
    stop("Both x and y must be numeric.")
  }
  return(sum(x > y))
}


#' Count Elements Less Than a Value
#'
#' This function counts the number of elements in \code{x} that are less 
#' than the specified 
#' value \code{y}. It performs an element-wise comparison between 
#' \code{x} and \code{y} and returns 
#' the count of elements that satisfy the condition.
#'
#' @param x A numeric vector. The vector of values to be compared.
#' @param y A numeric value. The threshold value for comparison.
#'
#' @return An integer representing the number of elements in 
#' \code{x} that are less than \code{y}.
#' 
#' @examples
#' add.less(c(1, 2, 3, 4), 3)  # Returns 2 (1, 2 are < 3)
#' add.less(c(10, 5, 3), 6)   # Returns 2 (5, 3 are < 6)
#' add.less(c(1, 2, 3), 1)    # Returns 0 (no elements are < 1)
#'
#' @export
add.less <- function(x, y) {
  if (!is.numeric(x) | !is.numeric(y)) {
    stop("Both x and y must be numeric.")
  }
  return(sum(x < y))
}


#' Count Elements Equal to a Value
#'
#' This function counts the number of elements in \code{x} that are 
#' equal to the specified
#' value \code{y}. It performs an element-wise comparison between 
#' \code{x} and \code{y} and returns
#' the total count of elements that satisfy the condition.
#'
#' @param x A numeric vector. The vector of values to be compared.
#' @param y A numeric value. The value to compare the elements of 
#' \code{x} against.
#'
#' @return An integer representing the number of elements in \code{x} 
#' that are equal to \code{y}.
#' 
#' @examples
#' add.equal(c(1, 2, 3, 4), 3)  # Returns 1 (one element is equal to 3)
#' add.equal(c(10, 5, 3, 5), 5) # Returns 2 (two elements are equal to 5)
#' add.equal(c(1, 2, 3), 4)     # Returns 0 (no elements are equal to 4)
#'
#' @export
add.equal <- function(x, y) {
  if (!is.numeric(x) | !is.numeric(y)) {
    stop("Both x and y must be numeric.")
  }
  return(sum(x == y))
}




#' Count Values Greater Than or Equal to a Threshold
#'
#' This function counts the number of elements in \code{x} that are greater 
#' than or equal to the 
#' value \code{y}. It compares each element of \code{x} with \code{y} and 
#' returns the count of those 
#' that meet the condition.
#'
#' @param x A numeric vector. The elements of this vector are 
#' compared to \code{y}.
#' @param y A numeric value. The threshold value against which the 
#' elements of \code{x} are compared.
#'
#' @return An integer value. The count of elements in \code{x} that 
#' are greater than or equal to \code{y}.
#' 
#' @examples
#' add.biggerEqual(c(1, 2, 3, 4), 2)  # returns 3 (2, 3, 4 are >= 2)
#' add.biggerEqual(c(10, 5, 3), 6)   # returns 1 (10 is >= 6)
#' add.biggerEqual(c(1, 2, 3), 5)    # returns 0 (no elements are >= 5)
#'
#' @export
add.biggerEqual <- function(x, y) {
  if (!is.numeric(x) | !is.numeric(y)) {
    stop("Both inputs must be numeric")
  }
  return(sum(x >= y))
}



#' Count Elements Less Than or Equal to a Value
#'
#' This function counts the number of elements in \code{x} that are 
#' less than or equal to 
#' the specified value \code{y}. It performs element-wise comparison 
#' between \code{x} and \code{y} 
#' and returns the count of elements that satisfy the condition.
#'
#' @param x A numeric vector. The vector of values to be compared.
#' @param y A numeric value. The threshold value for comparison.
#'
#' @return An integer representing the number of elements in \code{x} 
#' that are less than or equal 
#' to \code{y}.
#' 
#' @examples
#' add.lessEqual(c(1, 2, 3, 4), 3)  # Returns 3 (1, 2, 3 are <= 3)
#' add.lessEqual(c(10, 5, 3), 6)   # Returns 2 (5, 3 are <= 6)
#' add.lessEqual(c(1, 2, 3), 0)    # Returns 0 (no elements are <= 0)
#'
#' @export
add.lessEqual <- function(x, y) {
  if (!is.numeric(x) | !is.numeric(y)) {
    stop("Both x and y must be numeric.")
  }
  return(sum(x <= y))
}




#' Create a Matrix with Specified Dimensions and Names
#'
#' This function constructs a matrix with the specified number
#'  of rows and columns, and assigns
#' the provided column and row names. The matrix is initialized with zeros.
#'
#' @param names.columns A character vector of column names.
#' @param names.rows A character vector of row names.
#' @param num.rows An integer specifying the number of rows in the matrix.
#' @param num.columns An integer specifying the number of columns
#'  in the matrix.
#'
#' @return A matrix with dimensions \code{num.rows} by 
#' \code{num.columns}, with the specified
#' column and row names, and initialized with zeros.
#'
#' @examples
#' colnames <- c("A", "B", "C")
#' rownames <- c("Row1", "Row2")
#' mat <- matrix.columns.rows(names.columns = colnames, 
#' names.rows = rownames, num.rows = 2, num.columns = 3)
#' print(mat)
#'
#' @export
matrix.columns.rows <- function(names.columns, names.rows, 
                                num.rows, num.columns) {
  # Validate inputs
  if (length(names.columns) != num.columns) {
    stop("Length of names.columns must match num.columns.")
  }
  if (length(names.rows) != num.rows) {
    stop("Length of names.rows must match num.rows.")
  }
  
  # Create the matrix and assign row and column names
  matrix <- matrix(0, nrow = num.rows, ncol = num.columns)
  colnames(matrix) <- names.columns
  rownames(matrix) <- names.rows
  
  return(matrix)
}




#' Create a Square Matrix with Specified Size and Names
#'
#' This function constructs a square matrix with the specified number 
#' of columns and assigns
#' the provided column names as both row and column names. The matrix is 
#' initialized with zeros.
#'
#' @param names.columns A character vector of column names. This vector 
#' will also be used for row names.
#' @param num.columns An integer specifying the number of columns (and rows) 
#' in the matrix.
#'
#' @return A square matrix with dimensions \code{num.columns} 
#' by \code{num.columns}, with the specified
#' column and row names, and initialized with zeros.
#'
#' @examples
#' colnames <- c("A", "B", "C")
#' mat <- matrix.columns(names.columns = colnames, num.columns = 3)
#' print(mat)
#'
#' @export
matrix.columns <- function(names.columns, num.columns) {
  # Validate input
  if (length(names.columns) != num.columns) {
    stop("Length of names.columns must match num.columns.")
  }
  
  # Create the square matrix and assign row and column names
  matrix <- matrix(0, nrow = num.columns, ncol = num.columns)
  colnames(matrix) <- names.columns
  rownames(matrix) <- names.columns
  
  return(matrix)
}



#' Create a Square Matrix with Specified Size and Names
#'
#' This function constructs a square matrix with the specified number of 
#' rows and assigns
#' the provided row names as both row and column names. The matrix is 
#' initialized with zeros.
#'
#' @param names.rows A character vector of row names. This vector will
#'  also be used for column names.
#' @param num.rows An integer specifying the number of rows (and columns) 
#' in the matrix.
#'
#' @return A square matrix with dimensions \code{num.rows} by \code{num.rows}, 
#' with the specified
#' row and column names, and initialized with zeros.
#'
#' @examples
#' rownames <- c("X", "Y", "Z")
#' mat <- matrix.rows(names.rows = rownames, num.rows = 3)
#' print(mat)
#'
#' @export
matrix.rows <- function(names.rows, num.rows) {
  # Validate input
  if (length(names.rows) != num.rows) {
    stop("Length of names.rows must match num.rows.")
  }
  
  # Create the square matrix and assign row and column names
  matrix <- matrix(0, nrow = num.rows, ncol = num.rows)
  colnames(matrix) <- names.rows
  rownames(matrix) <- names.rows
  
  return(matrix)
}



#' Create a Matrix with Specified Row Names and Column Names
#'
#' This function constructs a matrix with the specified number of rows and columns, and
#' assigns the provided row names and column names. The matrix is initialized with zeros.
#'
#' @param names.rows A character vector of row names.
#' @param names.columns A character vector of column names.
#' @param num.rows An integer specifying the number of rows in the matrix.
#' @param num.columns An integer specifying the number of columns in the matrix.
#'
#' @return A matrix with dimensions \code{num.rows} by \code{num.columns}, with the specified
#' row names and column names, and initialized with zeros.
#'
#' @examples
#' rownames <- c("Row1", "Row2", "Row3")
#' colnames <- c("Col1", "Col2")
#' mat <- matrix.rows.columns(names.rows = rownames, names.columns = colnames, 
#'                            num.rows = 3, num.columns = 2)
#' print(mat)
#'
#' @export
matrix.rows.columns <- function(names.rows, names.columns, 
                                num.rows, num.columns) {
  # Validate input
  if (length(names.rows) != num.rows) {
    stop("Length of names.rows must match num.rows.")
  }
  
  if (length(names.columns) != num.columns) {
    stop("Length of names.columns must match num.columns.")
  }
  
  # Create the matrix and assign row and column names
  matrix <- matrix(0, nrow = num.rows, ncol = num.columns)
  colnames(matrix) <- names.columns
  rownames(matrix) <- names.rows
  
  return(matrix)
}




#' Compare Values Across DataFrame Rows
#'
#' This function compares values across rows of a dataframe using a 
#' specified function. 
#' It calculates a matrix of comparison results for each pair of columns, 
#' then aggregates
#' these results row-wise.
#'
#' @param num.rows An integer specifying the number of rows in the dataframe.
#' @param num.columns An integer specifying the number of columns in 
#' the dataframe.
#' @param names.columns A character vector of column names for the 
#' resulting matrix.
#' @param names.rows A character vector of row names for the resulting matrix.
#' @param data A dataframe containing the data to be compared.
#' @param FUN A function that takes two numeric vectors and returns 
#' a numeric vector 
#' with the comparison result.
#'
#' @return A dataframe with the same number of rows as the input dataframe 
#' and columns 
#' corresponding to the column names in `names.columns`. Each element 
#' represents the 
#' aggregated comparison result for each row across the columns of 
#' the dataframe.
#'
#' @examples
#' df <- data.frame(A = c(1, 2, 3), B = c(3, 2, 1))
#' compare.rows(num.rows = 3, num.columns = 2, names.columns = c("A", "B"), 
#'              names.rows = c("Row1", "Row2", "Row3"), data = df, 
#'              FUN = function(x, y) x - y)
#'
#' @export
compare.rows <- function(num.rows, num.columns, names.columns, names.rows, 
                         data, FUN) {
  
  # Validate inputs
  if (nrow(data) != num.rows || ncol(data) != num.columns) {
    stop("Dimensions of 'data' do not match 'num.rows' and 'num.columns'.")
  }
  
  # Initialize result matrix
  result_matrix <- matrix(0, nrow = num.rows, ncol = num.columns)
  colnames(result_matrix) <- names.columns
  rownames(result_matrix) <- names.rows
  
  # Perform comparisons and accumulate results
  for (i in seq_len(num.columns)) {
    comparison_matrix <- matrix(0, nrow = num.rows, ncol = num.columns)
    colnames(comparison_matrix) <- names.columns
    rownames(comparison_matrix) <- names.rows
    
    for (j in seq_len(num.columns)) {
      comparison_matrix[, j] <- FUN(data[, i], data[, j])
    }
    
    row_sums <- rowSums(comparison_matrix)
    result_matrix[, i] <- row_sums
  }
  
  # Convert result matrix to dataframe
  result_df <- data.frame(result_matrix)
  colnames(result_df) <- names.columns
  
  return(result_df)
}




#' Count Datasets Where One Method Performed Better Than Another
#'
#' This function evaluates a comparison function across all pairs of 
#' columns in a dataframe.
#' It calculates how many times each method performed better than each 
#' other method
#' based on the comparison results. It also computes the mean performance 
#' per dataset
#' and per method.
#'
#' @param num.rows An integer specifying the number of rows in the dataframe.
#' @param num.columns An integer specifying the number of columns in 
#' the dataframe.
#' @param names.columns A character vector of column names, representing 
#' different methods.
#' @param names.rows A character vector of row names, representing 
#' different methods.
#' @param data A dataframe containing the data to be compared.
#' @param FUN A function that takes two numeric vectors and returns a 
#' numeric vector 
#' with the comparison result.
#'
#' @return A list containing:
#' \item{matrix}{A matrix where each element represents the comparison 
#' result between methods.}
#' \item{mean.per.columns}{A dataframe with the mean comparison result 
#' per dataset (column-wise).}
#' \item{mean.per.rows}{A dataframe with the mean comparison result
#'  per method (row-wise).}
#'
#' @examples
#' df <- data.frame(Method1 = c(1, 2, 3), Method2 = c(2, 2, 1))
#' total.datasets.per.method(num.rows = 3, num.columns = 2, 
#'                            names.columns = c("Method1", "Method2"), 
#'                            names.rows = c("Method1", "Method2"), 
#'                            data = df, 
#'                            FUN = function(x, y) sum(x > y))
#'
#' @export
total.datasets.per.method <- function(num.rows, num.columns,
                                      names.columns, names.rows,
                                      data, FUN){
  retorno = list()


  # num.rows = nrow(data)
  # num.columns = ncol(data)
  # names.columns = my.methods
  # names.rows = my.methods
  # FUN = add.bigger

  matrix = matrix.columns(names.columns, num.columns)
  for(i in 1:num.columns){
    for(j in 1:num.columns){
      matrix[i,j] = FUN(data[,i], data[,j])
    }
  }

  # MÉDIA DAS COLUNAS É A MÉDIA POR DATASET
  mean.columns = data.frame(apply(matrix, 2, mean)-1)
  names(mean.columns) = "mean.columns"

  # MÉDIA DAS LINHAS É A MÉDIA POR MÉTODO
  mean.rows = data.frame(apply(matrix, 1, mean)-1)
  names(mean.rows) = "mean.rows"

  retorno$matrix = matrix
  retorno$mean.per.columns = mean.columns
  retorno$mean.per.rows = mean.rows
  return(retorno)
}




#' Compare Methods Based on Given Function Across Data
#'
#' This function compares methods based on a provided comparison function. 
#' It creates a matrix
#' for each method, where each element represents the result of the 
#' comparison between methods
#' for each row of the data. It then aggregates these results into a final 
#' dataframe.
#'
#' @param measures A list or vector of measures for comparison (not used 
#' in the function body).
#' @param num.rows An integer specifying the number of rows in the dataframe.
#' @param num.columns An integer specifying the number of columns 
#' in the dataframe.
#' @param names.columns A character vector of column names, representing 
#' different methods.
#' @param names.rows A character vector of row names, representing 
#' different methods.
#' @param names.all A character vector of all method names to be compared.
#' @param data A dataframe containing the data to be compared.
#' @param FUN A function that takes two numeric vectors and returns 
#' a numeric vector 
#' with the comparison result.
#'
#' @return A dataframe where each column represents the comparison 
#' results between methods.
#'
#' @examples
#' df <- data.frame(Method1 = c(1, 2, 3), Method2 = c(2, 2, 1))
#' compare(measures = NULL, num.rows = 3, num.columns = 2, 
#'         names.columns = c("Method1", "Method2"), 
#'         names.rows = c("Method1", "Method2"), 
#'         names.all = c("Method1", "Method2"), 
#'         data = df, 
#'         FUN = function(x, y) x > y)
#'
#' @export
compare <- function(measures, num.rows, num.columns, names.columns, names.rows, 
                    names.all, data, FUN) {
  
  # Validate inputs
  if (nrow(data) != num.rows || ncol(data) != num.columns) {
    stop("Dimensions of 'data' do not match 'num.rows' and 'num.columns'.")
  }
  
  # Initialize results dataframe
  all_results <- data.frame(matrix(ncol = 0, nrow = num.rows))
  
  for (method_index in seq_along(names.all)) {
    cat("\n\nMethod ", names.all[method_index])
    
    # Create an empty matrix for current method
    matrix <- matrix(0, nrow = num.rows, ncol = num.columns)
    rownames(matrix) <- names.rows
    colnames(matrix) <- names.columns
    
    for (row_index in seq_len(num.rows)) {
      cat("\n\tRow ", row_index)
      
      comparison_results <- numeric(num.columns)
      column_names <- character(num.columns)
      
      for (col_index in seq_len(num.columns)) {
        cat("\n\t\tColumn ", col_index)
        comparison_results[col_index] <- FUN(data[row_index, 1], data[row_index, col_index])
        column_names[col_index] <- paste(names.columns[row_index], " X ", names.columns[col_index])
      }
      
      matrix[row_index, ] <- comparison_results
    }
    
    colnames(matrix) <- column_names
    all_results <- cbind(all_results, matrix)
  }
  
  return(all_results)
}




#' Extract Measure Names from File Paths
#'
#' This function extracts measure names from a vector of file paths by removing
#' the file extension from each file path. The measure names are assumed to be
#' the base names of the files without their extensions.
#'
#' @param file_paths A character vector of full paths to the files.
#' 
#' @return A character vector containing the names of the measures extracted 
#' from the file paths. Each name corresponds to the base name of a file 
#' without its extension.
#' 
#' @examples
#' # Example file paths
#' file_paths <- c(
#'   "C:/Users/Cissa/Documents/pairComparison/data/accuracy.csv",
#'   "C:/Users/Cissa/Documents/pairComparison/data/clp.csv"
#' )
#' 
#' # Extract measure names
#' measure_names <- extract_measure_names(file_paths)
#' print(measure_names)
#' # Output: "accuracy" "clp"
#'
#' @export
extract_measure_names <- function(file_paths) {
  # Extract the base file names including extension
  file_names <- basename(file_paths)
  
  # Remove the file extension from each file name
  measure_names <- tools::file_path_sans_ext(file_names)
  
  return(measure_names)
}








#' Calculate Performance of Methods Across Datasets
#'
#' This function calculates the performance of methods across multiple 
#' datasets and measures. It compares
#' methods to determine how many other methods each method performed better 
#' than, for each dataset.
#' Results are saved as CSV files in the specified folder.
#'
#' @param folder.names.csv A character vector of CSV filenames containing 
#' the performance data.
#' @param Folder.CSVs A character string specifying the path to the folder 
#' containing the CSV files.
#' @param FolderMethods A character string specifying the path to the folder 
#' where results will be saved.
#' @param my.methods A character vector of method names used as column 
#' names in the data.
#' @param nomes.measures A character vector of measure names to process.
#' @param res.mm A list containing performance measures.
#'
#' @return A list containing the average performance of methods across datasets.
#'
#' @examples
#' # Assuming CSV files are available and directories are set correctly
#' result <- total.performance.method(
#'   folder.names.csv = c("measure1.csv", "measure2.csv"),
#'   Folder.CSVs = "data/csvs",
#'   FolderMethods = "data/methods",
#'   my.methods = c("Method1", "Method2"),
#'   nomes.measures = c("Measure1", "Measure2"),
#'   res.mm = list(measures = data.frame(names = c("Measure1", "Measure2"), 
#'   values = c(1, 0)))
#' )
#'
#' @export
total.performance.method <- function(folder.names.csv,
                                     Folder.CSVs, 
                                     FolderMethods,
                                     my.methods,
                                     nomes.measures,
                                     res.mm) {
  
  # Initialize results
  retorno <- list()
  media.todos.r <- data.frame(datasets = character())
  
  measures <- data.frame(res.mm$measures)
  
  for (measure_name in nomes.measures) {
    
    cat("\nProcessing measure:", measure_name)
    
    FolderMeasure <- file.path(FolderMethods, measure_name)
    if (!dir.exists(FolderMeasure)) {
      dir.create(FolderMeasure, recursive = TRUE)
    }
    
    filename <- file.path(Folder.CSVs, 
                          folder.names.csv[which(nomes.measures == measure_name)])
    data <- read.csv(filename, stringsAsFactors = FALSE)
    
    data[is.na(data)] <- 0
    nomes.linhas <- data$dataset
    data <- data[,-1]
    colnames(data) <- my.methods
    
    num_rows <- nrow(data)
    num_cols <- ncol(data)
    
    final.row <- data.frame(datasets = character())
    
    selecionado <- filter(measures, names == measure_name)
    
    if (selecionado$values == 1) {
      comparison_func <- `>`
      suffix <- "-maior-total-method-per-dataset.csv"
    } else {
      comparison_func <- `<`
      suffix <- "-menor-total-method-per-dataset.csv"
    }
    
    for (j in 1:num_cols) {
      
      cat("\nComparing methods for dataset:", my.methods[j])
      
      res_matrix <- matrix(nrow = num_rows, ncol = num_cols)
      
      for (i in 1:num_cols) {
        res_matrix[,i] <- comparison_func(data[,j], data[,i])
      }
      
      write.csv(res_matrix, file.path(FolderMeasure, 
                                      paste0(measure_name, 
                                             "-colunas-comparadas.csv")))
      
      total_row <- data.frame(apply(res_matrix, 1, sum))
      names(total_row) <- my.methods[j]
      
      final.row <- cbind(final.row, total_row)
      
    }
    
    write.csv(final.row, file.path(FolderMeasure, paste0(measure_name, suffix)))
    
    final.row <- final.row[,-1]
    
    res_fin_row <- data.frame(apply(final.row, 1, mean))
    names(res_fin_row) <- measure_name
    
    media.todos.r <- cbind(media.todos.r, res_fin_row)
    
  }
  
  media.todos.r <- media.todos.r[,-1]
  media.todos.r <- data.frame(datasets = nomes.linhas, media.todos.r)
  
  write.csv(media.todos.r, file.path(FolderMethods, 
                                     paste0(measure_name, 
                                            "-average-method-per-dataset.csv")))
  
  retorno$all.average.row <- media.todos.r
  return(retorno)
}







#' Calculate and Compare Performance of Methods
#'
#' This function calculates how many times each method performed better or 
#' worse than others across datasets.
#' It generates CSV files containing comparisons and summaries of 
#' method performances.
#'
#' @param folder.names.csv A character vector of CSV filenames containing 
#' performance data.
#' @param Folder.CSVs A character string specifying the path to the folder 
#' containing the CSV files.
#' @param nomes A character vector of measure names.
#' @param FolderMethods A character string specifying the path to the 
#' folder where results will be saved.
#' @param my.methods A character vector of method names used as column 
#' names in the data.
#' @param res.mm A list containing performance measures.
#'
#' @return A list containing the average performance of methods 
#' across datasets.
#'
#' @examples
#' # Assuming CSV files are available and directories are set correctly
#' result <- total.performance.method.2(
#'   folder.names.csv = c("measure1.csv", "measure2.csv"),
#'   Folder.CSVs = "data/csvs",
#'   nomes = c("Measure1", "Measure2"),
#'   FolderMethods = "data/methods",
#'   my.methods = c("Method1", "Method2"),
#'   res.mm = list(measures = data.frame(names = c("Measure1", "Measure2"), 
#'   values = c(1, 0)))
#' )
#'
#' @export
total.performance.method.2 <- function(folder.names.csv,
                                       Folder.CSVs, 
                                       nomes,
                                       FolderMethods,
                                       my.methods, 
                                       res.mm) {
  
  # Initialize results
  retorno <- list()
  media.todos.r <- data.frame(datasets = character())
  
  measures <- data.frame(res.mm$measures)
  
  for (measure_name in nomes) {
    
    cat("\nProcessing measure:", measure_name)
    
    nomes.res <- RemoveCSV(folder.names.csv[which(nomes == measure_name)])
    
    FolderMedida <- file.path(FolderMethods, nomes.res)
    if (!dir.exists(FolderMedida)) {
      dir.create(FolderMedida, recursive = TRUE)
    }
    
    nome <- file.path(Folder.CSVs, 
                      folder.names.csv[which(nomes == measure_name)])
    data <- read.csv(nome, stringsAsFactors = FALSE)
    
    nomes.linhas <- data$dataset
    data <- data[,-1]
    colnames(data) <- my.methods
    
    num_rows <- nrow(data)
    num_cols <- ncol(data)
    
    final.row <- data.frame(datasets = character())
    
    for (j in 1:num_cols) {
      
      cat("\nComparing methods for dataset:", my.methods[j])
      
      # Comparison for "MAIOR"
      res_matrix_maior <- matrix.columns.rows(my.methods, 
                                              nomes.linhas, num_rows, num_cols)
      for (i in 1:num_cols) {
        res_matrix_maior[,i] <- data[,j] > data[,i]
      }
      
      write.csv(res_matrix_maior, file.path(FolderMedida, 
                                            paste0(nomes.res, 
                                                   "-maior-colunas-comparadas.csv")))
      
      total_row_maior <- data.frame(apply(res_matrix_maior, 1, sum))
      names(total_row_maior) <- my.methods[j]
      
      final.row <- cbind(final.row, total_row_maior)
      
      # Comparison for "MENOR"
      res_matrix_menor <- matrix.columns.rows(my.methods, nomes.linhas, 
                                              num_rows, num_cols)
      for (i in 1:num_cols) {
        res_matrix_menor[,i] <- data[,j] < data[,i]
      }
      
      write.csv(res_matrix_menor, file.path(FolderMedida, 
                                            paste0(nomes.res, 
                                                   "-menor-colunas-comparadas.csv")))
      
      total_row_menor <- data.frame(apply(res_matrix_menor, 1, sum))
      names(total_row_menor) <- my.methods[j]
      
      final.row <- cbind(final.row, total_row_menor)
      
    }
    
    write.csv2(final.row, file.path(FolderMedida, 
                                    paste0(nomes.res, 
                                           "-total-method-per-dataset.csv")))
    
    final.row <- final.row[,-1]
    res_fin_row <- data.frame(apply(final.row, 1, mean))
    names(res_fin_row) <- measure_name
    
    media.todos.r <- cbind(media.todos.r, res_fin_row)
    
  }
  
  media.todos.r <- media.todos.r[,-1]
  media.todos.r <- data.frame(datasets = nomes.linhas, media.todos.r)
  
  write.csv2(media.todos.r, file.path(FolderMethods, 
                                      paste0(nomes.res, 
                                             "-average-method-per-dataset.csv")))
  
  retorno$all.average.row <- media.todos.r
  return(retorno)
}

#' Compare Methods for a Single CSV File
#'
#' This function compares methods across a single CSV file by calculating
#' various comparison metrics for the provided dataset. The results are saved 
#' as CSV files in a specified folder and also returned as a list.
#'
#' @param filename A character string specifying the full path of the CSV file to process.
#' @param FolderOrigin A character string specifying the path to the folder containing the CSV file.
#' @param FolderDestiny A character string specifying the path to the folder where results will be saved.
#' @param measure.name A character string specifying the name of the measure being processed.
#' @param names.methods A character vector of method names used as column names in the data.
#'
#' @return A list containing the comparison results:
#' \itemize{
#'   \item \code{greater_or_equal} - Data frame of datasets where methods are greater than or equal.
#'   \item \code{greater} - Data frame of datasets where methods are strictly greater.
#'   \item \code{less_or_equal} - Data frame of datasets where methods are less than or equal.
#'   \item \code{less} - Data frame of datasets where methods are strictly less.
#'   \item \code{equal} - Data frame of datasets where methods are equal.
#' }
#'
#' @examples
#' # Assuming CSV files are available and directories are set correctly
#' results <- pair.comparison(
#'   filename = "data/accuracy.csv",
#'   FolderOrigin = "data",
#'   FolderDestiny = "results",
#'   measure.name = "accuracy",
#'   names.methods = c("Model_1", "Model_2", "Model_3", "Model_4")
#' )
#'
#' @export
pair.comparison <- function(filename,
                            FolderOrigin, 
                            FolderDestiny,
                            measure.name,
                            names.methods) {
  
  # Initialize dataframes to store results
  init_df <- function() {
    data.frame(matrix(ncol = 0, nrow = length(names.methods)))
  }
  
  bigE.per.col <- init_df()
  bigE.per.row <- init_df()
  
  big.per.col <- init_df()
  big.per.row <- init_df()
  
  lesE.per.col <- init_df()
  les.per.col <- init_df()
  
  lesE.per.row <- init_df()
  les.per.row <- init_df()
  
  eq.per.col <- init_df()
  eq.per.row <- init_df()
  
  # Process the single measure
  cat("\nProcessing file:", filename)
  
  # Create a folder for the measure
  FolderMeasure <- file.path(FolderDestiny, measure.name)
  if (!dir.exists(FolderMeasure)) {
    dir.create(FolderMeasure, recursive = TRUE)
  }
  
  data <- read.csv(filename, stringsAsFactors = FALSE)
  rownames(data) <- data$dataset
  data <- data[,-1]
  data[is.na(data)] <- 0
  colnames(data) <- names.methods
  num_rows <- nrow(data)
  num_cols <- ncol(data)
  
  # Compute comparison metrics
  res_bigger <- total.datasets.per.method(num_rows, num_cols, names.methods, 
                                          rownames(data), data, add.bigger)
  res_biggerE <- total.datasets.per.method(num_rows, num_cols, names.methods, 
                                           rownames(data), data, add.biggerEqual)
  res_less <- total.datasets.per.method(num_rows, num_cols, names.methods, 
                                        rownames(data), data, add.less)
  res_lessE <- total.datasets.per.method(num_rows, num_cols, names.methods, 
                                         rownames(data), data, add.lessEqual)
  res_equal <- total.datasets.per.method(num_rows, num_cols, names.methods, 
                                         rownames(data), data, add.equal)
  
  # Create dataframes for results
  save_results <- function(data, filename) {
    write.csv(data, file.path(FolderMeasure, filename))
  }
  
  save_results(data.frame(res_biggerE$matrix), 
               paste0("greater-or-equal-datasets.csv"))
  save_results(data.frame(res_bigger$matrix), 
               paste0("greater-datasets.csv"))
  save_results(data.frame(res_lessE$matrix), 
               paste0("less-or-equal-datasets.csv"))
  save_results(data.frame(res_less$matrix), 
               paste0("less-datasets.csv"))
  save_results(data.frame(res_equal$matrix),
               paste0("equal-datasets.csv"))
  
  # Aggregate metrics by columns and rows
  bigE.per.col <- cbind(bigE.per.col, res_biggerE$mean.per.columns)
  big.per.col <- cbind(big.per.col, res_bigger$mean.per.columns)
  bigE.per.row <- cbind(bigE.per.row, res_biggerE$mean.per.rows)
  big.per.row <- cbind(big.per.row, res_bigger$mean.per.rows)
  
  lesE.per.col <- cbind(lesE.per.col, res_lessE$mean.per.columns)
  les.per.col <- cbind(les.per.col, res_less$mean.per.columns)
  lesE.per.row <- cbind(lesE.per.row, res_lessE$mean.per.rows)
  les.per.row <- cbind(les.per.row, res_less$mean.per.rows)
  
  eq.per.col <- cbind(eq.per.col, res_equal$mean.per.columns)
  eq.per.row <- cbind(eq.per.row, res_equal$mean.per.rows)
  
  # Finalize the results and save
  finalize_results <- function(df, filename) {
    if (ncol(df) > 0) {
      write.csv(df, file.path(FolderMeasure, filename))
    }
  }
  
  finalize_results(big.per.col, "average-big-per-col.csv")
  finalize_results(bigE.per.col, "average-big-equal-per-col.csv")
  
  finalize_results(big.per.row, "average-big-per-row.csv")
  finalize_results(bigE.per.row, "average-big-equal-per-row.csv")
  
  finalize_results(les.per.col, "average-less-per-col.csv")
  finalize_results(lesE.per.col, "average-less-equal-per-col.csv")
  
  finalize_results(les.per.row, "average-less-per-row.csv")
  finalize_results(lesE.per.row, "average-less-equal-per-row.csv")
  
  finalize_results(eq.per.col, "average-equal-per-col.csv")
  finalize_results(eq.per.row, "average-equal-per-row.csv")
  
  # Return the results as a list
  results <- list(
    greater_or_equal = data.frame(res_biggerE$matrix),
    greater = data.frame(res_bigger$matrix),
    less_or_equal = data.frame(res_lessE$matrix),
    less = data.frame(res_less$matrix),
    equal = data.frame(res_equal$matrix)
  )
  
  return(results)
}


#' Compare Methods Across Multiple Measures
#'
#' This function compares methods across multiple measures by 
#' calculating various comparison metrics 
#' for each dataset. The results are saved as CSV files in specified folders and also returned as a list.
#'
#' @param names.csvs A character vector of CSV filenames (not used in the 
#' function body).
#' @param FolderOrigin A character string specifying the path to the 
#' folder containing the original CSV files.
#' @param FolderDestiny A character string specifying the path to the 
#' folder where results will be saved.
#' @param names.methods A character vector of method names used as 
#' column names in the data.
#' @param names.measures A character vector of measure names to process.
#'
#' @return A list containing the comparison results for each measure:
#' \itemize{
#'   \item \code{results} - A list of lists, where each inner list contains:
#'     \item \code{greater_or_equal} - Data frame of datasets where methods are greater than or equal.
#'     \item \code{greater} - Data frame of datasets where methods are strictly greater.
#'     \item \code{less_or_equal} - Data frame of datasets where methods are less than or equal.
#'     \item \code{less} - Data frame of datasets where methods are strictly less.
#'     \item \code{equal} - Data frame of datasets where methods are equal.
#' }
#'
#' @examples
#' # Assuming CSV files are available and directories are set correctly
#' results <- pair.comparison.all.measures(
#'   names.csvs = c("measure1", "measure2"),
#'   FolderOrigin = "data/origin",
#'   FolderDestiny = "data/destiny",
#'   names.methods = c("Method1", "Method2"),
#'   names.measures = c("Measure1", "Measure2")
#' )
#'
#' @export
pair.comparison.all.measures <- function(names.csvs,
                                         FolderOrigin, 
                                         FolderDestiny,
                                         names.methods, 
                                         names.measures) {
  
  # Initialize dataframes to store aggregate results
  init_df <- function() {
    data.frame(matrix(ncol = 0, nrow = length(names.methods)))
  }
  
  bigE.per.col <- init_df()
  bigE.per.row <- init_df()
  
  big.per.col <- init_df()
  big.per.row <- init_df()
  
  lesE.per.col <- init_df()
  les.per.col <- init_df()
  
  lesE.per.row <- init_df()
  les.per.row <- init_df()
  
  eq.per.col <- init_df()
  eq.per.row <- init_df()
  
  # Initialize a list to store results for each measure
  all_results <- list()
  
  for (measure in names.measures) {
    
    cat("\nProcessing measure:", measure)
    
    FolderMeasure <- file.path(FolderDestiny, measure)
    if (!dir.exists(FolderMeasure)) {
      dir.create(FolderMeasure, recursive = TRUE)
    }
    
    filename <- file.path(FolderOrigin, paste0(measure, ".csv"))
    data <- read.csv(filename, stringsAsFactors = FALSE)
    rownames(data) <- data$dataset
    data <- data[,-1]
    data[is.na(data)] <- 0
    colnames(data) <- names.methods
    num_rows <- nrow(data)
    num_cols <- ncol(data)
    
    # Compute comparison metrics
    res_bigger <- total.datasets.per.method(num_rows, num_cols, names.methods, 
                                            rownames(data), data, add.bigger)
    res_biggerE <- total.datasets.per.method(num_rows, num_cols, names.methods, 
                                             rownames(data), data, add.biggerEqual)
    res_less <- total.datasets.per.method(num_rows, num_cols, names.methods, 
                                          rownames(data), data, add.less)
    res_lessE <- total.datasets.per.method(num_rows, num_cols, names.methods, 
                                           rownames(data), data, add.lessEqual)
    res_equal <- total.datasets.per.method(num_rows, num_cols, names.methods, 
                                           rownames(data), data, add.equal)
    
    # Create dataframes for results
    save_results <- function(data, filename) {
      write.csv(data, file.path(FolderMeasure, filename))
    }
    
    save_results(data.frame(res_biggerE$matrix), 
                 paste0(measure, "-greater-or-equal-datasets.csv"))
    save_results(data.frame(res_bigger$matrix), 
                 paste0(measure, "-greater-datasets.csv"))
    save_results(data.frame(res_lessE$matrix), 
                 paste0(measure, "-less-or-equal-datasets.csv"))
    save_results(data.frame(res_less$matrix), 
                 paste0(measure, "-less-datasets.csv"))
    save_results(data.frame(res_equal$matrix),
                 paste0(measure, "-equal-datasets.csv"))
    
    # Aggregate metrics by columns and rows
    bigE.per.col <- cbind(bigE.per.col, res_biggerE$mean.per.columns)
    big.per.col <- cbind(big.per.col, res_bigger$mean.per.columns)
    bigE.per.row <- cbind(bigE.per.row, res_biggerE$mean.per.rows)
    big.per.row <- cbind(big.per.row, res_bigger$mean.per.rows)
    
    lesE.per.col <- cbind(lesE.per.col, res_lessE$mean.per.columns)
    les.per.col <- cbind(les.per.col, res_less$mean.per.columns)
    lesE.per.row <- cbind(lesE.per.row, res_lessE$mean.per.rows)
    les.per.row <- cbind(les.per.row, res_less$mean.per.rows)
    
    eq.per.col <- cbind(eq.per.col, res_equal$mean.per.columns)
    eq.per.row <- cbind(eq.per.row, res_equal$mean.per.rows)
    
    # Store results for the current measure
    all_results[[measure]] <- list(
      greater_or_equal = data.frame(res_biggerE$matrix),
      greater = data.frame(res_bigger$matrix),
      less_or_equal = data.frame(res_lessE$matrix),
      less = data.frame(res_less$matrix),
      equal = data.frame(res_equal$matrix)
    )
  }
  
  # Finalize the results and save
  finalize_results <- function(df, filename) {
    if (ncol(df) > 0) {
      write.csv(df, file.path(FolderDestiny, filename))
    }
  }
  
  # finalize_results(big.per.col, "average-big-per-col.csv")
  # finalize_results(bigE.per.col, "average-big-equal-per-col.csv")
  # 
  # finalize_results(big.per.row, "average-big-per-row.csv")
  # finalize_results(bigE.per.row, "average-big-equal-per-row.csv")
  # 
  # finalize_results(les.per.col, "average-less-per-col.csv")
  # finalize_results(lesE.per.col, "average-less-equal-per-col.csv")
  # 
  # finalize_results(les.per.row, "average-less-per-row.csv")
  # finalize_results(lesE.per.row, "average-less-equal-per-row.csv")
  # 
  # finalize_results(eq.per.col, "average-equal-per-col.csv")
  # finalize_results(eq.per.row, "average-equal-per-row.csv")
  
  # Return the aggregated results
  return(all_results)
}



#' Plot Heatmap from Comparison Results
#'
#' This function generates a heatmap from a dataframe where the values indicate 
#' the number of datasets in which methods were compared. It utilizes ggplot2 for visualization.
#'
#' @param comparison_df A data frame containing the comparison results. The data frame should
#' be structured such that both rows and columns represent methods, with the values indicating 
#' the number of datasets in which one method was compared to another.
#' @param title A character string specifying the title of the heatmap.
#' @param desired_order A character vector specifying the desired order of methods for plotting.
#'
#' @return A ggplot object representing the heatmap.
#'
#' @examples
#' # Example data frame (replace with your actual data)
#' comparison_df <- data.frame(
#'   Model_1 = c(14, 9, 5, 6),
#'   Model_2 = c(7, 14, 2, 4),
#'   Model_3 = c(9, 12, 14, 9),
#'   Model_4 = c(8, 10, 5, 14),
#'   row.names = c("Model_1", "Model_2", "Model_3", "Model_4")
#' )
#'
#' # Plot heatmap
#' pc.plot.heatmap(comparison_df, title = "Comparison Heatmap", desired_order = c("Model_1", "Model_2", "Model_3", "Model_4"))
#'
#' @export
pc.plot.heatmap <- function(comparison_df, 
                            title = "Heatmap",
                            desired_order) {
  
  library(ggplot2)
  library(tidyr)
  
  # Ensure the dataframe is in the correct format
  comparison_df <- pivot_longer(comparison_df, 
                                cols = -Method1, 
                                names_to = "Method2", 
                                values_to = "Count")
  
  # Set the desired order of methods as factors
  comparison_df$Method1 <- factor(comparison_df$Method1, levels = desired_order)
  comparison_df$Method2 <- factor(comparison_df$Method2, levels = desired_order)
  
  # Create the heatmap
  heatmap_plot <- ggplot(comparison_df, aes(x = Method1, y = Method2, fill = Count)) +
    geom_tile() +
    scale_fill_gradient(low = "white", high = "purple") +
    geom_text(aes(label = Count), color = "black", size = 2) + 
    # Add numbers to each cell
    theme_minimal() +
    labs(title = title, x = "Method 1", y = "Method 2", fill = "Count") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  
  # Return the heatmap plot object
  heatmap_plot
}



#' Save a Heatmap Plot as a PDF File
#'
#' This function saves a given heatmap plot as a PDF file in the specified directory.
#'
#' @param heatmap_plot A ggplot2 object representing the heatmap plot to be saved.
#' @param file_path A character string specifying the directory where the PDF file will be saved.
#' @param file_name A character string specifying the name of the PDF file (without the extension).
#' @param width A numeric value specifying the width of the PDF file in inches (default is 10).
#' @param height A numeric value specifying the height of the PDF file in inches (default is 6).
#'
#' @return NULL. This function is called for its side effect of saving a PDF file.
#'
#' @examples
#' \dontrun{
#' # Example of saving a heatmap plot
#' heatmap_plot <- pc.plot.heatmap(comparison_df, title = "My Heatmap", order = desired_order)
#' save.heatmap.as.pdf(heatmap_plot, 
#'                     file_path = "C:/Users/Cissa/Documents/pairComparison/heatmaps", 
#'                     file_name = "heatmap_comparison")
#' }
#'
#' @export
save.heatmap.as.pdf <- function(heatmap_plot, 
                                file_path, 
                                file_name, 
                                width = width, 
                                height = height) {
  
  # Check if the directory exists; if not, create the directory
  dir.create(dirname(file_path), showWarnings = FALSE, recursive = TRUE)
  
  # Create the PDF file
  pdf(file = file.path(file_path, paste0(file_name, ".pdf")), 
      width = width, height = height)
  
  # Draw the plot
  print(heatmap_plot)
  
  # Close the graphic device
  dev.off()
  
  message("\n\nHeatmap saved as PDF at: ", 
          file.path(file_path, paste0(file_name, ".pdf")))
}





