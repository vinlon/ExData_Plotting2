source("readData.R")

SCC_motor_vehicle<-SCC[grepl("Mobile.*?Vehicles",SCC$EI.Sector),"SCC"]
is.selected<-SummarySCC$fips=="24510"&SummarySCC$SCC %in% SCC_motor_vehicle
SelectedData<-SummarySCC[is.selected,]

## calculate total emissions
TotalEmissions<-tapply(SelectedData$Emissions,SelectedData$year,sum,na.rm=TRUE)

emissions<-round(TotalEmissions,digits = 0)
years<-rownames(TotalEmissions)

png("plot5.png")

## make the plot. 
plot(years,
     emissions,
     type = "b",
     xlab = "Year", 
     xaxt="n",
     main="Total Emissions,Motor Vehicle Sources,in Baltimore")
axis(side = 1,at = years,labels = years)

dev.off()