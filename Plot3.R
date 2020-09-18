#reading data file 
data_set <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#subset data taken from 2 days 2/1/2007 & 2/2/2007
data_plot <- subset(data_set, Date %in% c("1/2/2007","2/2/2007"))

# Convert data 
datetime <- strptime(paste(data_plot$Date, data_plot$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

 globalActivePower <- as.numeric(data_plot3$Global_active_power) 
 subMetering1 <- as.numeric(data_plot$Sub_metering_1) 
 subMetering2 <- as.numeric(data_plot$Sub_metering_2) 
 subMetering3 <- as.numeric(data_plot$Sub_metering_3) 
  

 # saving plot to PNG file with specified width and height of 480
 png("plot3.png", width=480, height=480)
 
# creating plot 3
 plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

 lines(datetime, subMetering2, type="l", col="red")
 lines(datetime, subMetering3, type="l", col="blue")

 #create legend
 legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
