#Question 1
#First declare 2 samples of uniform distributions with 1000 realisations each
X1 <- runif(1000)
X2 <- runif(1000)
#Gets the difference between the 2 samples
diff <- X1-X2
#absolute value makes sure the result is >=0
a <- abs(diff)
#Asks if the difference is less thasn 0.25, returns a vector of TRUE/FALSE
num <- a < 0.25 
#this is the probability we want
prob=mean(num)
#displays result - roughly 0.43
prob

#Question 2(a)
#Declare 3 theta values and 3 samples of beta distributions using each theta
th1 <- 1
Y1 <- rbeta(1000, 1, 1+th1)
th2 <- 2
Y2 <- rbeta(1000, 1, 1+th2)
th3 <- 3
Y3 <- rbeta(1000, 1, 1+th3)
#This function may be inefficient with 3 different for loops 
#but it gives the required result with little lag
func<- function(x)
{
  #Gives numerator and denominator vectors, with zeroes in all entries (to be filled in later)
  vec1<-replicate(1000, 0)
  vec2<-replicate(1000, 0)
  #Gives blank sum vectors for numerator and denominator
  sum1<-replicate(10, 0)
  sum2<-replicate(10, 0)
  for(k in 1:1000){
  #generates sample of 10 from the argument x
  samp=sample(x,10)
  for(j in 6:10){
    #gives the numerator equation for each Xi
    sum1[j]<-log(1-samp[j])
  }
  for(i in 1:10){
    #gives the denominator equation for each Xi
    sum2[i]<-log(1-samp[i])
  }
  #each numerator sum value corresponds to a vec1 entry
  vec1[k]=sum(sum1)
  #each denominator sum value corresponds to a vec1 entry
  vec2[k]=sum(sum2)
  }
  #fraction vector has entries of the form inside expected value in question 
  #There will be 1000 ot these
  frac<-vec1/vec2
  #gives the mean value from the frac vector i.e. E[frac]
  expectation<-mean(frac)
  return(expectation)
}
#prints expectation for 3 different values of theta
func(Y1)
func(Y2)
func(Y3)
#since all 3 are sufficiently close to 0.5, 
#we conclude that the expectation is independent from theta


#Question 2(b)
func(X1)
#Since this is also sufficiently close to 0.5, we conclude that 
#the expectation is even independent from the distribution of the Xi's