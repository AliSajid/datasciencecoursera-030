best <- function(state, outcome) {
  
  ## Load the outcomes data from the file.
  outcome.data <- read.csv("outcome-of-care-measures.csv")
  
  ## List of valid outcomes.
  
  outcomes.list <- c(11, 17, 23)
  names(outcomes.list) <- c("heart attack", "heart failure", "pneumonia")
  
  ## Checking to see if the state is valid.
  if(!(state %in% outcome.data$State)) {
    stop("invalid state")
  }
  
  ## Checking to see if the outcome is valid.
  if(!(outcome %in% names(outcomes.list))) {
    stop("invalid outcome")
  }
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  state.subset <- subset(outcome.data, outcome.data["State"] == state)
  index <- apply(state.subset,2,which.min)[[outcomes.list[outcome]]]
  name <- as.character(state.subset[index,2])
  name
}