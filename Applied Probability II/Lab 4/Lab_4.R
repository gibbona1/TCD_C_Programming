#Q1 Likelihood function for success probability
p<-seq(from = 0, to = 1, by =0.01)
BinomF <- function( p )
{
  dbinom( x=8, size=10, prob=p )
} 
LF <- function( )
{
  p <- seq( 0, 1, by=0.01 )
  Lp <- dbinom( x=8, size=10, prob=p )
  return( list( p=p, Lp=Lp ) )
}
Z <- LF( )
Z$Lp 

plot( Z$p, Z$Lp, type="l", xlab="x-axis", ylab="y-axis", main="Question 1")
plot( Z$p, Z$Lp/max(Z$Lp), type="l", xlab="x-axis", ylab="y-axis", main="Question 1 Normalised")



#Q2 Log-likelihood function for exponential rate
ExpSamp <- function( ) {
  rexp( 50, rate=1/5 )
}
xsim <- ExpSamp ( ) 


LLExp <- function( x, lambda ) {
  N <- length(lambda)
  if( N > 1 )
  {
    ll <- numeric( N )
    for( k in 1:N ) ll[k] <- sum( dexp( x, rate=lambda[k], log=TRUE ) )
    return(ll)
  }
  else
  {
    return( sum( dexp( x, rate=lambda, log=TRUE ) ) )
  }
} 
LL<-LLExp(xsim, p)
LL
plot( p, LL, type="l", xlab="x-axis", ylab="y-axis", main="Question 2") 
#normalised
plot( p, LL/(-max(LL)), type="l", xlab="x-axis", ylab="y-axis", main="Question 2 Normalised") 