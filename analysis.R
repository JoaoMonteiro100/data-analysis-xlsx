#
# PACKAGES TO INSTALL
#

#install.packages("corrplot")
#install.packages("readxl")
#install.packages("ggplot2")
#install.packages("hexbin")
library(corrplot)
library(readxl)
library(ggplot2)
library(hexbin)

#
# SAVE DATA FROM EXCEL
#
ht <- read_excel("Data.xlsx")
options(max.print=1000000) #make sure everything is always printed
ht[is.na(ht)]<-(-1) #all empty cells become -1
info <- ht[,-c(1,2)] #first two columns (date & time) are ignored
#info #print excel data

#
# MAKE COLUMN NAMES SHORTER (full names can be seen in the .xlsx file)
#

colnames(info) <- c("Gend", "Age", "Qual",
                    "A-Note",
                    "A1-own", "A1-fam", "A1-frnd", "A1-othr",
                    "A2-wght", "A2-cals", "A2-hrt", "A2-prss", "A2-sypt", "A2-ills", "A2-tpcs", "A2-onln", "A2-anls", "A2-othr",
                    "A3-papr", "A3-book", "A3-napp", "A3-sapp", "A3-othr",
                    "Frgt", "Dnot",
                    "B-Cnot",
                    "B1-when",
                    "B2-name", "B2-opns", "B2-meds", "B2-trtm", "B2-dose", "B2-othr",
                    "C-Undr",
                    "C1-pron", "C1-volm", "C1-atti", "C1-tech", "C1-expn", "C1-ordr", "C1-time", "C1-othr",
                    "C2-rept",
                    "C21-cnfd", "C21-ignt", "C21-bthr", "C21-latr", "C21-trst", "C21-time", "C21-uint", "C21-othr",
                    "D-Mobl",
                    "D1-call", "D1-int", "D1-napp", "D1-iapp", "D1-othr",
                    "D2-os",
                    "D3-rcrd",
                    "D4-trns",
                    "D5-defs",
                    "D6-note",
                    "D7-use")

#
# INFO ANALYSIS
#

# Correlation between nonconditional questions
# (correlation with column #52, "do you have a mobile device?", may be wrong because 0=no, 1=yes, 2=not sure)
corrplot(cor(info[,c(1,2,3,4,24,25,26,34,52)]), method="color", tl.cex = 1, type="full", addCoef.col = "white")

# Correlation between conditional questions
# (might be affected from NA answers being transformed into -1)
corrplot(cor(info[,c(5,6,7,8)]), method="color", tl.cex = 1, type="full", addCoef.col = "white")
corrplot(cor(info[,c(9,10,11,12,13,14,15,16,17,18)]), method="color", tl.cex = 1, type="full", addCoef.col = "white")
corrplot(cor(info[,c(19,20,21,22,23)]), method="color", tl.cex = 1, type="full", addCoef.col = "white")
corrplot(cor(info[,c(27,28,29,30,31,32,33)]), method="color", tl.cex = 1, type="full", addCoef.col = "white")
corrplot(cor(info[,c(35,36,37,38,39,40,41,42,43)]), method="color", tl.cex = 1, type="full", addCoef.col = "white")
corrplot(cor(info[,c(44,45,46,47,48,49,50,51)]), method="color", tl.cex = 1, type="full", addCoef.col = "white")
corrplot(cor(info[,c(53,54,55,56,57,58,59,60,61,62,63)]), method="color", tl.cex = 1, type="full", addCoef.col = "white")
corrplot(cor(info[,c(59,60,61,62,63)]), method="color", tl.cex = 1, type="full", addCoef.col = "white")

# Histograms
ggplot() + aes(info$Gend)+ geom_histogram(binwidth=1)
ggplot() + aes(info$Age)+ geom_histogram(binwidth=1)
ggplot() + aes(info$Qual)+ geom_histogram(binwidth=1)
ggplot() + aes(info$`A-Note`)+ geom_histogram(binwidth=1)
ggplot() + aes(info$`D-Mobl`)+ geom_histogram(binwidth=1)

# Scatter plots
plot(hexbin(info$Age, info$`D-Mobl`, xbins=40))
plot(hexbin(info$Frgt, info$Age, xbins=40))

# Other possible graphs
qqnorm(info$Age, plot.it = TRUE)
pairs(cor(info[,c(5,6,7,8)]))
with(mtcars, boxplot(info$Age, info$`D-Mobl`)) #doesn't make sense with discrete data
plot(info$Age,info$`D-Mobl`) #useless

# More resources
# pie3d -- library(plotrix)