install.packages("sqldf")
library(sqldf)
dat <- read.csv.sql("household_power_consumption.txt", 'select * from file WHERE "Date" IN ("1/2/2007", "2/2/2007")', sep = ";")
closeAllConnections()

## run plot4() to generate png file replicating plot4
plot4 <- function(){
      par(mfrow = c(2,2), cex = 0.55, lwd = 0.5)
      
      ##top left
      plot(as.ts(dat$Global_active_power), xlab = "", ylab = "Global Active Power", xaxt = "n") ##create plot, don't draw x-axis
      axis(1, at=axTicks(1, axp=c(0, 2900 , 2)), labels = c("Thu", "Fri", "Sat")) ##draw x-axis with 3 tick marks, label them ##top left
      
      ##top right
      plot(as.ts(dat$Voltage), xlab = "datetime", ylab = "Voltage", xaxt = "n", yaxt = "n") ##create plot, don't draw x or y axis
      axis(2, at=axTicks(2), labels = c("234", "" , "238", "", "242", "", "246"))
      axis(1, at=axTicks(1, axp=c(0, 2900 , 2)), labels = c("Thu", "Fri", "Sat")) ##draw x-axis with 3 tick marks, label them
      
      ##bottom left
      plot(as.ts(dat$Sub_metering_1), xlab = "", ylab = "Energy sub metering", xaxt = "n") ##create plot, don't draw x-axis\
      lines(as.ts(dat$Sub_metering_2), xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n", col="red") ##draw Sub_metering_2 line
      lines(as.ts(dat$Sub_metering_3), xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n", col="blue") ##draw Sub_metering_3 line
      legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n", cex = 0.95)
      axis(1, at=axTicks(1, axp=c(0, 2900 , 2)), labels = c("Thu", "Fri", "Sat")) ##draw x-axis with 3 tick marks, label them ##bottom left
      
      ##bottom right
      plot(as.ts(dat$Global_reactive_power), xlab = "datetime", ylab = "Global_reactive_power", xaxt = "n") ##create plot, don't draw x-axis
      axis(1, at=axTicks(1, axp=c(0, 2900 , 2)), labels = c("Thu", "Fri", "Sat")) ##draw x-axis with 3 tick marks, label them
}