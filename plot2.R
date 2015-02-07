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

# plot 2
plot(data1$datetime,data1$Global_active_power,type="l", xlab="", 
     ylab= "Global Active Power (kilowatts)", cex.axis=.8, cex.lab=.8)
dev.copy(png, 'plot2.png')
dev.off()