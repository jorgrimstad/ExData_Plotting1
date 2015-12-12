install.packages("sqldf")
library(sqldf)
dat <- read.csv.sql("household_power_consumption.txt", 'select * from file WHERE "Date" IN ("1/2/2007", "2/2/2007")', sep = ";")
closeAllConnections()

## run plot1() to generate png file replicating plot1
plot1 <- function(){
      par(cex = 0.75)
      hist(dat$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
}