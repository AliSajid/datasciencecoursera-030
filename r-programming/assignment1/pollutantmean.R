pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  mean.data <- c()
  files <- list.files(directory)
  old.wd <- getwd()
  setwd(directory)
  for(num in id) {
    file.data <- read.csv(files[num])
    pollutant.vector <- file.data[[pollutant]]
    mean.data <- c(mean.data, pollutant.vector)
  }
  setwd(old.wd)
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  mean(mean.data, na.rm = TRUE)
}