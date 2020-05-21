#Exploratory Analysis - Week 4
#Course Project
#Manish - 05/20/2020

#Plot-5---------------------------------------------------------------------------------------------
oldpath<-getwd()
newpath<-"C:\\Users\\H202442\\Google Drive\\Coursera-DataScience\\Exploratory data analysis\\Week 4"
setwd(newpath)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset for Baltimore
Balt<-subset(NEI,fips == "24510" & type == "ON-ROAD")

#Add for all the year
BaltYear<-aggregate(Balt$Emissions,list(Balt$year),FUN=sum)

colnames(BaltYear) <- c("Year", "Emissions")

## create plot with ggplot2
library(ggplot2)
png(filename = "plot5.png")
qplot(Year, Emissions, data = BaltYear, geom = c("point","line")) +
  ggtitle("PM 2.5 Total Emissions from Motor-Vehicles in Baltimore City") + 
  ylab("PM 2.5 Total Emissions in tons") + 
  xlab("Year") 
dev.off()