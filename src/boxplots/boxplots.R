# prepare the data
ozone <- airquality$Ozone
temp <- airquality$Temp
# gererate normal distribution with same mean and sd
ozone_norm <- rnorm(200,mean=mean(ozone, na.rm=TRUE), sd=sd(ozone, na.rm=TRUE))
temp_norm <- rnorm(200,mean=mean(temp, na.rm=TRUE), sd=sd(temp, na.rm=TRUE))


boxplot(ozone, ozone_norm, temp, temp_norm,
main = "Multiple boxplots for comparision",
at = c(1,2,4,5),
names = c("ozone", "normal", "temp", "normal"),
las = 2,
col = c("orange","red"),
border = "brown",
horizontal = TRUE,
notch = TRUE
)
