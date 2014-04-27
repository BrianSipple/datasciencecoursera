#Basic Warning
log(-1)

printMessage <- function(x) {
        if (x > 0)
                print("x is greater than zero")
        else
                print("x is less than or equal to zero")
        invisible(x)  #stops auto-printing, so we hide the return object from the console
}

printMessage(5)
printMessage(NA)

printMessage2 <- function(x) {
        if(is.na(x))
                print("x is a missing value!")
        if (x > 0)
                print("x is greater than zero")
        else
                print("x is less than or equal to zero")
        invisible(x)  #stops auto-printing, so we hide the return object from the console
}

x = log(-1)
printMessage2(x)

# Primary debugging tools:
# 
# traceback: prints out the function call stack after an error occurs; does nothing if there's no error
# 
# debug: flags a function for "debug" mode, which allows you to step through execution of a function one line at a time
# 
# browser: suspends the exection of a function wherever it is called and puts the function in debug mode
# 
# trace: allows you to insert debugging code into a function a specific places
# 
# recover: allows you to modify the error behavior so that you can browse the funciton call stack 

mean(google)
traceback()

lm(y ~ x)
traceback()

debug(lm)
lm(y~x)
n

options(error = recover)
read.csv("nosuchfile")
3


# DEBUGGING TOOLS ARE NOT A SUBSTITUTE FOR THINKING!!!


