rankhospital = function(state, outcome_name, num="best") {
        candidates = outcome[which(outcome[,7] == state),]   #narrow down the list of candidates by state
        
        #Convert "best" and "worst" to proper their proper numeric index
        if (num == "best"){
                num = 1
        }
        if (num == "worst"){
                num = as.numeric(nrow(candidates))
        }
        
        #Error checking for the right state
        if (nrow(candidates) < 1) {
                stop ("invalid state")
        }
        if (nrow(candidates) < num){
                return(NA)
        }
        
        
        if (outcome_name == "heart attack") {
                
                # order() will create a vectore of sorted candidates[,i] values -- with ties broken alpahbetically!
                matched = candidates[order(candidates[,11]),][num,]   
        }
        
        else if (outcome_name == "heart failure") {
                matched = candidates[order(candidates[,17]),][num,]   
        }
        
        else if (outcome_name == "pneumonia") {
                matched = candidates[order(candidates[,23]),][num,]
        }
        
        else {
                stop("invalid outcome")
        }
        
        as.character(matched[,2])     # 2 is the column referencing the name
}

