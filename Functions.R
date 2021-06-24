add2 <- function(x,y) {
  x + y
}

above10 <- function(x) {
  use <- x > 10
  x[use]
}

above <- function(x,n = 10) { #Default value for n is 10 here
  use <- x >n
  x[use]
}

columnMean <- function(x, removeNA = TRUE) {
  nc <- ncol(x)
  means <- numeric(nc)
  for(i in 1:nc) {
    means[i] <- mean(x[,i], na.rm = removeNA) #Removing NA in data frame using default setting available in mean function
  }
  means
}

myplot <- function(x, y, type = 'l', ...) { # ... argument take all extra arguments required by the plot function inside without requiring the user to define and capture them
  plot(x,y,type = type, ...)
}

#Lexical Scoping

make.power <- function(n) {
  pow <- function(x) { #Return is a function again
    x^n
  }
  pow
}

cube <- make.power(3) #Sample setup in console
square <- make.power(2)
cube(3) #Utilises the returned function to return 27
square(3) #Returns 9

ls(environment(cube)) #Returns "n"   "pow"
get("n",environment(cube)) #Returns 3

y <- 10
f <- function(x) {
  y <- 2
  y^2 + g(x)
}
g <- function(x) {
  x*y
}
f(3) #Should return the value 34 as value of y for g(x) will be from global environment as per lexical scoping




