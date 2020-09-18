#reading data file 
  data_set <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#subset data taken from 2 days 2/1/2007 & 2/2/2007
  data_plot <- subset(data_set, Date %in% c("1/2/2007","2/2/2007"))

  # Convert date format
data_plot$Date <- as.Date(data_plot$Date, format="%d/%m/%Y")

# saving plot to PNG file with specified width and height of 480
png("plot1.png", width=480, height=480)

#create histogram plot
hist(data_plot$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


dev.off()
