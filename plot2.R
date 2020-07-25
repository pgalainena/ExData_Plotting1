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


#Make the plot
plot(as.numeric(MyData$Global_active_power)~MyData$TimeDate, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Save the plot
png(filename="plot2.png", width = 480, height = 480)
plot(as.numeric(MyData$Global_active_power)~MyData$TimeDate, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
