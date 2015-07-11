complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  old.wd <- getwd()
  files <- list.files(directory)
  setwd(directory)
  nobs <- numeric()
  for(num in id) {
    dat <- read.csv(files[num])
    l <- dim(dat)[1]
    nas <- sum(is.na((dat$sulfate & dat$nitrate)))
    nobs <- c(nobs, l - nas)
  }
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  setwd(old.wd)
  data.frame(cbind(id, nobs))
}