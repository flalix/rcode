complete <- function(directory, id) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  ret = c()
  
  for (pos in 1:length(id)) {
    i <- id[pos]
    filename <- paste (directory, '/', formatC(i, width=3, flag="0"), '.csv', sep = "")
    data = read.csv(filename, sep=',', header = TRUE)
    
    good <- complete.cases(data)
    y <- data[good, ][, ]
    
    ret <- rbind(ret, c(i, nrow(y)) )
  }
  
  colnames(ret) <- c("id","nobs")
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  data.frame(ret)
}