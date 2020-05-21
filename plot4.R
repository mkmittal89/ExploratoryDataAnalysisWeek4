#Exploratory Analysis - Week 4
#Course Project
#Manish - 05/20/2020

#Plot-4---------------------------------------------------------------------------------------------
oldpath<-getwd()
newpath<-"C:\\Users\\H202442\\Google Drive\\Coursera-DataScience\\Exploratory data analysis\\Week 4"
setwd(newpath)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset for Coal
CoalSCC<-SCC[grepl("Coal",SCC$Short.Name),]

#Subsetting NEI for all emission data related to coal source
CoalNEI<-NEI[NEI$SCC %in% CoalSCC$SCC,]

#Add for all the year
CoalSource<-aggregate(CoalNEI$Emissions,list(CoalNEI$year),FUN=sum)

colnames(CoalSource) <- c("Year", "Emissions")

## create plot with ggplot2
library(ggplot2)
png(filename = "plot4.png")
qplot(Year, Emissions, data = CoalSource, geom = c("point","line")) +
  ggtitle("PM 2.5 Total Emissions from Coal Sources") + 
  ylab("PM 2.5 Total Emissions in tons") + 
  xlab("Year") 
dev.off()