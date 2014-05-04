if (!file.exists("/.data")) {dir.create("./data")}
hospital = read.csv("./data/hospital-data.csv")
outcome = read.csv("./data/outcome-of-care-measures.csv")

head(outcome)
ncol(outcome)
nrow(outcome)
names(outcome)

outcome[,11] <- as.numeric(outcome[,11])
outcome[,17] <- as.numeric(outcome[,17])
outcome[,23] <- as.numeric(outcome[,23])
hist(outcome[,11],
     xlab="30-day mortailty rate")

### Write a function called best that take two arguments: the 2-character abbreviated name of a state and an
#   outcome name. The function reads the outcome-of-care-measures.csv file and returns a character vector
#   with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specied outcome
#   in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can
#   be one of \heart attack", \heart failure", or \pneumonia". Hospitals that do not have data on a particular
#   outcome should be excluded from the set of hospitals when deciding the rankings


### Handling ties. If there is a tie for the best hospital for a given outcome, 
#   then the hospital names should be sorted in alphabetical order and the
#   first hospital in that set should be chosen (i.e. if hospitals \b", \c",
#   and \f" are tied for best, then hospital \b" should be returned).


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



### Reads the outcome-of-care-measures.csv file and returns a character 
### vector with the name of the hospital that has the ranking 
### specified by the num argument
rankHospital = function(state, outcome_name, num="best") {
        candidates = outcome[which(outcome[,7] == state),]   #narrow down the list of candidates by state
        
        #Convert "best" and "worst" to proper their proper numeric index
        if (num == "best"){
                num = 1
        }
        if (num == "worst"){
                num = nrow(candidates)
        }
        
        #Error checking for the right state
        if (nrow(candidates) < 1) {
                stop ("invalid state")
        }
        if (nrow(candidates) < num){
                stop("That number excceds the number of hospitals in the state!")
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
        
        matched[2]     # 2 is the column referencing the name
}



### Reads the outcome-of-care-measures.csv file and returns a 2-column data frame
### containing the hospital in each state that has the ranking specified in num

rankall = function(outcome_name, num) {
        
        
        states = as.character(unique(outcome[,7]))  # makes a character vector containing all unique state terms
        df = data.frame(hospital=character(), state=character())       #empty data frame that will eventually store our states and the sought-after hospital
        for (i in 1:length(states)) {                
                
                candidates = outcome[which(as.character(outcome[,7]) == states[i]),]
                
                #Convert "best" and "worst" to proper their proper numeric index
                if (num == "best"){
                        num = 1
                } else if (num == "worst"){
                        num = as.numeric(nrow(candidates))
                } else if (num > nrow(candidates)) {
                        next
                }
                
                if (outcome_name == "heart attack") {
                        
                        # order() will create a vector of sorted candidates[,i] values -- with ties broken alpahbetically!
                        matched = candidates[order(candidates[,11]),][num,]
                        tmp = data.frame(hospital = as.character(matched[,2]), state = as.character(matched[,7]))
                        # NA-check the frame before we bind it
                        if ( sum(is.na(tmp)) < 1){
                                df = rbind(df, tmp)     
                        }              
                } else if (outcome_name == "heart failure") {
                        
                        # order() will create a vector of sorted candidates[,i] values -- with ties broken alpahbetically!
                        matched = candidates[order(candidates[,17]),][num,]
                        tmp = data.frame(hospital = as.character(matched[,2]), state = as.character(matched[,7]))
                        # NA-check the frame before we bind it
                        if ( sum(is.na(tmp)) < 1){
                                df = rbind(df, tmp)     
                        } 
                        
                } else if (outcome_name == "pneumonia") {
                        
                        # order() will create a vector of sorted candidates[,i] values -- with ties broken alpahbetically!
                        matched = candidates[order(candidates[,23]),][num,]
                        tmp = data.frame(hospital = as.character(matched[,2]), state = as.character(matched[,7]))
                        # NA-check the frame before we bind it
                        if ( sum(is.na(tmp)) < 1){
                                df = rbind(df, tmp)     
                        } 
                } else {
                        stop("invalid outcome")
                }     
        }
        
        df
}

