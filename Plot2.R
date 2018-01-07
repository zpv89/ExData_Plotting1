## This is the script to produce plot 2 for the first assignment of the exploratory data analysis course

## This needs only be run if the data has not already been loaded into the workspace
rawdata <- read.table("household_power_consumption.txt", header=T,sep=";",stringsAsFactors = F, dec = ".")

DateSubset <- subset(rawdata,rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007")

## Create the second plot

DateSubset$DateTime <- strptime(paste(DateSubset$Date,DateSubset$Time),"%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png",width = 480, height = 480)

plot(DateSubset$DateTime,as.numeric(DateSubset$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()