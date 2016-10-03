#The function makeCacheMatrix returns a list of functions
# It is used to store a martix and a cached value of the inverse of the 
# matrix. Following is the list of functions returned by the List 
# setMatrix      set the value of a matrix
# getMatrix      get the value of a matrix
# cacheInverse   Cache the value of the inverse of the matrix
# getInverse     get the cached value of inverse of the matrix
#
makeCacheMatrix <- function(x = matrix()) {
  
  cache_inverse <- NULL
  
  set <- function (y) {
    x <<- y
    cache_inverse <<- NULL
  }
  
  get <- function(){
    x
  }
  
  set_cache_inverse <- function(inverse) {
    cache_inverse <<- inverse
  }
  
  get_cache_inverse <- function(){
    cache_inverse
  }
  

  list(set = set, get = get, set_cache_inverse = set_cache_inverse, get_cache_inverse = get_cache_inverse)
}
  
    

cacheSolve <- function(x, ...) {
  
  cache <- x$get_cache_inverse()
  
  if (! is.null(cache)) {
    return(cache)
  }
  
  my_data <- x$get()
  cache <- solve(my_Data)
  x$set_cache_inverse(cache)
  
  cache
}