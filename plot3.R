## PLOT 3
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
png(file="plot3.png")
plot(dt$cdate,
     dt$Sub_metering_1
     #,xlab=dt$Date
     ,ylab="Energy submetering"
     ,xlab=""
     ,type="l")

points(dt$cdate,
       dt$Sub_metering_2
       ,type="l"
       ,col="red")
points(dt$cdate,
       dt$Sub_metering_3
       ,type="l"
       ,col="blue")

legend("topright", pch = "l", col = c( "black","blue", "red")
       , legend = c("Sub_metering_1", "Sub_metering_2"
                    ,"Sub_metering_3"))
dev.off()


