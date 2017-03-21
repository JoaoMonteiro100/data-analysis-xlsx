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
info$Qual <- factor(info$Qual, levels = c("lower than 4th grade", "4th grade", "9th grade", "12th grade", "bachelor's degree", "master's degree", "doctoral degree"))
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
info$Dnot <- factor(info$Dnot, levels = c("never", "occasionally", "often", "always"))
info$`B-Cnot` <- factor(info$`B-Cnot`, levels = c("never", "occasionally", "often", "always"))
info$`B1-when` <- factor(info$`B1-when`, levels = c("during", "after", "later"))
info$`B2-name` <- factor(info$`B2-name`)
info$`B2-opns` <- factor(info$`B2-opns`)
info$`B2-meds` <- factor(info$`B2-meds`)
info$`B2-trtm` <- factor(info$`B2-trtm`)
info$`B2-dose` <- factor(info$`B2-dose`)
info$`B2-othr` <- factor(info$`B2-othr`)
info$`C-Undr` <- factor(info$`C-Undr`, levels = c("never", "occasionally", "often", "always"))
info$`C1-pron` <- factor(info$`C1-pron`)
info$`C1-volm` <- factor(info$`C1-volm`)
info$`C1-atti` <- factor(info$`C1-atti`)
info$`C1-tech` <- factor(info$`C1-tech`)
info$`C1-expn` <- factor(info$`C1-expn`)
info$`C1-ordr` <- factor(info$`C1-ordr`)
info$`C1-time` <- factor(info$`C1-time`)
info$`C1-othr` <- factor(info$`C1-othr`)
info$`C2-rept` <- factor(info$`C2-rept`, levels = c("never", "occasionally", "often", "always"))
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
info$`D4-trns` <- factor(info$`D4-trns`, levels = c("disagree", "indifferent", "agree"))
info$`D5-defs` <- factor(info$`D5-defs`, levels = c("disagree", "indifferent", "agree"))
info$`D6-note` <- factor(info$`D6-note`, levels = c("disagree", "indifferent", "agree"))
info$`D7-use` <- factor(info$`D7-use`, levels = c("no", "maybe", "yes"))

# Table with all the data
summary(info)


#
# INFO ANALYSIS
#


# General info histograms
ggplot() + aes(info$Gend) + geom_histogram(stat="count") + labs(title="Gender distribution") + labs(x="Gender")
ggplot() + aes(info$Age) + geom_histogram(stat="count") + labs(title="Age distribution") + labs(x="Age")
ggplot() + aes(info$Qual) + geom_histogram(stat="count") + labs(title="Qualifications distribution") + labs(x="Qualifications")
ggplot() + aes(info$`A-Note`) + geom_histogram(stat="count") + labs(title="Do you take health information notes?") + labs(x="Takes health information notes")
ggplot() + aes(info$`D-Mobl`) + geom_histogram(stat="count") + labs(title="Do you have a smartphone or tablet?") + labs(x="Has smartphone/tablet")

########################################################
# About whom do you take notes?
countown <- length(which(info$`A1-own` == "yes"))
countfam <- length(which(info$`A1-fam` == "yes"))
countfrnd <- length(which(info$`A1-frnd` == "yes"))
countothr <- length(which(info$`A1-othr` == "yes"))
countswhom <- c(countown, countfam, countfrnd, countothr)
barplot(countswhom, main="Respondents register health information from...", horiz=TRUE,
        names.arg=c("Theirselves", "Family", "Friend", "Other"),
        xlab="Number of answers",
        legend = rownames(counts), beside=TRUE)

infowhom <- info[, c(5,6,7,8)]
infowhom <- na.omit(infowhom)
infowhom$`A1-own` <- infowhom$`A1-own` == "yes"
infowhom$`A1-fam` <- infowhom$`A1-fam` == "yes"
infowhom$`A1-frnd` <- infowhom$`A1-frnd` == "yes"
infowhom$`A1-othr` <- infowhom$`A1-othr` == "yes"

infowhom$justone <- infowhom$`A1-own`&!infowhom$`A1-fam`&!infowhom$`A1-frnd`&!infowhom$`A1-othr`
infowhom$oneandtwo <- infowhom$`A1-own`&infowhom$`A1-fam`
infowhom$oneandtwoandthree <- infowhom$`A1-own`&infowhom$`A1-fam`&infowhom$`A1-frnd`
infowhom$twoandthree <- infowhom$`A1-fam`&infowhom$`A1-frnd`
infowhom$allbutone <- !infowhom$`A1-own`

countwjustone <- length(which(infowhom$justone == TRUE))
countwoneandtwo <- length(which(infowhom$oneandtwo == TRUE))
countwoneandtwoandthree <- length(which(infowhom$oneandtwoandthree == TRUE))
countwtwoandthree <- length(which(infowhom$twoandthree == TRUE))
countwallbutone <- length(which(infowhom$allbutone == TRUE))
countswhomspecifically <- c(countwjustone,countwoneandtwo,countwoneandtwoandthree,countwallbutone)

barplot(countswhomspecifically, main="Respondents register health information from...", horiz=TRUE,
        names.arg=c("Only own", "Own & Fam", "All 3", "Not self"),
        xlab="Number of answers",
        legend = rownames(counts), beside=TRUE)


## Females
Finfowhom <- info[info$Gend!="male" & info$Gend!="other",]
Finfowhom <- Finfowhom[, c(5,6,7,8)]

Finfowhom <- na.omit(Finfowhom)
Finfowhom$`A1-own` <- Finfowhom$`A1-own` == "yes"
Finfowhom$`A1-fam` <- Finfowhom$`A1-fam` == "yes"
Finfowhom$`A1-frnd` <- Finfowhom$`A1-frnd` == "yes"
Finfowhom$`A1-othr` <- Finfowhom$`A1-othr` == "yes"

Finfowhom$justone <- Finfowhom$`A1-own`&!Finfowhom$`A1-fam`&!Finfowhom$`A1-frnd`&!Finfowhom$`A1-othr`
Finfowhom$oneandtwo <- Finfowhom$`A1-own`&Finfowhom$`A1-fam`
Finfowhom$oneandtwoandthree <- Finfowhom$`A1-own`&Finfowhom$`A1-fam`&Finfowhom$`A1-frnd`
Finfowhom$twoandthree <- Finfowhom$`A1-fam`&Finfowhom$`A1-frnd`
Finfowhom$allbutone <- !Finfowhom$`A1-own`

Fcountwjustone <- length(which(Finfowhom$justone == TRUE))
Fcountwoneandtwo <- length(which(Finfowhom$oneandtwo == TRUE))
Fcountwoneandtwoandthree <- length(which(Finfowhom$oneandtwoandthree == TRUE))
Fcountwtwoandthree <- length(which(Finfowhom$twoandthree == TRUE))
Fcountwallbutone <- length(which(Finfowhom$allbutone == TRUE))
Fcountswhomspecifically <- c(Fcountwjustone,Fcountwoneandtwo,Fcountwoneandtwoandthree,Fcountwallbutone)

barplot(Fcountswhomspecifically, main="Respondents register health information from...", horiz=TRUE,
        names.arg=c("Only own", "Own & Fam", "All 3", "Not self"),
        xlab="Number of answers (Females)",
        legend = rownames(counts), beside=TRUE)

## Males
Minfowhom <- info[info$Gend!="female" & info$Gend!="other",]
Minfowhom <- Minfowhom[, c(5,6,7,8)]

Minfowhom <- na.omit(Minfowhom)
Minfowhom$`A1-own` <- Minfowhom$`A1-own` == "yes"
Minfowhom$`A1-fam` <- Minfowhom$`A1-fam` == "yes"
Minfowhom$`A1-frnd` <- Minfowhom$`A1-frnd` == "yes"
Minfowhom$`A1-othr` <- Minfowhom$`A1-othr` == "yes"

Minfowhom$justone <- Minfowhom$`A1-own`&!Minfowhom$`A1-fam`&!Minfowhom$`A1-frnd`&!Minfowhom$`A1-othr`
Minfowhom$oneandtwo <- Minfowhom$`A1-own`&Minfowhom$`A1-fam`
Minfowhom$oneandtwoandthree <- Minfowhom$`A1-own`&Minfowhom$`A1-fam`&Minfowhom$`A1-frnd`
Minfowhom$twoandthree <- Minfowhom$`A1-fam`&Minfowhom$`A1-frnd`
Minfowhom$allbutone <- !Minfowhom$`A1-own`

Mcountwjustone <- length(which(Minfowhom$justone == TRUE))
Mcountwoneandtwo <- length(which(Minfowhom$oneandtwo == TRUE))
Mcountwoneandtwoandthree <- length(which(Minfowhom$oneandtwoandthree == TRUE))
Mcountwtwoandthree <- length(which(Minfowhom$twoandthree == TRUE))
Mcountwallbutone <- length(which(Minfowhom$allbutone == TRUE))
Mcountswhomspecifically <- c(Mcountwjustone,Mcountwoneandtwo,Mcountwoneandtwoandthree,Mcountwallbutone)

barplot(Mcountswhomspecifically, main="Respondents register health information from...", horiz=TRUE,
        names.arg=c("Only own", "Own & Fam", "All 3", "Not self"),
        xlab="Number of answers (Males)",
        legend = rownames(counts), beside=TRUE)

## Youngsters
Yinfowhom <- info[info$Age!="26-35 years old" & info$Age!="36-49 years old" & info$Age!="50-64 years old" & info$Age !="65+ years old",]
Yinfowhom <- Yinfowhom[, c(5,6,7,8)]

Yinfowhom <- na.omit(Yinfowhom)
Yinfowhom$`A1-own` <- Yinfowhom$`A1-own` == "yes"
Yinfowhom$`A1-fam` <- Yinfowhom$`A1-fam` == "yes"
Yinfowhom$`A1-frnd` <- Yinfowhom$`A1-frnd` == "yes"
Yinfowhom$`A1-othr` <- Yinfowhom$`A1-othr` == "yes"

Yinfowhom$justone <- Yinfowhom$`A1-own`&!Yinfowhom$`A1-fam`&!Yinfowhom$`A1-frnd`&!Yinfowhom$`A1-othr`
Yinfowhom$oneandtwo <- Yinfowhom$`A1-own`&Yinfowhom$`A1-fam`
Yinfowhom$oneandtwoandthree <- Yinfowhom$`A1-own`&Yinfowhom$`A1-fam`&Yinfowhom$`A1-frnd`
Yinfowhom$twoandthree <- Yinfowhom$`A1-fam`&Yinfowhom$`A1-frnd`
Yinfowhom$allbutone <- !Yinfowhom$`A1-own`

Ycountwjustone <- length(which(Yinfowhom$justone == TRUE))
Ycountwoneandtwo <- length(which(Yinfowhom$oneandtwo == TRUE))
Ycountwoneandtwoandthree <- length(which(Yinfowhom$oneandtwoandthree == TRUE))
Ycountwtwoandthree <- length(which(Yinfowhom$twoandthree == TRUE))
Ycountwallbutone <- length(which(Yinfowhom$allbutone == TRUE))
Ycountswhomspecifically <- c(Ycountwjustone,Ycountwoneandtwo,Ycountwoneandtwoandthree,Ycountwallbutone)

barplot(Ycountswhomspecifically, main="Respondents register health information from...", horiz=TRUE,
        names.arg=c("Only own", "Own & Fam", "All 3", "Not self"),
        xlab="Number of answers (18-25 years old)",
        legend = rownames(counts), beside=TRUE)

## Adults
Ainfowhom <- info[info$Age!="18-25 years old" & info$Age!="26-35 years old" & info$Age!="36-49 years old",]
Ainfowhom <- Ainfowhom[, c(5,6,7,8)]

Ainfowhom <- na.omit(Ainfowhom)
Ainfowhom$`A1-own` <- Ainfowhom$`A1-own` == "yes"
Ainfowhom$`A1-fam` <- Ainfowhom$`A1-fam` == "yes"
Ainfowhom$`A1-frnd` <- Ainfowhom$`A1-frnd` == "yes"
Ainfowhom$`A1-othr` <- Ainfowhom$`A1-othr` == "yes"

Ainfowhom$justone <- Ainfowhom$`A1-own`&!Ainfowhom$`A1-fam`&!Ainfowhom$`A1-frnd`&!Ainfowhom$`A1-othr`
Ainfowhom$oneandtwo <- Ainfowhom$`A1-own`&Ainfowhom$`A1-fam`
Ainfowhom$oneandtwoandthree <- Ainfowhom$`A1-own`&Ainfowhom$`A1-fam`&Ainfowhom$`A1-frnd`
Ainfowhom$twoandthree <- Ainfowhom$`A1-fam`&Ainfowhom$`A1-frnd`
Ainfowhom$allbutone <- !Ainfowhom$`A1-own`

Acountwjustone <- length(which(Ainfowhom$justone == TRUE))
Acountwoneandtwo <- length(which(Ainfowhom$oneandtwo == TRUE))
Acountwoneandtwoandthree <- length(which(Ainfowhom$oneandtwoandthree == TRUE))
Acountwtwoandthree <- length(which(Ainfowhom$twoandthree == TRUE))
Acountwallbutone <- length(which(Ainfowhom$allbutone == TRUE))
Acountswhomspecifically <- c(Acountwjustone,Acountwoneandtwo,Acountwoneandtwoandthree,Acountwallbutone)

barplot(Acountswhomspecifically, main="Respondents register health information from...", horiz=TRUE,
        names.arg=c("Only own", "Own & Fam", "All 3", "Not self"),
        xlab="Number of answers (50+ years old)",
        legend = rownames(counts), beside=TRUE)

## Qualifications
Ainfowhom <- info[info$Qual!="bachelor's degree" & info$Qual!="master's degree" & info$Qual!="doctoral degree",]
Ainfowhom <- Ainfowhom[, c(5,6,7,8)]

Ainfowhom <- na.omit(Ainfowhom)
Ainfowhom$`A1-own` <- Ainfowhom$`A1-own` == "yes"
Ainfowhom$`A1-fam` <- Ainfowhom$`A1-fam` == "yes"
Ainfowhom$`A1-frnd` <- Ainfowhom$`A1-frnd` == "yes"
Ainfowhom$`A1-othr` <- Ainfowhom$`A1-othr` == "yes"

Ainfowhom$justone <- Ainfowhom$`A1-own`&!Ainfowhom$`A1-fam`&!Ainfowhom$`A1-frnd`&!Ainfowhom$`A1-othr`
Ainfowhom$oneandtwo <- Ainfowhom$`A1-own`&Ainfowhom$`A1-fam`
Ainfowhom$oneandtwoandthree <- Ainfowhom$`A1-own`&Ainfowhom$`A1-fam`&Ainfowhom$`A1-frnd`
Ainfowhom$twoandthree <- Ainfowhom$`A1-fam`&Ainfowhom$`A1-frnd`
Ainfowhom$allbutone <- !Ainfowhom$`A1-own`

Acountwjustone <- length(which(Ainfowhom$justone == TRUE))
Acountwoneandtwo <- length(which(Ainfowhom$oneandtwo == TRUE))
Acountwoneandtwoandthree <- length(which(Ainfowhom$oneandtwoandthree == TRUE))
Acountwtwoandthree <- length(which(Ainfowhom$twoandthree == TRUE))
Acountwallbutone <- length(which(Ainfowhom$allbutone == TRUE))
Acountswhomspecifically <- c(Acountwjustone,Acountwoneandtwo,Acountwoneandtwoandthree,Acountwallbutone)

barplot(Acountswhomspecifically, main="Respondents register health information from...", horiz=TRUE,
        names.arg=c("Only own", "Own & Fam", "All 3", "Not self"),
        xlab="Number of answers (12th grade)",
        legend = rownames(counts), beside=TRUE)

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
tbl = table(altgend, info$`A-Note`)
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