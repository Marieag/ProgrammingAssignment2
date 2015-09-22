
## Programming assignment 2, R programming 2015.
 
## These functions create the inverse of an invertible matrix and caches it for future use. 

## First we write a function to create the matrix and its inverse.
## Here we 1) create the matrix, 2) call the matrix, 3) invert the matrix and 4) call the inverted. 

makeCacheMatrix <- function(x = matrix()) {	##first we define the function.
	inverted <- NULL					##We set an empty "inverted" in the function environment.
	setmatrix <-function(input) {

		x <<- input					##here we create a matrix based on an input. 
								##This is stored in setmatrix's parent environment.	
		inverted <<- NULL				##the inverted matrix is stored here as well. 
		}

	getmatrix <- function() x			##returns the value of the matrix 

	setinverse <- function(inverse) inverted <<- inverse 	##sets a global value of "inverse"
	
	getinverse <- function() inverted  		##returns the value of the inverted matrix

	list(setmatrix = setmatrix, getmatrix = getmatrix, setinverse = setinverse, getinverse = getinverse)
	## here we print a list of the four functions. 
}


## Now we have to check if there is already a cached matrix, or if we should create one.
## If there is in fact a stored inverted matrix, we will retrieve that along with a message.

cacheSolve <- function(x, ...) {		##First we again define the function. 
      inverted <- x$getinverse()		## then we retrieve the value of the global variable "inverted"
	if (!is.null(inverted)) {		
		message("retrieving inverted matrix")
	return(inverted)				##here we specify that if "inverted" is not null - aka if there 
							##is already an inverted matrix - it will be retrieved along with a message.
	}
	
	newmatrix <- x$getmatrix()		##if no matrix is already cahced, we fetch the input matrix
	inverted <- solve(newmatrix)		## the we calculate the inverse of the input and store it, 
	x$setinverse(inverted)			## and then by storing this new matrix to the set, 
							## effectively caches it in the global environment.  			
	
	inverted					##Conclusively, we print the inverted matrix. 
}
