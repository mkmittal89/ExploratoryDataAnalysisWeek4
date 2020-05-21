#Exploratory Analysis - Week 4
#Course Project
#Manish - 05/20/2020

#Plot-6---------------------------------------------------------------------------------------------
oldpath<-getwd()
newpath<-"C:\\Users\\H202442\\Google Drive\\Coursera-DataScience\\Exploratory data analysis\\Week 4"
setwd(newpath)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset for Baltimore & LA
BaltnLA<-subset(NEI,fips == "24510" | fips == "06037" & type == "ON-ROAD")

#Add for all the year
BaltnLAYear<-aggregate(BaltnLA$Emissions,list(BaltnLA$fips,BaltnLA$year),FUN=sum)

colnames(BaltnLAYear) <- c("City","Year", "Emissions")

## create plot with ggplot2
library(ggplot2)
png(filename = "plot6.png")
qplot(Year, Emissions, data = BaltnLAYear, color = City,geom = c("point","line")) +
  ggtitle("Emissions of PM2.5 from MV in Baltimore-24510 & LA-06037") + 
  ylab("PM 2.5 Total Emissions in tons") + 
  xlab("Year") 
dev.off()