#Exploratory Analysis - Week 4
#Course Project
#Manish - 05/11/2020

#Plot-3---------------------------------------------------------------------------------------------
oldpath<-getwd()
newpath<-"C:\\Users\\H202442\\Google Drive\\Coursera-DataScience\\Exploratory data analysis\\Week 4"
setwd(newpath)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset for Baltimore
Balt<-subset(NEI,fips == "24510")

#Add for all the sources for each year
BaltYearSource<-aggregate(Balt$Emissions,list(Balt$type,Balt$year),FUN=sum)

colnames(BaltYearSource) <- c("Type", "Year", "Emissions")

## create plot with ggplot2
library(ggplot2)
png(filename = "plot3.png")
qplot(Year, Emissions, data = BaltYearSource, color = Type, geom = "line") +
  ggtitle("PM 2.5 Total Emissions in Baltimore City By pollutant type") + 
  ylab("PM 2.5 Total Emissions in tons") + 
  xlab("Year") 
dev.off()