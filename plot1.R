source("load_data.R")

dataset <- load_data()


if (Sys.info()["sysname"] == "Darwin") {
  quartz() #for windows its windows() fpr unix it's X11()
}

png("plot1.png")

# Create the bar plot
hist(dataset$Global_active_power, 
     col = 'red',
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     main= "Global Active Power")  

dev.off()