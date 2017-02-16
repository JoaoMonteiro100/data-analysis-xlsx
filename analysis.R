#
# PACKAGES TO INSTALL
#
#install.packages("corrplot")
#install.packages("readxl")
library(corrplot)
library(readxl)

#
# SAVE DATA FROM EXCEL
#
ht <- read_excel("Data.xlsx")
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
corrplot(cor(info[,c(1,2,3,4,24,25,26,34,52)]), method="color", tl.cex = 1, type="full", addCoef.col = "white")



a<-cor(info)
corrplot(a, method="color", tl.cex = 1, type="full", addCoef.col = "white")



#cor(ht[,5],ht[,6])
options(max.print=1000000)
cor(info[,c(1,2,3,4,24,25,26,34,52)])
#pie3d INSTALAR library(plotrix)
plot(cor(info))
plot(cor(ht$Age,ht$Do.you.have.a.mobile.device.))
pairs(cor(info[,c(5,6,7,8,9)]))
#hist(ht$Do.you.have.a.mobile.device.)
#pairs(ht$Age,ht$Do.you.have.a.mobile.device.)
