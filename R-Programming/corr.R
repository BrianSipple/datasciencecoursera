corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        cor_vector = vector()
        
        
        for (i in 1:length(list.files(directory))){
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
                
                # if complete is greater than the threshold, conduct correlation tests
                if(complete >= threshold){
                        cor_vector = append(cor_vector, cor(df$sulfate, df$nitrate, use="na.or.complete"))
                }
        }
        cor_vector
}
