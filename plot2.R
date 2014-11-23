source("readData.R")

##select data in the Baltimore City, Maryland (fips == "24510") 
SelectedSCC<-SummarySCC[which(SummarySCC$fips=="24510"),]
TotalEmissions<-tapply(SelectedSCC$Emissions,SelectedSCC$year,sum,na.rm=TRUE)

emissions<-round(TotalEmissions,digits = 0)
years<-rownames(TotalEmissions)

png("plot2.png")

## make the plot. 
plot(years,
     emissions,
     type = "b",
     xlab = "Year", 
     xaxt="n",
     main="Total Emissions Trend in Baltimore City, Maryland")
axis(side = 1,at = years,labels = years)

dev.off()