summarySCC_file<-"./data/summarySCC_PM25.rds";
classifcation_file<-"./data/Source_Classification_Code.rds"

if(!file.exists(summarySCC_file)){
        stop(paste("File ",summarySCC_file," not found!",sep = ""))
}
if(!file.exists(classifcation_file)){
        stop(paste("File ",classifcation_file," not found!",sep = ""))
}


if(exists("SummarySCC")){
        message("SummarySCC is existed.")
}else{
        ## This line will likely take a few seconds. Be patient!
        message("SummarySCC_PM25.rds is loadeding...(it take times,be patient)")
        SummarySCC<-readRDS(summarySCC_file)
        message("SummarySCC_PM25.rds loaded")
}
str(SummarySCC)
if(exists("SCC")){
        message("SCC is existed")
}else{
        message("Source Classification_Code.rds is loading...")
        SCC<-readRDS(classifcation_file)
        message("Source Classification_Code.rds loaded")
}
str(SCC)

rm(list=setdiff(ls(),c("SummarySCC","SCC")))
