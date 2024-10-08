% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pair-comparison.R
\name{total.performance.method.2}
\alias{total.performance.method.2}
\title{Calculate and Compare Performance of Methods}
\usage{
total.performance.method.2(
  folder.names.csv,
  Folder.CSVs,
  nomes,
  FolderMethods,
  my.methods,
  res.mm
)
}
\arguments{
\item{folder.names.csv}{A character vector of CSV filenames containing 
performance data.}

\item{Folder.CSVs}{A character string specifying the path to the folder 
containing the CSV files.}

\item{nomes}{A character vector of measure names.}

\item{FolderMethods}{A character string specifying the path to the 
folder where results will be saved.}

\item{my.methods}{A character vector of method names used as column 
names in the data.}

\item{res.mm}{A list containing performance measures.}
}
\value{
A list containing the average performance of methods 
across datasets.
}
\description{
This function calculates how many times each method performed better or 
worse than others across datasets.
It generates CSV files containing comparisons and summaries of 
method performances.
}
\examples{
# Assuming CSV files are available and directories are set correctly
result <- total.performance.method.2(
  folder.names.csv = c("measure1.csv", "measure2.csv"),
  Folder.CSVs = "data/csvs",
  nomes = c("Measure1", "Measure2"),
  FolderMethods = "data/methods",
  my.methods = c("Method1", "Method2"),
  res.mm = list(measures = data.frame(names = c("Measure1", "Measure2"), 
  values = c(1, 0)))
)

}
