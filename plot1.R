#Get data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./Data.zip", method= "curl")
unzip("./Data.zip")
Data<-read.table("./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

#Subset data from the dates 2007-02-01 and 2007-02-02
Data$Date<-as.Date(Data$Date, format = "%Y/%m/%d")
MyData<-subset(Data, Date=="2007-02-01"|Date=="2007-02-02")


#Make the histogram
hist(as.numeric(MyData$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency",breaks = 12)

#Save the histogram as a png file
png(filename="plot1.png", width = 480, height = 480)
hist(as.numeric(MyData$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency",breaks = 12)
dev.off()

