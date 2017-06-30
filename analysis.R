#
# PACKAGES TO INSTALL
#

#install.packages("corrplot")
#install.packages("readxl")
#install.packages("ggplot2")
#install.packages("hexbin")
#install.packages("psych")
#install.packages("homals")
#install.packages("MASS")
#install.packages("vcd")
library(corrplot)
library(readxl)
library(ggplot2)
library(hexbin)
library(psych)
library(homals)
library(MASS)
library(vcd)
setwd("J:/GitHub/data-analysis-xlsx")
#
# SAVE DATA FROM EXCEL
#
ht <- read_excel("Data.xlsx")
options(max.print=1000000) #make sure everything is always printed
#ht[is.na(ht)]<-(-1) #all empty cells become -1
info <- ht[,-c(1,2)] #first two columns (date & time) are ignored
#info #print excel data

#
# DATA TREATMENT
#

# Shortening header names (full names can be seen in the .xlsx file)
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

# Factoring variables and ordering them
#info$`A1-own` <- na.omit(info$`A1-own`)
info$Gend <- factor(info$Gend)

info$Age <- factor(info$Age)
info$Age <- ordered(info$Age)

info$Qual <- factor(info$Qual, levels = c("lower than 4th grade", "4th grade", "9th grade", "12th grade", "bachelor's degree", "master's degree", "doctoral degree"))
info$Qual <- ordered(info$Qual)

info$`A-Note` <- factor(info$`A-Note`)
info$`A1-own` <- factor(info$`A1-own`)
info$`A1-fam` <- factor(info$`A1-fam`)
info$`A1-frnd` <- factor(info$`A1-frnd`)
info$`A1-othr` <- factor(info$`A1-othr`)
info$`A2-wght` <- factor(info$`A2-wght`)
info$`A2-cals` <- factor(info$`A2-cals`)
info$`A2-hrt` <- factor(info$`A2-hrt`)
info$`A2-prss` <- factor(info$`A2-prss`)
info$`A2-sypt` <- factor(info$`A2-sypt`)
info$`A2-ills` <- factor(info$`A2-ills`)
info$`A2-tpcs` <- factor(info$`A2-tpcs`)
info$`A2-onln` <- factor(info$`A2-onln`)
info$`A2-anls` <- factor(info$`A2-anls`)
info$`A2-othr` <- factor(info$`A2-othr`)
info$`A3-papr` <- factor(info$`A3-papr`)
info$`A3-book` <- factor(info$`A3-book`)
info$`A3-napp` <- factor(info$`A3-napp`)
info$`A3-sapp` <- factor(info$`A3-sapp`)
info$`A3-othr` <- factor(info$`A3-othr`)

info$Frgt <- factor(info$Frgt, levels = c("never", "occasionally", "often", "always"))
info$Frgt <- ordered(info$Frgt)

info$Dnot <- factor(info$Dnot, levels = c("never", "occasionally", "often", "always"))
info$Dnot <- ordered(info$Dnot)

info$`B-Cnot` <- factor(info$`B-Cnot`, levels = c("never", "occasionally", "often", "always"))
info$`B-Cnot` <- ordered(info$`B-Cnot`)

info$`B1-when` <- factor(info$`B1-when`, levels = c("during", "after", "later"))
info$`B1-when` <- ordered(info$`B1-when`)

info$`B2-name` <- factor(info$`B2-name`)
info$`B2-opns` <- factor(info$`B2-opns`)
info$`B2-meds` <- factor(info$`B2-meds`)
info$`B2-trtm` <- factor(info$`B2-trtm`)
info$`B2-dose` <- factor(info$`B2-dose`)
info$`B2-othr` <- factor(info$`B2-othr`)

info$`C-Undr` <- factor(info$`C-Undr`, levels = c("never", "occasionally", "often", "always"))
info$`C-Undr` <- ordered(info$`C-Undr`)

info$`C1-pron` <- factor(info$`C1-pron`)
info$`C1-volm` <- factor(info$`C1-volm`)
info$`C1-atti` <- factor(info$`C1-atti`)
info$`C1-tech` <- factor(info$`C1-tech`)
info$`C1-expn` <- factor(info$`C1-expn`)
info$`C1-ordr` <- factor(info$`C1-ordr`)
info$`C1-time` <- factor(info$`C1-time`)
info$`C1-othr` <- factor(info$`C1-othr`)

info$`C2-rept` <- factor(info$`C2-rept`, levels = c("never", "occasionally", "often", "always"))
info$`C2-rept` <- ordered(info$`C2-rept`)

info$`C21-cnfd` <- factor(info$`C21-cnfd`)
info$`C21-ignt` <- factor(info$`C21-ignt`)
info$`C21-bthr` <- factor(info$`C21-bthr`)
info$`C21-latr` <- factor(info$`C21-latr`)
info$`C21-trst` <- factor(info$`C21-trst`)
info$`C21-time` <- factor(info$`C21-time`)
info$`C21-uint` <- factor(info$`C21-uint`)
info$`C21-othr` <- factor(info$`C21-othr`)
info$`D-Mobl` <- factor(info$`D-Mobl`, levels = c("no", "yes", "not sure"))
info$`D1-call` <- factor(info$`D1-call`)
info$`D1-int` <- factor(info$`D1-int`)
info$`D1-napp` <- factor(info$`D1-napp`)
info$`D1-iapp` <- factor(info$`D1-iapp`)
info$`D1-othr` <- factor(info$`D1-othr`)
info$`D2-os` <- factor(info$`D2-os`, levels = c("android", "blackberry", "iOS", "windows", "other", "not sure"))

info$`D3-rcrd` <- factor(info$`D3-rcrd`, levels = c("disagree", "indifferent", "agree"))
info$`D3-rcrd` <- ordered(info$`D3-rcrd`)

info$`D4-trns` <- factor(info$`D4-trns`, levels = c("disagree", "indifferent", "agree"))
info$`D4-trns` <- ordered(info$`D4-trns`)

info$`D5-defs` <- factor(info$`D5-defs`, levels = c("disagree", "indifferent", "agree"))
info$`D5-defs` <- ordered(info$`D5-defs`)

info$`D6-note` <- factor(info$`D6-note`, levels = c("disagree", "indifferent", "agree"))
info$`D6-note` <- ordered(info$`D6-note`)

info$`D7-use` <- factor(info$`D7-use`, levels = c("no", "maybe", "yes"))
info$`D7-use` <- ordered(info$`D7-use`)

# Table with all the data
summary(info)

###################################
#
# INFO ANALYSIS
#

# General info histograms
# Ex: ggplot() + aes(info$Age) + geom_histogram(stat="count") + labs(title="Age distribution") + labs(x="Age")

###########################
#VARIABLES
###########################
barfill <- "#0081AF"
barlines <- "#0B4F6C"
x <- info$Gend

##########################
#Pie
################
p <- ggplot(x, aes(x=1, y=time, fill=activity)) +
  geom_bar(stat="identity") +
  ggtitle("How I've spent my PhD hours this week")
print(p)
#################

#Vertical
################
ggplot() + aes(x) + geom_bar(aes(y = (..count..)/sum(..count..)*100),colour = barlines, fill = barfill) + labs(x="Gender") + labs(y="Percentage") + theme_bw() +
  theme(axis.line = element_blank(),
        panel.grid.major = element_line(colour = "#d3d3d3"),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank(),
        plot.title = element_text(size = 14, face = "bold"),
        axis.text.x=element_text(colour="black", size = 9),
        axis.text.y=element_text(colour="black", size = 9))
################

#Horizontal
################
ggplot() + aes(x) + geom_bar(aes(y = (..count..)/sum(..count..)*100),colour = barlines, fill = barfill) + labs(x="Gender") + labs(y="Percentage") + theme_bw() + coord_flip() +
  theme(axis.line = element_blank(),
        panel.grid.major = element_line(colour = "#d3d3d3"),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(), panel.background = element_blank(),
        plot.title = element_text(size = 14, face = "bold"),
        axis.text.x=element_text(colour="black", size = 9),
        axis.text.y=element_text(colour="black", size = 9))
################



ggplot() + aes(info$Age) + geom_histogram(stat="count") + labs(title="Age distribution") + labs(x="Age")
ggplot() + aes(info$Qual) + geom_histogram(stat="count") + labs(title="Qualifications distribution") + labs(x="Qualifications")
ggplot() + aes(info$`A-Note`) + geom_histogram(stat="count") + labs(title="Do you take health information notes?") + labs(x="Takes health information notes")
ggplot() + aes(info$`D-Mobl`) + geom_histogram(stat="count") + labs(title="Do you have a smartphone or tablet?") + labs(x="Has smartphone/tablet")



###################################
###################################
# Pie charts
lbls <- paste(names(info$Gend), "\n", info$Gend, sep="")
pie(info$Gend, labels = lbls, x=1,
    main="Pie Chart of Species\n (with sample sizes)")

p = ggplot(data=df, 
           aes(x=factor(1),
               y=Summary,
               fill = factor(info$Gend)
           )
) 
p=p + geom_bar(width = 1) 
p=p+facet_grid(facets=. ~ gender)

# Frequency tables
attach(info)
altgend <- factor(info$Gend, levels = c("male","female")) #removing "other" gender
altqual <- factor(info$Qual, levels = c("12th grade", "bachelor's degree", "master's degree", "doctoral degree")) #removing everything below 12th grade
altage <- factor(info$Age, levels = c("18-25 years old", "26-35 years old", "36-49 years old", "50-64 years old")) #removing 65+ years old

# Chi-square Test
M <- info$`A2-wght`
N <- info$`A2-cals`
mytable <- xtabs(~M+N, data=info)
#ftable(mytable)
summary(mytable)

# Alternative Chi-square
tbl = table(altqual, info$`A1-own`)
tbl
chisq.test(tbl)

# 3-way frequency table
Gender <- altgend
Age <- altage
Qualifications <- altqual
tab <- table(Age, Qualifications, Gender)
ftable(tab)
lnames <- list(Gender = c("M","F"), Age = c("18","26", "36", "50", "65"), Qualifications = c("12", "B", "M", "D"))
mosaic(tab, set_labels=lnames, shade=TRUE, legend=TRUE)
mosaic(tab, shade=TRUE, legend=TRUE)
assoc(tab, shade=TRUE)

# Loglinear Models
A <- altgend
B <- altage
C <- info$`A-Note`
mytable <- xtabs(~A+B+C, data=info)
loglm(~A+B+C, mytable) #A, B & C are pairwise independent
loglin(~A+B+C+B*C, mytable) #A is partially independent of B and C
loglm(~A+B+C+A*C+B*C, mytable) #A is independent of B, given C
loglm(~A+B+C+A*B+A*C+B*C, mytable) #no three-way interaction

# Scatter plots
#plot(hexbin(info$Age, info$`D-Mobl`, xbins=40))
#plot(hexbin(info$Frgt, info$Age, xbins=40))

# Total values (= summary info)
#mytable <- table(info$Gend,info$Age)
#margin.table(mytable, 1)
#margin.table(mytable,2)

# Other possible graphs
plot(altage,info$`D-Mobl`)

# More resources
# pie3d -- library(plotrix)
#qqnorm(info$Age, plot.it = TRUE)
#pairs(cor(info[,c(5,6,7,8)]))
#with(mtcars, boxplot(info$Age, info$`D-Mobl`)) #doesn't make sense with discrete data