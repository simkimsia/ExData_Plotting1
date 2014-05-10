source("load_data.R")

dataset <- load_data()

days <- strptime(paste(dataset$Date, dataset$Time), format='%d/%m/%Y %H:%M:%S')

if (Sys.info()["sysname"] == "Darwin") {
  quartz() #for windows its windows() fpr unix it's X11()
}
if (Sys.info()["sysname"] == "Windows") {
  windows()
}

png("plot2.png")

# Create the bar plot
plot(days, 
     dataset$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()