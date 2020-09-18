#reading data file 
data_set <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#subset data taken from 2 days 2/1/2007 & 2/2/2007
data_plot <- subset(data_set, Date %in% c("1/2/2007","2/2/2007"))

# Convert data 

datetime <- strptime(paste(data_plot$Date, data_plot$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(data_plot$Global_active_power) 


# saving plot to PNG file with specified width and height of 480
png("plot2.png", width=480, height=480)


## Plot 2
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)") 


dev.off()
