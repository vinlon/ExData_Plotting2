source("readData.R")

TotalEmissions<-tapply(SummarySCC$Emissions,SummarySCC$year,sum,na.rm=TRUE)
emissions<-round(TotalEmissions,digits = 0)
years<-rownames(TotalEmissions)
## user aggregate will take much longer time. 
#aggregate(SummarySCC$Emissions,by = list(SummarySCC$year),FUN = sum,na.rm=TRUE)

## make the plot. 
## save png file
filename<-"plot1.png"
png(filename)

plot(years,
     emissions,
     type = "b",
     xlab = "Year", 
     xaxt="n",
     main="Total Emissions Trend in US")
axis(side = 1,at = years,labels = years)
#the annotation position is hard to control. 
#text(years,emissions,labels = emissions)

dev.off()
