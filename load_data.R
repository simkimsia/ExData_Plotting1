load_data <- function () {
  options(gsubfn.engine = "R")
  library(sqldf)
  query <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
  dataset <- read.csv2.sql("./household_power_consumption.txt", sql=query)
  return (dataset)
}
