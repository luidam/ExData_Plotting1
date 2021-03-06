##PLOT 2

rm(list=ls())
temp <- read.table("household_power_consumption.txt"
                ,header=TRUE,sep=";"
                ,na.strings = "?"
                ,nrows=100000)
temp[,1] <- as.Date(temp[,1],format="%d/%m/%Y")
dt <- temp[(temp[,1]=="2007-02-01" | temp[,1]=="2007-02-02"),]
rm(temp)
if(sum(complete.cases(dt))!=nrow(dt)) stop("There are some incomplete cases!") 

dtt <-data.frame(cdate=strptime(paste(dt$Date,dt$Time)
                          ,format="%Y-%m-%d %H:%M:%S"))
dt <- c(dt,dtt)
rm(dtt)         


#plot:
png(file="plot2.png")
plot(dt$cdate,
     dt$Global_active_power
     #,xlab=dt$Date
     ,ylab="Global Active Power (kilowatts)"
     ,xlab=""
     ,type="l")

dev.off()
