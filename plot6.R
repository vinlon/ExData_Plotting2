source("readData.R")

SCC_motor_vehicle<-SCC[grepl("Mobile.*?Vehicles",SCC$EI.Sector),"SCC"]
is.selected<-SummarySCC$fips %in% c("24510","06037")&SummarySCC$SCC %in% SCC_motor_vehicle
SelectedData<-SummarySCC[is.selected,]
SelectedData[SelectedData$fips=="24510","fips"]<-"Baltimore City, Maryland"
SelectedData[SelectedData$fips=="06037","fips"]<-"Los Angeles County, California"        
## calculate total emissions
library(data.table)

SccTable<-data.table(SelectedData)
TotalEmissions<-SccTable[,list(TotalEmissions=sum(Emissions,na.rm =TRUE)),by=c("year","fips")]

library(ggplot2)
#help(ggplot2)

png("plot6.png")

q<-qplot(x = year,
      y = TotalEmissions,
      data=TotalEmissions,
      color = fips,
      geom=c("point","smooth"),
      method="lm"
      )
q<-q+ggtitle("Total Emissions,Motor Vehicle Sources (Baltimore vs Los Angeles)")
q<-q+scale_x_continuous(breaks=unique(TotalEmissions$year))
q<-q+theme(legend.position ="bottom")
q

dev.off()