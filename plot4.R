# assuming the working directory contains the source file
#preparing column types
vars <- c("character", "character", rep("numeric", 7))
dataSetPath<-"household_power_consumption.txt"
data<-read.table(dataSetPath, h=1, sep=";", colClasses=vars, na.strings="?")
#subset the data from two days
data1 <- data[data$Date=="1/2/2007"|data$Date =="2/2/2007", ]
data1$datetime<-dateTime  <- as.POSIXlt(paste(as.Date(data1$Date,format="%d/%m/%Y"), data1$Time, sep=" "))
# make sure english names are used for time-related label (like weekdays)
Sys.setlocale("LC_TIME", "English")

#plot 4
par(mfrow=c(2,2))
plot(data1$datetime,data1$Global_active_power,type="l", xlab="", ylab= "Global Active Power", cex.axis=.8, cex.main=.9, cex.lab=.8)
plot(data1$datetime,data1$Voltage,type="l", xlab="", ylab= "Voltage", cex.axis=.8, cex.main=.9, cex.lab=.8)
plot(data1$datetime,data1$Sub_metering_1,type="n", xlab="", ylab= "Energy sub metering", cex.axis=.8, cex.main=.9, cex.lab=.8)
lines(data1$datetime,data1$Sub_metering_1,col="black",)
lines(data1$datetime,data1$Sub_metering_2,col="red",)
lines(data1$datetime,data1$Sub_metering_3,col="blue",)
legend("topright", 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lwd = .75, 
       cex = .50,
       bty="n"
)
plot(data1$datetime,data1$Global_reactive_power,type="l", xlab="", ylab= "Global_reactive_power", cex.axis=.8, cex.main=.9, cex.lab=.8)
dev.copy(png, 'plot4.png')
dev.off()
par(mfrow=c(1,1))