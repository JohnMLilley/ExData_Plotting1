# Exporatory Data Analysis
# Project 1
# Plot 2

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
png("plot2.png",  width = 480, height = 480, units = "px")

library(lubridate)

#Create a plot on the PNG() device
#Note: Add the Time to the Date column for the x value
plot(dmy(dfs$Date) + hms(dfs$Time), dfs$Global_active_power,
     ylab="Global Active Power (kilowatts)",
     xlab="",
     type="l")

#Close the plot device
dev.off()

