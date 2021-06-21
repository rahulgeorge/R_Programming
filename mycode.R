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

