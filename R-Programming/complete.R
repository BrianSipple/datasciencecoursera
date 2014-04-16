complete = function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        complete_cases = data.frame(id = numeric(0), nobs = numeric(0))   #initialize empty data frame
        
        for (i in id){
                filename = paste(directory, "/", list.files(directory)[i], sep="")
                df = read.table(filename, header=T, sep=",")
                complete = 0
                for (i in 1:nrow(df)){
                        complete_status = TRUE
                        entry = df[i,]   #Read each row into an entry vector, then check that vector for null values
                        for (i in 1:ncol(entry)){
                                if (is.na(entry[i])){
                                        complete_status = FALSE
                                }
                        }
                        if (complete_status == TRUE){
                                complete = complete + 1  # if we made it though, mark a complete entry           
                        }
                }
        complete_cases[nrow(complete_cases)+1,] <- c(id=as.numeric(i), nobs = complete)
        }
        
        complete_cases
}