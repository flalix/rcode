pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  ret = c()
  
  for (pos in 1:length(id)) {
    i <- id[pos]
    filename <- paste (directory, '/', formatC(i, width=3, flag="0"), '.csv', sep = "")
    data = read.csv(filename, sep=',', header = TRUE)
    pol <- data[[pollutant]]
    bad <- is.na(pol)
    pol <- data[[pollutant]][!bad]
    
    ret <- c(ret, pol)
  }

  mean(ret)
}


# pollutantmean("specdata", "sulfate", 1:10)
# 4.064

