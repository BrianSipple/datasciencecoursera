#' Building a Model with Top Ten Features
#' 
#' This functions develops a prediction algorithm base on the top 10 features in X that are 
#' the most predictive of 'y'
#' 
#' @param x an [n x p] matrix of n observations an p predictors
#' @param y a vector of length n representing the response
#' @return a vector of coefficients from the final fitted model with the top 10 features
#' @author Brian Sipple
#' @details
#' 1) We'll fit a univariate regression model of the response on each of the predictors (one model for each predictor)
#' 2) Every predictor is going to have a p-value associated with the model we fit
#' 3) We'll sort those p-values from smallest to largest, taking the top 10. 
#' 4) Abstract a new dataset using only those predictors, and then fit a new model
#' 5) Fit a new model using y ~ the 10 new predictors
#' 6) Return the new model's coefficients
#' 
#' @seealso \code{lm}
#' @export
#' 
#' @importFrom stats lm

top10 <- function(x, y) {
        p <- ncol(x)
        if (p < 10) {
                stop("There need to be at least variables (predictors) in the dataset!")     # Not enough preditors in the dataset!
        }
        
        pvalues = numeric(p)
        
        for(i in seq_len(p)) {
                fit <- lm(y ~ x[, i])
                summ = summary(fit)
                pvalues[i] <- summ$coefficients[2, 4]  # location of the p-value in the summary matrix
        }
        
        ord <- order(pvalues)  # get sorted indicies... from smallest to larget
        ord < - ord[1:10]      # take just the top 10 indicies
        
        x10 = x[, ord]    # create a new dataset from the original one, using the top 10 predictors
        fit <- lm(y ~ x10)
        
        coef(fit)  # Extract and return the coefficients from the model
}

#' Prediction with Top Ten Features
#' 
#' This function takes a set of coeffifients produced by the \code{topten}
#' function and makes a prediction for each of the values provided in the
#' input 'X' matrix
#' 
#' @param X an [n x 10] matrix containing n new observaations and their 10 features
#' @param b a vector of coefficients obtained from the \code{topten} function
#' @return a numeric vector containing the predicted values
#' @export

predict10 <- function(X, b) {
        X = cbind(1, X)  # Add intercept to matrix
        
        # Matrix multiplication of new data and coefficients, 
        # ...and then drop the dimension so we only return a vector of predicted responses)
        drop(X %*% b)   
}



