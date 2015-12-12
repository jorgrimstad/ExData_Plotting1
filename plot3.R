install.packages("sqldf")
library(sqldf)
dat <- read.csv.sql("household_power_consumption.txt", 'select * from file WHERE "Date" IN ("1/2/2007", "2/2/2007")', sep = ";")
closeAllConnections()

## run plot3() to generate png file replicating plot3
plot3 <- function(){
      par(cex = .75) ## reduce font size by 25%
      plot(as.ts(dat$Sub_metering_1), xlab = "", ylab = "Energy sub metering", xaxt = "n") ##create plot, don't draw x-axis\
      lines(as.ts(dat$Sub_metering_2), xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n", col="red") ##draw Sub_metering_2 line
      lines(as.ts(dat$Sub_metering_3), xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n", col="blue") ##draw Sub_metering_3 line
      legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
      axis(1, at=axTicks(1, axp=c(0, 2900 , 2)), labels = c("Thu", "Fri", "Sat")) ##draw x-axis with 3 tick marks, label them
}