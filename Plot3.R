#load data
setwd("/Users/msl/Dropbox/Coursera/Exploratory Analysis")
data = read.csv("household_power_consumption.txt", 
                header=T, sep=";", na.strings="?")

#get correct data interval
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
data = subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data$datetime = as.POSIXct(paste(as.Date(data$Date), data$Time))

#make plot
setwd("/Users/msl/desktop/ExData_Plotting1"); par(mfrow=c(1,1))
png(file = "plot3.png", h = 480, w = 480, units = "px"); 
with(data, {
        plot(Sub_metering_1~datetime, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~datetime, col="Red")
        lines(Sub_metering_3~datetime, col="Blue")})
legend("topright", inset=c(0.0,0), pt.cex = 1, cex = 1, 
       col=c("Black", "Red", "Blue"), lty=1, 
       lwd =2, leg=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()