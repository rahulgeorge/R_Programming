#Random useful
table(flags$landmass) #Provides the landmass information in flags database as a vector count

myfunction <- function() {
  x <- rnorm(100)
  mean(x)
}

second <- function(x) {
  x + rnorm(length(x))
}

x <- 1
#print(x)
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
#as.numeric(x) #Non-sensical coercion. Provides NA as value

#Lists
x <- list(1:9,c("a","b"),TRUE,1+4i)

#Matrices
m <- matrix(nrow = 2, ncol = 3)
dim(m) #Attribute - integer vector of length 2, row & column
attributes(m) #Gives attributes of m

m <- matrix(1:6, nrow = 2, ncol = 3) #First fills rows then columns
y <- matrix(rep(10,4),2,2) #Repeats the value "10" 4 times

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

#Names
x <- 1:3
names(x) <- c("foo","bar","norf")
names(x) #Provides the names of elements of x as a vector

x <- list(a=1:9, b=c("foo","bar","norf"), c=c(T,F)) #Naming list elements

m <- matrix(1:4,nrow=2,ncol=2)
dimnames(m) <- list(c("a","b"),c("c","d")) #First element of list is row names and second is col names

#Reading Tabular Data
#Minimum required is path. Check defaults to understand the function properly
data <- read.csv("lcos_details.csv") #Used for tabular data
data2 <- read.table("Test.txt") #Used to read simple text files
data3 <- read.table("lcos_details.csv",header=TRUE,sep=",",nrows=2) #read.table is universal. Reading CSV here

classes <- sapply(data3,class) #Getting classes of the data to pass to read.table
data4 <- read.table("lcos_details.csv",header=TRUE,sep=",",nrows=2,colClasses=classes)

#Textual Data Formats
  #dump() #writing data
  #dput() #writing data
  #source() #Reading data written using dump
  #dget() #Reading data written using dput

y <- data.frame(a=1,b="a")
dput(y, file = "y.R")
z <- dget("y.R")

x <- "foo"
y <- data.frame(a = 1, b = "a")
dump(c("x","y"), file = "data.R") #dump is able to write multiple R objects while dput can manage only one
rm(x, y) #command to remove x & y objects from memory
source("data.R")

#Connections: Interface to Outside World
con <- file("Test.txt", "r") #Connection to file Test.txt with read only condition. "w" for writing, "a" for appending
data <- read.csv(con)
close(con) #Above three lines is parallel to data <- read.csv("foo.txt")

con <- gzfile("Test.gz") #Opening connection to a GZip file
x <- readLines(con, 1) #Can read just required lines using the connection
close(con)

con <- url("https://www.mdrift.com/","r") #Creating connection to non file URL 
x <- readLines(con, 5)
close(con)

#Subsetting
# [ Single bracket operator always returns the same class as the original. Can be used to select more than one element.
# [[ is used to extract elements of a list or data frame. It can be used to extract only a single element and class of the returned object need not be a list or data frame
# $ is used to extract elements of a list or data frame by name

x <- c("a","b","c","c","d","a")
x[1] #Returns a, the first element
x[1:4] #creates a sequence of elements with first 4
x[x > "a"] #Logical operator returns all elements greater than a

u <- x > "a" #Creates a logical vector where the condition is true
x[u] #Returns all elements where the condition is true

#Subsetting Lists
x <- list(foo=1:4, bar=0.6, norf=c("a","b","c"))
x[1] #Returns the first element foo as a list itself
x[[1]] #Returns the first element as just a sequence
x$bar #Returns element with the name bar
x[["bar"]] #Same as above. Returns just the element bar
x["bar"] #Returns bar as a list.Property of single bracket
x[c(1,3)] #Extracting multiple elements. Need to use single bracket
x[[c(1,3)]] #For double brackets, this acts like a souble subsetting
x[[1]][[3]] #Double subsetting. Same as the statement above

name <- "foo"
x[[name]] #Double bracket can handle computed indices like name here. 
x$name #This wont work as there is no element name in x

#Subsetting Matrices
x <- matrix(1:6,2,3)
x[1,2] #Returns 1st row 2nd column value
x[1,] #Indices can be missing two. Will return all the values in 1st row
x[1,2,drop=FALSE] #Returns the cell as a matrix. Normal single bracket doesn't return a matrix. 
x[1,,drop=FALSE] 

#Partial Matching
x <- list(aardvark = 1:5)
x$a #Since only one element matches the partial a, it returns aardvark
x[["a"]] #Double brackects doesnt do partial matching by default
x[["a", exact = FALSE]] #Does partial matching

#Removing NA Values
x <- c(1,2,NA,3,4,5,NA,7)
bad <- is.na(x)
x[!bad]

x <- c(1,2,NA,4,NA,NA)
y <- c("a","b",NA,"d",NA,"f")
good <- complete.cases(x,y) #Returns only indices where both have non-missing values
x[good]
y[good]

#Managing missing values in DataFrames
data <- read.csv("lcos_details.csv")
good <- complete.cases(data)
data[good,] #removes rows with NA values
data[good,][1:3,] #removes rows with NA and returns first 3 good data

#Vectorized Operations
x <- 1:4
y <- 6:9
x + y #Add corresponding positions in each vector
x > 2 #Compares each element in x 2 and outputs
y == 8 
x * y
x / y

x <- matrix(1:4,2,2)
y <- matrix(rep(10,4),2,2)

x * y #element wise multiplication
x / y
x %*% y #True matrix multiplication

#Control Structures - If Else
x <- 1
if(x>3) {
  y <- 10
} else {
  y <- 0
}

y1 <- if(x<3) { #This is a valid statement in R
  10
} else {
  0
}

#For Loop
x <- c("a","b","c","d",1)

for (i in 1:4) {
  #print(x[i])
}

for (i in seq_along(x)) {
  #print(x[i])
}

for (letter in x) { #Letter is just a variable. Can be named anything
  #print(letter)
}

for (i in 1:4) y <- x[i]

x <- matrix(1:6,2,3)
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
   #print(x[i,j])
  }
}

#While Loop
count <- 0
while(count < 10) {
  #print(count)
  count <- count + 1
}

z <- 5
while (z >= 3 && z <= 10) { #Condition is always checked left to right
  #print(z)
  coin <- rbinom(1,1,0.5)
  #print(" Coin is") 
  #print(coin)
  if(coin == 1) { #Random walk using a coin toss. No known length of while loop
    z <- z+1
  } else {
    z <- z-1
  }
}

#Control Structures - Repeat,Next,Break
for(i in 1:100) {
  if(i <= 20) {
    next #Skips first 20 iteration
  }
  #Do something here
  #Return will quit the entire function and return a value. Detailed later.
}

#Dates and Times
z <- as.Date("1970-01-01")

x <- Sys.time() #Current system time. Default in POSIXct, number of seconds
p <- as.POSIXlt(x) #Storing in POSIXlt format
names(unclass(p)) #View items in POSIXlt format. Very useful info
p$sec

datestring <- c("January 10, 2012 10:40","December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M") #Function used to convert string to date format

x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
#x - y #Not possible dur to mixing formats
x <- as.POSIXlt(x)
x - y #Possible now
z <- strptime("9 Jan 2011 16:34:21", "%d %b %Y %H:%M:%S")
z <- Sys.time()
Z <- as.POSIXlt(z, tz= "GMT") #Convertimg time zones. 

#Swirl Notes Logical
ints <- sample(10)
which(ints > 5) #which() function takes a logical vector as an argument and returns the indices of the vector that are TRUE
any(ints <0) #any() function will return TRUE if one or more of the elements in the logical vector is TRUE
all(ints >0) #all() function will return TRUE if every element in the logical vector is TRUE

#Loop functions - lapply
x <- list(a = 1:5, b = rnorm(10))
lapply(x,mean) #Takes in a list and applyies a function to every element in the list. Return is always a list

x <- 1:4
lapply(x,runif) #runif generates 'n' random unifrom variables as per number in argument, x
lapply(x, runif, min = 0, max = 10) #min and max here is passed to runif function through ... 

x <- list(a = matrix(1:4,2,2), b = matrix(1:6,3,2))
lapply(x, function(arg) arg[,1]) #Anonymous function definition

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20,1), d = rnorm(100,5))
lapply(x,mean) #Returns a list as lapply always returns a list
sapply(x,mean) #sapply aims to simplify the result returned. In this case a plain vector is returned

#Loop functions - apply
x <- matrix(rnorm(200),20,10)
apply(x,2,mean) #Applies mean function on x. 2 here is called the margin here and selects dimension 2 to be preserved (Column in this case)
apply(x,1,sum) #margin 1 preserves the first dimension row in this case
x <- matrix(rnorm(200),20,10)
apply(x,1,quantile,probs = c(0.25,0.75)) #function to calculate the 25th percentile and 75the percentile. Probs is passed to quantile function and apply returns a 2by20 matrix to include all results

a <- array(rnorm(2*2*10),c(2,2,10)) #Array here is 3 dimensional. Like bunch of 2by2 matrixes stacked
apply(a,c(1,2),mean) #Preserves dimensions 1 & 2 and means over the third dimension
rowMeans(a, dims=2) #Same as above using rowMeans function and preserving 2 dimensions

  #Col/ Row sums and means : These are much faster operations.
rowSums #apply(x,1,sum)
rowMeans #apply(x,1,mean)
colSums #apply(x,2,sum)
colMeans #apply(x,2,mean)

#Loop functions - mapply
  #used to apply multiple variables, lists, to a single function using a single function. lapply & sapply will only take one argument for a function
list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
mapply(rep, 1:4, 4:1) #Achieves the same result as above.

#Loop functions - tapply
  #to apply a function over subsets of a vector. Need arguments vector & factors over which the function needs to apply
x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10) #Generate factor levels
tapply(x, f, mean)

#Loop functions - split
  #Split is not a loop function but splits a vector into different groups based on factor. Can apply mapply or sapply once the split is done instead of tapply

x <-  c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10)
split(x, f)
lapply(split(x,f), mean) #Similar to tapply here.

  #example with more complicated data set
library(datasets)
head(airquality)
s <- split(airquality, airquality$Month)
lapply(s,function(x) colMeans(x[,c("Ozone","Solar.R", "Wind")], na.rm = TRUE)) #List output
sapply(s,function(x) colMeans(x[,c("Ozone","Solar.R", "Wind")], na.rm = TRUE)) #Matrix output
  
  #Splitting on More than One Level
x <- rnorm(10)
f1 <- gl(2,5)
f2 <- gl(5,2)
interaction(f1,f2)
#str(split(x, list(f1,f2), drop = TRUE)) #Splits x into all combination levels. Uses lise(f1,f2) to avoid interaction function used earlier. drop = TRUE removes empty levels

#DEBUGGING TOOLS
#traceback() #Immediately calling this after an error occours shows where the error occoured
#debug(function)  #goes through the function step by step to find the error. You can debug another function within the function being debugged
#Browser, trace & recover are other things. Need to explore more





