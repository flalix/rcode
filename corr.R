corr <- function(directory, threshold=0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  files <- dir(directory)
  ret = c()
  
  for (pos in 1:length(files)) {
    filename <- paste (directory, '/', files[pos], sep = "")
    data = read.csv(filename, sep=',', header = TRUE)
    
    good <- complete.cases(data)
    y <- data[good, ][, ]
    
    if (nrow(y) > threshold) {
      correl <- cor(y$sulfate, y$nitrate)
      ret <- c(ret, correl )
    }
  }
  
  ret
}
