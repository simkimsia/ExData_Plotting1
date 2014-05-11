source("load_data.R")

dataset <- load_data()

days <- strptime(paste(dataset$Date, dataset$Time), format='%d/%m/%Y %H:%M:%S')

y1 <- dataset$Global_active_power
y2 <- dataset$Voltage

y3_1 <- dataset$Sub_metering_1
y3_2 <- dataset$Sub_metering_2
y3_3 <- dataset$Sub_metering_3
y3 <-  c(y3_1, y3_2, y3_3)

y4 <- dataset$Global_reactive_power


if (Sys.info()["sysname"] == "Darwin") {
  quartz() #for windows its windows() fpr unix it's X11()
}
if (Sys.info()["sysname"] == "Windows") {
  windows()
}

png("plot4.png")
par(mfrow=c(2,2))

# Create the plot for y1
plot1 <- plot(days, 
     y1,
     type="l", 
     xlab="", 
     ylab="Global Active Power"
)

# Create plot for y2
plot2 <- plot(days, 
     y2,
     type="l", 
     xlab="datetime", 
     ylab="Voltage"
)

# Create plot for y3
plot3 <- plot(days, 
              y3_1,
              ylim=range(y3),
              type="l", 
              xlab="", 
              ylab="Energy sub metering", 
              col="black"
)

# Create plot for y3 line 2
lines(days, 
      y3_2,
      col="red")

# Create plot for y3 line 3
lines(days, 
      y3_3,
      col="blue"
)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1, bty="n") # optional legend

# Create plot for y4
plot4 <- plot(days, 
              y4,
              type="l", 
              xlab="datetime", 
              ylab="Global_reactive_power"
)

dev.off()