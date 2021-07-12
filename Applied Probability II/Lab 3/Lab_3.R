#Reading in the dataset
ppdat <- read.csv(file="power_plant.csv")
#Prints out the first few lines of the dataset
head(ppdat)
#Finds the names of the variables in the dataset
names(ppdat)
#PE variable in the data frame can be accessed
ppdat$PE


#Plotting the data
pairs(ppdat)
#pattern seems to be that data is symmetric along a diagonal line AT-PE

#Change the plotting symbol, by using pch=20 to the pairs function. Change the colour of col="blue".
pairs(ppdat, pch=20, col="blue")

#Single plot
plot( x=ppdat$AT, y=ppdat$PE )
#Changes the plotting symbol and the colour of the points
plot( x=ppdat$AT, y=ppdat$PE , pch=20, col="blue")
#Add x-axis, y-axis and Title
plot( x=ppdat$AT, y=ppdat$PE , pch=20, col="blue",xlab="Temperature (°C)", ylab="Net Hourly Electrical Energy Output", main="Table 1")

#Fitting a regression model
mod.fit <- lm( PE ~ AT+ AP, data=ppdat )
#checks the model output by using 
summary( mod.fit )
#Look at what the summary function outputs. What do the table of values mean. 
  #Residuals - The difference between the observed values and sample mean
  #Estimate
  #Std. Error
  #t value

#What are the p-values on the rightmost column of the table testing?
  #p-values test statistical significance.
#multiple regression model for hourly electrical energy output
mod.all <- lm( PE ~ AT + AP + V + RH, data=ppdat )  
summary( mod.all )
#Check which of the variables are significant predictors of the mean hourly energy output. Should any variables be excluded? 
  # all 4 variables have p values <<0.01 so they are statistically significant 
  #- reject the null hypothesis that any of the variables do not affect PE (energy output)