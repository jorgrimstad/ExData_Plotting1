install.packages("sqldf")
library(sqldf)
dat <- read.csv.sql("household_power_consumption.txt", 'select * from file WHERE "Date" IN ("1/2/2007", "2/2/2007")', sep = ";")
closeAllConnections()

## run plot2() to generate png file replicating plot2
plot2 <- function(){
      par(cex = .75) ## reduce font size by 25%
      plot(as.ts(dat$Global_active_power), xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n") ##create plot, don't draw x-axis
      axis(1, at=axTicks(1, axp=c(0, 2900 , 2)), labels = c("Thu", "Fri", "Sat")) ##draw x-axis with 3 tick marks, label them
}