sigmasquare<-8 #3+5
#Assuming null hypothesis is true, theta1 and theta2 are 0
theta1<-0
theta2<-0
n<-100000
chinum<-qchisq(0.95,df=2)
X_1<-rnorm(n, theta1,sqrt(sigmasquare))
X_2<-rnorm(n, theta2,sqrt(sigmasquare))
ans<-X_1^2 + X_2^2
#Quartile function gives us the number above which 95% of numbers lie, so the 95% cutoff, or C
cutoff<-quantile(ans, 0.95)
cutoff/(sigmasquare)
chinum
#We get C/sigma^2=5.989693 which is ~5.991465. i.e. chi-square (a=0.95,df=2)
