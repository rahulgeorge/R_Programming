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










