#Q1
x<-rnorm(50,0,1)
x.var<-var(x)


CIfunc <- function(x, alpha, x.var)
{
  # find the number of elements in x
  n <- length(x)
  # calculate the mean of x
  x.mean <- mean(x)
  # appropriate z-value
  z <- qnorm(1-alpha/2)
  Low <- x.mean - z*sqrt(x.var/n) # lower bound
  High <- x.mean + z*sqrt(x.var/n) # upper bound
  # return confidence interval as a vector
  return(c(Low, High))
}

CIfunc(x, 0.1, x.var)
CIfunc(x, 0.05, x.var)
CIfunc(x, 0.01, x.var)
# the higher the level of confidence, the wider the confidence interval

#Q2
m <- 100000
n <- 15
Samples <- function(m,n)
{
  matrix( rnorm( m*n ), nrow=m, ncol=n, byrow=TRUE )
}
Samp <- Samples(m,n) 
Samp



Percent <- function( X ) {
  CIs <- matrix( nrow=nrow(X), ncol=2 )
  for( k in 1:nrow(X) ) CIs[k, ] <- CIfunc( X[k,], 0.05 , 1)
  z <- ( CIs[,1] < 0 ) * ( CIs[ , 2 ] > 0)
  sum(z)/nrow(X)
}
Percent(Samp) 
#Q3
CI2<- function(X) {
for(k in 1:10) 
  CIfunc(Samp[k,], 0.05, var(Samp[k,]))
}
CI2(Samp)















#apply(Samp, 1, CIfunc, alpha = 0.05, x.var = 1)

#Q4
df<-n-1
alpha<-0.1
tval<-qt(1-alpha/2, df) 
  #Amended Q1
CIfunct <- function(x, alpha, x.var)
{
  # find the number of elements in x
  n <- length(x)
  # calculate the mean of x
  x.mean <- mean(x)
  # appropriate z-value
  t <- tval
  Low <- x.mean - t*sqrt(x.var/n) # lower bound
  High <- x.mean + t*sqrt(x.var/n) # upper bound
  # return confidence interval as a vector
  return(c(Low, High))
}
CIfunct(x, 0.1, x.var)
  #Amended Q2
Percentt <- function( X ) {
  CIs <- matrix( nrow=nrow(X), ncol=2 )
  for( k in 1:nrow(X) ) CIs[k, ] <- CIfunct( X[k,], 0.05 , 1)
  t <- ( CIs[,1] < 0 ) * ( CIs[ , 2 ] > 0)
  sum(t)/nrow(X)
}
Percentt(Samp) 
