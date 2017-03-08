#
# PACKAGES TO INSTALL
#

#install.packages("corrplot")
#install.packages("readxl")
#install.packages("ggplot2")
#install.packages("hexbin")
#install.packages("psych")
#install.packages("homals")
#install.packages("scales")
#install.packages("dplyr")
library(corrplot)
library(readxl)
library(ggplot2)
library(hexbin)
library(psych)
library(homals)
library(scales)
library(dplyr)

#
# SAVE DATA FROM EXCEL
#
ht <- read_excel("Data.xlsx")
options(max.print=1000000) #make sure everything is always printed
#ht[is.na(ht)]<-(-1) #all empty cells become -1
info <- ht[,c(1,2)] #only first two columns (date & time) are considered
#info #print excel data

colnames(info) <- c("Date", "Time")
info$Date = as.character(info$Date)
info$Date <- as.Date(info$Date, format="%m/%d/%Y")

hist(info$Date,breaks="days")
qplot(info$Date, geom="histogram", main ="Frequency of answers over time", xlab = "Date", ylab = "Answers", binwidth = 1)
