directory = "/Users/BrianSipple/Development/R/datasciencecoursera/R-Programming/specdata/"


#if(file.exists(subDir)){
#        setwd(file.path(mainDir, subDir))
#} else {
#        dir.create(file.path(mainDir, subDir))
#        setwd(file.path(mainDir, subDir))
#}

#setwd("/Users/BrianSipple/Development/R/datasciencecoursera/R-Programming")
#unzip(fileDir)

pollutantmean = function(directory, pollutant, id=1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        vec = vector()

        for (i in id) {
                filename = paste(directory, list.files(directory)[i], sep="")
                df = read.table(filename, sep=",", header=T)
                pollutant_vec = df[,pollutant]
                vec = append(vec, pollutant_vec)
        }

        mean(vec, na.rm=TRUE)
}


complete <- function(directory, id = 1:332) {
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
                filename = paste(directory, list.files(directory)[i], sep="")
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


source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")






