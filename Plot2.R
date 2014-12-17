library(dplyr)

##Functions
readData <- function(path, fileName) {
  
  file <- paste(path,"//", fileName, sep = "")
  dat <- readRDS(file)
  dat
  
}

#Save Graph as PNG Image Function
saveGraphAsPNG <- function(path, fileName) {
  dev.copy(png, file = paste(path,"//", fileName,".png", sep = ""), width = 480, height = 480) 
  dev.off()
}
################

##
rootPath <- "D://Arquivos de Projetos//[R] Codes//Exploring_Data_Analysis//Projeto2"
summarySCC <- "summarySCC_PM25.rds"
sourceClassific <- "Source_Classification_Code.rds"

##Reading Tables
NEI <- readData(rootPath, summarySCC)
SCC <- readData(rootPath, sourceClassific)

##Summarizing Data By Year
NEI_FILTER <- filter(NEI, fips == "24510")
NEI_GROUP <- group_by(NEI_FILTER, year)
NEI_SUM <- summarise(NEI_GROUP, Emissions = sum(Emissions))

plot(NEI_SUM$year, 
     NEI_SUM$Emissions, 
     type="b",
     ylab = "PM2.5 Emission",
     xlab = "")


saveGraphAsPNG(rootPath, "Plot2")
