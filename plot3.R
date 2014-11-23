source("readData.R")

##select data in the Baltimore City, Maryland (fips == "24510") 
SelectedData<-SummarySCC[which(SummarySCC$fips=="24510"),]
#use data.table to get summary
library(data.table)
SccTable<-data.table(SelectedData)
TotalEmissions<-SccTable[,list(summary=sum(Emissions,na.rm =TRUE)),by=c("year","type")]

library(ggplot2)
#help(ggplot2)

png("plot3.png")

q<-qplot(x = year,
      y = summary,
      data=TotalEmissions,
      facets = .~type,
      geom=c("point","smooth"),
      method="lm")
q<-q+scale_x_continuous(breaks=unique(TotalEmissions$year))
q<-q+ggtitle("Total Emission Trend of Baltimore City for different types")
q
dev.off()
