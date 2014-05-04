rankall = function(outcome_name, num) {
        
        
        states = as.character(unique(outcome[,7]))  # makes a character vector containing all unique state terms
        states = sort(states)  #make sure our list is sorted alphabetically
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
                        df = rbind(df, tmp)     
           
                } else if (outcome_name == "heart failure") {
                        
                        # order() will create a vector of sorted candidates[,i] values -- with ties broken alpahbetically!
                        matched = candidates[order(candidates[,17]),][num,]
                        tmp = data.frame(hospital = as.character(matched[,2]), state = as.character(matched[,7]))
                        df = rbind(df, tmp)     

                        
                } else if (outcome_name == "pneumonia") {
                        
                        # order() will create a vector of sorted candidates[,i] values -- with ties broken alpahbetically!
                        matched = candidates[order(candidates[,23]),][num,]
                        tmp = data.frame(hospital = as.character(matched[,2]), state = as.character(matched[,7]))
                        df = rbind(df, tmp)     
                         
                } else {
                        stop("invalid outcome")
                }     
        }
        
        df
}
