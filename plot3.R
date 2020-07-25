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

#Make and save the plot

png(filename="plot3.png", width = 480, height = 480)
plot(MyData$Sub_metering_1~MyData$TimeDate, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(MyData$Sub_metering_2~MyData$TimeDate, type="l", col="red")
lines(MyData$Sub_metering_3~MyData$TimeDate, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()