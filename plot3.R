source("load_data.R")

dataset <- load_data()

days <- strptime(paste(dataset$Date, dataset$Time), format='%d/%m/%Y %H:%M:%S')

y1 <- dataset$Sub_metering_1
y2 <- dataset$Sub_metering_2
y3 <- dataset$Sub_metering_3

all_y <- c(y1, y2, y3)

if (Sys.info()["sysname"] == "Darwin") {
  quartz() #for windows its windows() fpr unix it's X11()
}
if (Sys.info()["sysname"] == "Windows") {
  windows()
}

png("plot3.png")

# Create the plot for y1
plot(days, 
     y1,
     ylim=range(all_y),
     type="l", 
     xlab="", 
     ylab="Energy sub metering", 
     col="black"
     )

# Create plot for y2
lines(days, 
     y2,
     col="red")

# Create plot for y3
lines(days, 
     y3,
     col="blue"
)

#create legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1) # optional legend

dev.off()