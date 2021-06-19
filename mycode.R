myfunction <- function() {
  x <- rnorm(100)
  mean(x)
}

second <- function(x) {
  x + rnorm(length(x))
}

x <- 1
print(x)
msg <- "hello" #Assignment Operator
x <- 1:20 #Range using column

#Objects have classes (Character,Numeric,Integer,Complex,Logical)
#Objects have attributes (Names,Dimnames,Dimensions,Class,Length,Other User Defined)

x <- c(0.5,0.6)
x <- c(TRUE, FALSE)
x <- c(T,F)
x <- c("a","b","c")
x <- 9:29
x <- c(1+0i,2+4i)

x <- vector("numeric",length = 10)

#Coersion of Object when mixing objects in R
y <- c(1.7,"a")
y <- c(F,2)
y <- c("a",TRUE)

#Forced Coersion
x <- 0:6
as.numeric(x)
as.logical(x)
as.character(x)

x <- c("a","b","c")
as.numeric(x) #Non-sensical coercion. Provides NA as value

#Lists
x <- list(1:9,c("a","b"),TRUE,1+4i)

#Matrices
m <- matrix(nrow = 2, ncol = 3)
dim(m) #Attribute - integer vector of length 2, row & column
attributes(m) #Gives attributes of m

m <- matrix(1:6, nrow = 2, ncol = 3) #First fills rows then columns

m <- 1:10
dim(m) <- c(2,5) #Alt way of creating a matrix

x <- 1:3
y <- 10:12

cbind(x,y) #Matrix with columns as x & y
rbind(x,y) #Matrix with rows as x & y

#Factors
x <- factor(c("yes", "no", "yes", "yes", "no")) #Printing x also provides the levels (unique items) in x
table(x) #Provides the frequency count of each level in x
unclass(x) #Brings the factor down to integer vector with a value for each level

x <- factor(c("yes", "no", "yes", "yes", "no"), levels = c("yes","no")) #Sets the levels explicitly rather than auto (alphabetically)

#Missing Values
#NaN is used for undefined mathematical operations while NA is used for pretty much everything else
x <- c(1,2,NA,NaN,5,6)
is.na(x) #Used to check if x is NA
is.nan(x) #Used to check if x is NaN

#Data Frames
x <- data.frame(foo=1:4,bar=c(T,T,F,T))
nrow(x) #provides number of rows in x
ncol(x) #provides number of cols in x





