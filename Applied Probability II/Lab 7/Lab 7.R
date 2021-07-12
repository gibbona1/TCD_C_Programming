#Linear Regression
#Part A
setwd("~/Downloads")
library("readxl", lib.loc="/usr/local/lib/R/site-library")
#Set working directory to where the file is (Session Tab), and installed readxl file
ppdat <- read_excel("Power Plant.xlsx" )
lin<-lm(ppdat$PE~ppdat$AT)
lin
#Gets the b1 value
b1 <- lin$coefficients[[2]]
b1
#We find that the slope beta_1=-2.17132
#Part B
n <- 1000 #iterations
size <-50 #sample size of each iteration
CIinterval<-function(x){
  mat<-matrix(nrow=n, ncol=2)
  for(i in 1:n){
    #sample of row numbers
  samp1<-sample(nrow(x), size)
  samp2<-matrix(nrow=size, ncol=2)
  #makes a matrix with corresponding AT and PE values of the given row numbers
  for(h in 1:size){
    samp2[h,1]<-x$AT[[samp1[h]]]
    samp2[h,2]<-x$PE[[samp1[h]]]
  }
  X=samp2[,1]
  Y=samp2[,2]
  #Run the regression model on the sample
  linreg<-lm(Y~X)
  conf<-confint.lm(linreg)
  low1<-conf[[2]]
  high1<-conf[[4]]
  mat[i,1] <- low1 # lower bound
  mat[i,2] <- high1 # upper bound
  }
  return(mat)
}
CI<-CIinterval(ppdat)
#The above is a matrix of 1000 CIs, so below is the mean of these, giving a 95% CI for beta_1
Interval<-c(mean(CI[,1]),mean(CI[,2]))
Interval
#Part C
Percent <- function( X ) {
  #counts number of these CIs which contain b1 using true false values
  z <- ( X[,1] < b1 ) * ( X[ , 2 ] > b1)
  return(mean(z))}
Percent(CI) #gives result - 0.952 which is sufficiently close to the 95% CI

