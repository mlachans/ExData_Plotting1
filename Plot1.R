#load data
setwd("/Users/msl/Dropbox/Coursera/Exploratory Analysis")
data = read.csv("household_power_consumption.txt", 
                header=T, sep=";", na.strings="?")

#get correct data interval
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
data = subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data$datetime = as.POSIXct(paste(as.Date(data$Date), data$Time))

#make plot
par(mfrow=c(1,1)); hist(data$Global_active_power, main="Global Active Power", 
     xlab= "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

#save plot
setwd("/Users/msl/desktop/ExData_Plotting1")
dev.copy(png, file="plot1.png", h = 480, w = 480); dev.off()