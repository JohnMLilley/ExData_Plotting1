# Exporatory Data Analysis
# Project 1
# Plot 3

# Load the library ready for sql reading of datafiles
library(sqldf)

#Set the file name 
#Note that the file should already be in your working drirectory

fi <- file("household_power_consumption.txt")

#Load the data into R using sqldf()
#Filter the data while loading to just pick up the data
#where the Date is 1/2/2007 or 2/2/2007
dfs <- sqldf("select * from fi where Date in ('1/2/2007','2/2/2007')",
            file.format = list(header = TRUE, sep = ";"))

#Close the file once the data has been loaded
close(fi)


#Open a png() file device and set the width and height to 480 pixels
png("plot3.png",  width = 480, height = 480, units = "px")

library(lubridate)

#Create a plot on the PNG() device
#Note: Add the Time to the Date column for the x value

plot(dmy(dfs$Date) + hms(dfs$Time), dfs$Sub_metering_1,
     ylab="Energy sub metering",
     xlab="",
     type="l",
     col="black")

points(dmy(dfs$Date) + hms(dfs$Time), dfs$Sub_metering_2,
     ylab="Energy sub metering",
     xlab="",
     type="l",
     col="red")

points(dmy(dfs$Date) + hms(dfs$Time), dfs$Sub_metering_3,
     ylab="Energy sub metering",
     xlab="",
     type="l",
     col="blue")

legend("topright",col = c("black","red","blue"),
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1))

#Close the plot device
dev.off()

