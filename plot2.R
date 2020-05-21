#Exploratory Analysis - Week 4
#Course Project
#Manish - 05/11/2020

#Plot-2---------------------------------------------------------------------------------------------
oldpath<-getwd()
newpath<-"C:\\Users\\H202442\\Google Drive\\Coursera-DataScience\\Exploratory data analysis\\Week 4"
setwd(newpath)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset for Baltimore
PM25Balt<-subset(NEI,fips == "24510")

#Add for all the sources for each year
PM25BaltperYear<-aggregate(PM25Balt$Emissions,list(year=PM25Balt$year),FUN=sum)

## create the plot
png(filename = "plot2.png", width=480, height=480)
plot(PM25BaltperYear$year, PM25BaltperYear$x, type = "l", 
     main = "Total Emissions of PM2.5 in Baltimore City, Maryland",
     ylab = "Total PM2.5 in tons",
     xlab = "Year")
dev.off()