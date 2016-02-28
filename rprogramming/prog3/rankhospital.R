
rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  data[,23] <- as.numeric(data[,23])
  data[,11] <- as.numeric(data[,11])
  data[,17] <- as.numeric(data[,17])
  ## Check that state and outcome are valid
  if (!is.element(state, data$State))
  {
    stop("invalid state")
  }
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
  

  
  data_state <- data[data$State == state,]
  #prepare the data by sorting by value then hospital name
  data_sorted <- data_state[order(data_state[,table], data_state[,2]),]
  data_no_na<- data_sorted[!is.na(data_sorted[,table]),]
  
  
  if (num == "best")
  {
    num <- 1
  }
  else if (num == "worst")
  {
    num <- nrow(data_no_na)
  }
  
  
  data_no_na$Hospital.Name[num]
}