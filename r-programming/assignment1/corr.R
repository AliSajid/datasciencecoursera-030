corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  old.wd <- getwd()
  files <- list.files(directory)
  corrs <- c()
  obs <- complete(directory)
  sel <- subset(obs, nobs > threshold)
  setwd(directory)
  
  for(i in sel$id) {
    dat <- read.csv(files[i])
    nitr <- dat$nitrate
    sulf <- dat$sulfate
    corrs <- c(corrs, cor(sulf, nitr, use = "pairwise.complete.obs"))
  }
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  setwd(old.wd)
  corrs
}