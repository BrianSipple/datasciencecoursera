best <- function(state, outcome_name = "heart attack") {
        
        candidates = outcome[which(outcome[,7] == state),]   #narrow down the list of candidates by state
        # Validate candidates
        if ((nrow(candidates)) < 1) {
                stop("invalid state")
        }
        
        
        if (outcome_name == "heart attack") {
                # Check for tie to see if we need to break the tie alphabetically 
                candidates = candidates[order(candidates[,11], partial=as.character(candidates[,2])),]
                best_hospital = as.character(candidates[1,2])
                
        } else if (outcome_name == "heart failure") {
                # Check for tie to see if we need to break the tie alphabetically 
                candidates = candidates[order(candidates[,17], partial=as.character(candidates[,2])),]
                best_hospital = as.character(candidates[1,2])
                
        } else if (outcome_name == "pneumonia") {
                # Check for tie to see if we need to break the tie alphabetically 
                candidates = candidates[order(candidates[,23], partial=as.character(candidates[,2])),]
                best_hospital = as.character(candidates[1,2])
                
        } else {
                stop("invalid outcome")
        }
        
best_hospital       
}
