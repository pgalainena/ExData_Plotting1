#Get data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./Data.zip", method= "curl")
unzip("./Data.zip")
Data<-read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

#Subset data from the dates 2007-02-01 and 2007-02-02
Data$Date<-as.Date(Data$Date, format = "%Y/%m/%d")
MyData<-subset(Data, Date=="2007-02-01"|Date=="2007-02-02")

#Convert the Date and Time variables to a single Date/Time class variable
TimeDate<-paste(MyData$Date, MyData$Time)
MyData$TimeDate<- as.POSIXct(TimeDate)


#Save Multiple Base plot
png(filename="plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4.7,4.7,2.7,1.7))
with(MyData,
     {plot(as.numeric(MyData$Global_active_power)~MyData$TimeDate, type="l", ylab="Global Active Power (kilowatts)", xlab="")
      plot(as.numeric(MyData$Voltage)~MyData$TimeDate, type="l", ylab="Voltage", xlab="datetime")
      plot(MyData$Sub_metering_1~MyData$TimeDate, type="l", col="black", ylab="Energy sub metering", xlab="")
      lines(MyData$Sub_metering_2~MyData$TimeDate, type="l", col="red")
      lines(MyData$Sub_metering_3~MyData$TimeDate, type="l", col="blue")
      legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7)
      plot(as.numeric(MyData$Global_reactive_power)~MyData$TimeDate, type="l", ylab="Global_reactive_power", xlab="datetime")
      })
dev.off()