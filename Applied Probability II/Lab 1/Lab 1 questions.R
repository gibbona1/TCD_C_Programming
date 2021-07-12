#Question 1
n <- 500
x <- rnorm(n, mean = 3, sd = 1.5)

#Question 2
a<-100
b<-rpois(a,1)
b[51:100]

#Question 3
c<-(1:400)
X <- matrix( c, nrow=20, ncol=20 )

#Question 4
X<-matrix( c, nrow=20, ncol=20 )
m <- X * 3
p <- m+2
p

#Question 5
X<-matrix(c(1,2,3, 11,12,13), nrow = 2, ncol = 3)
K<-matrix(c(1,1,1,1,1, 1,1,1,1,1),nrow=2,ncol=5)


test <- K[,c(ncol(X), ncol(X)-1)]
test
