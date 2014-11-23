source("readData.R")

## get data from coal combustion-related sources 
SCC_coal_comb<-SCC[grepl("^Fuel Comb.*?Coal$",SCC$EI.Sector),"SCC"]
CoalRelatedData<-SummarySCC[SummarySCC$SCC %in% SCC_coal_comb,]

## calculate total emissions
TotalEmissions<-tapply(CoalRelatedData$Emissions,CoalRelatedData$year,sum,na.rm=TRUE)

emissions<-round(TotalEmissions,digits = 0)
years<-rownames(TotalEmissions)

png("plot4.png")

## make the plot. 
plot(years,
     emissions,
     type = "b",
     xlab = "Year", 
     xaxt="n",
     main="Total Emissions Trend  From Coal Combustion-Related Sources ")
axis(side = 1,at = years,labels = years)

dev.off()