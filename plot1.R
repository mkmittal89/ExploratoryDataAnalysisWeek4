#Exploratory Analysis - Week 4
#Course Project
#Manish - 05/11/2020

#Plot-1---------------------------------------------------------------------------------------------
oldpath<-getwd()
newpath<-"C:\\Users\\H202442\\Google Drive\\Coursera-DataScience\\Exploratory data analysis\\Week 4"
setwd(newpath)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Add for all the sources for each year
PM25perYear<-aggregate(NEI$Emissions,list(year=NEI$year),FUN=sum)

## create the plot
png(filename = "plot1.png", width=480, height=480)
plot(PM25perYear$year, PM25perYear$x, type = "l", 
     main = "Total Emissions of PM2.5 in USA",
     ylab = "Total PM2.5 in tons",
     xlab = "Year")
dev.off()