#Part a
alpha<-0.05
theta<-8 #5+3
x<-rtriangle(1,0,theta,0) #use rtriangle from triangle package

CIfunc <- function(x, alpha)
{
  # calculate the mean of x
  # appropriate z-value
  Low <- x /(1-sqrt(alpha/2)) # lower bound
  High <- x /(1-sqrt(1-alpha/2)) # upper bound
  # return confidence interval as a vector
  return(c(Low, High))
}
CIfunc(x, alpha) #this interval is huge given the tiny sample size of 1

#Part b
n <- 10000 #sample size
dist<-rtriangle(n,0,theta,0) #damples from rtriangle 
Intervals<-function(z) 
{
  #this function gives the n CIs we want
  mat<-matrix(nrow=n, ncol=2)
  for(i in 1:n){
    mat[i,1] <- z[i] /(1-sqrt(alpha/2)) # lower bound
    mat[i,2] <- z[i] /(1-sqrt(1-alpha/2))# upper bound
  }
    return(mat)
}
samp1<-Intervals(dist) #stores CIs from our n samples in a matrix

Percent <- function( X ) {
  #counts number of these CIs which contain theta using true false values
  z <- ( X[,1] < theta ) * ( X[ , 2 ] > theta)
  return(mean(z))}
Percent(samp1) #gives result - 0.9494 which is close enough to the 95% we expect
