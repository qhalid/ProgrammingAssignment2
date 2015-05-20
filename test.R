makeRandomPlus <- function(n) {
  nn <- n * n
  matrix(runif(nn, 0, 1), n, n) + diag(n)
}

test1.x <- makeRandomPlus(6)
test1.i <- solve(test1.x)

test1.c <- makeCacheMatrix(test1.x)
test1.s <- cacheSolve(test1.c)

