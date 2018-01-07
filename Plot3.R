## This is the script to produce plot 3 for the first assignment of the exploratory data analysis course

## This needs only be run if the data has not already been loaded into the workspace
rawdata <- read.table("household_power_consumption.txt", header=T,sep=";",stringsAsFactors = F, dec = ".")

DateSubset <- subset(rawdata,rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007")
DateSubset$DateTime <- strptime(paste(DateSubset$Date,DateSubset$Time),"%d/%m/%Y %H:%M:%S")

## Create the third plot

png(filename = "plot3.png",width = 480, height = 480)

plot(DateSubset$DateTime,as.numeric(DateSubset$Sub_metering_1),type="l",xlab="",ylab="Energy Sub Metering")
lines(DateSubset$DateTime,as.numeric(DateSubset$Sub_metering_2),col="red")
lines(DateSubset$DateTime,as.numeric(DateSubset$Sub_metering_3),col="blue")

legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1))

dev.off()