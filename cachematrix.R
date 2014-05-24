## This function will make a Matrix cache to save costly recomputation

## First makeCacheMatrix will make the matrix object m
## Function sets the value of the inverse, and then gets the value of the inverse
## I used the mean example from class to add cashe and superassignment operator


makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) m <<-inverse
  getInverse <- function() m
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
 }


## The following cacheSolve code will compute and 
##return the inverse of matrix from makeCacheMatrix

 cacheSolve <- function(x, ...) {

##Get the Inverse from makeCacheMatrix
##If is null, return from cache the inverse matrix
   m <- x$getInverse()
   if(!is.null(m)) {
     message("getting cached data")
     return(m)
   }
   ##Otherwise calculate the inverse of matrix and setInverse in cache
   ## Return a matrix that is the inverse of 'x'
   data <- x$get()
   m <- inverse(data, ...)
   x$setInverse(m)
   m
 }