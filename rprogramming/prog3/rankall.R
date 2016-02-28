rankall <- function(outcome, num = "best") {
  ## Read outcome data
  
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  data[,23] <- as.numeric(data[,23])
  data[,11] <- as.numeric(data[,11])
  data[,17] <- as.numeric(data[,17])
  ## Check that state and outcome are valid

  if (outcome == "pneumonia")
  {
    table <- 23
  }
  else if (outcome == "heart attack")
  {
    table <- 11
  }
  else if (outcome == "heart failure")
  {
    table <- 17
  }
  else
  {
    stop("invalid outcome")
  }
  
  
  myfunc <- function(vec, n){
    if (n=="best")
    {
      n = 1
    }
    else if (n=="worst")
    {
      n = length(vec)
    }
    vec[n]
  } 
  
  #prepare the data by sorting by value then hospital name
  data_sorted <- data[order(data[,7], data[,table], data[,2]),]
  data_no_na<- data_sorted[!is.na(data_sorted[,table]),]
  
  t <- aggregate(data_no_na, by=list(data_no_na$State), FUN= function(vec) myfunc(vec,num))
  
  res <- t[,c(3,1)]
  colnames(res) <- c("hospital", "state")
  rownames(res) <- res[,2]
  res
}