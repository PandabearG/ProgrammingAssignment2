## The makeCacheMatrix function takes a matrix which we assume to be invertible,
## and caches this matrix, to be converted with the second function.

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL # s to hold value of the next nested function
    set <- fucntion(y){
        x <<- y # cache matrix x in y outside current environment
        s <<- NULL # cache values of s outside current environment
    }
    get <- function() x # get previously cached matrix x
    setSolve <- function(solve) s <<- solve # set inverse
    getSolve <- function() s # get inverse
    list(set = set, get = get, setSolve = setSolve, getSolve = getSolve)
}


## The cacheSolve function first checks if the inverse of the cached matrix 
## from the above function already exists. Then, it returns the inverse matrix
## when it does exist, and computes it if it doesn't.

cacheSolve <- function(x, ...) {
    s <- x$getSolve()
    if(!is.null(s)) { ## checks if the inverse matrix already exists
    message("getting cached data")
    return(s) ## return the solved (inverse) matrix s
  }
  matrix <- x$get() # get cached matrix
  s <- solve(matrix, ...) # compute solved
  x$setInverse(s) # cache solved
  s # return solved
}
