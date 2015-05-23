## Put comments here that give an overall description of what your
## functions do
## In the first function we create a list of functions which are used to work with cached matrix in different environment. 
## In the second function we operate created object in the manner where first of all we try to find value in environment 
## and after, if we do not find, we calculate and store value in environment.


## Write a short comment describing this function
## Here we describe functions to work with cached object

makeCacheMatrix <- function(x = matrix()) {
  mInverse <- NULL
  set <- function(y) {
    x <<- y
    mInverse <<- NULL
  }
  get <- function() x
  setMInverse <- function(m) mInverse <<- m
  getmInverse <- function() mInverse
  list(set = set, get = get,
       setMInverse = setMInverse,
       getmInverse = getmInverse)
}


## Write a short comment describing this function
## We use this function to find the computing value before calculation.

cacheSolve <- function(x, ...) {
  mInverse <- x$getmInverse()
  if(!is.null(mInverse)) {
    message("getting cached data")
    return(mInverse)
  }
  data <- x$get()
  mInverse <- solve(data)
  x$setMInverse(mInverse)
  mInverse
}
