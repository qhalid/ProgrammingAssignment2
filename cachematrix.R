################################################################################
##
##  This file provides an implementation for programming assignment #2.
##
################################################################################

##
##  This function stores a matrix along with a cached value that is assumed
##  dependant on this matrix, thus the cached value will be automatically
##  invalidated if the matrix is updated.
##
makeCacheMatrix <- function(x = matrix()) {
  # The cached value; NULL represents an invalid cache.
  c <- NULL
  
  get.x <- function() {
    #
    # Simply return the matrix.
    #
    x
  }
  
  set.x <- function(v) {
    #
    # Update the matrix, and invalidate the cache.
    #
    x <<- v
    c <<- NULL
  }
  
  has.c <- function() {
    #
    # Returns TRUE if the cache is valid.
    #
    !is.null(c)
  }
  
  get.c <- function() {
    #
    # Returns the value in the cache.
    #
    c
  }
  
  set.c <- function(v) {
    #
    # Update the cache with a new value.
    #
    c <<- v
  }
  
  #
  # Return an object that provides access to function environment.
  #
  list(get.matrix = get.x,
       set.matrix = set.x,
       has.cached = has.c,
       get.cached = get.c,
       set.cached = set.c)
}


##
##  This function provides the inverse matrix by either returning the
##  result from the cache, or solving the inverse and updating the
##  cache.
##
cacheSolve <- function(x, ...) {
  #
  # Check to see if the cache needs to be updated.
  #
  if (!x$has.cached()) {
    #
    # Update the cache with the appropriate value.
    #
    x$set.cached(solve(x$get.matrix()))
  }
  
  #
  # Return the cached value
  #
  x$get.cached()
}


