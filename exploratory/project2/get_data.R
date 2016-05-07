library(dplyr)
if (!file.exists("data.zip"))
{
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  temp <- "data.zip"
  download.file(url, "data.zip", method="curl")
}

if (!file.exists("data.zip"))
{
  stop("Could not download file")
}

if (!file.exists("summarySCC_PM25.rds") | !file.exists("Source_Classification_Code.rds"))
{
  unzip("data.zip")
}

if (!file.exists("summarySCC_PM25.rds") | !file.exists("Source_Classification_Code.rds"))
{
  stop("Could not extract file!")
}


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
