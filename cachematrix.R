## The makeCacheMatrix function takes a matrix which we assume to be invertible,
## and caches this matrix, to be converted with the second function.

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- fucntion(y){
        y <<- x
        s <<- NULL
    }
    get <- function() x
    setSolve <- function(solve) s <<- solve
    getSolve <- function() s
    list(set = set, get = get, setSolve = setSolve, getSolve = getSolve)
}


## The cacheSolve function first checks if the inverse of the cached matrix 
## from the above function already exists. Then, it returns the inverse matrix
## if it exists or calculates it if it doesn't.

cacheSolve <- function(x, ...) {
    s <- x$getSolve()
    if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  matrix <- x$get()
  s <- solve(matrix, ...)
  x$setInverse(s)
  s
}
