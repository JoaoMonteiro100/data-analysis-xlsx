# Frequency tables
attach(info)
altgend <- factor(info$Gend, levels = c("male","female")) #removing "other" gender
altqual <- factor(info$Qual, levels = c("12th grade", "bachelor's degree", "master's degree", "doctoral degree")) #removing everything below 12th grade
altage <- factor(info$Age, levels = c("18-25 years old", "26-35 years old", "36-49 years old", "50-64 years old")) #removing 65+ years old

# 2-way frequency table - notes (own, fam, frnd, othr)

##### VARIABLE (GENDER, AGE, OR QUALS) #####
X <- altage

##---
#Y <- info$Dnot
#mytable <- table(X,Y)
#mytable <- mytable[,c("never","occasionally","often","always")]
#mytablemale <- mytable["male",]
#mytablefemale <- mytable["female",]
#mytabletotal <- margin.table(mytable,2)
#prop.test(mytablemale, mytabletotal)
#prop.trend.test(mytablemale, mytabletotal)
#prop.test(mytablefemale, mytabletotal)
#prop.trend.test(mytablefemale, mytabletotal)

#---
Y <- info$`A-Note`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
#prop.test(mytableno, mytabletotal)
#prop.trend.test(mytableno, mytabletotal)
prop.test(mytableyes, mytabletotal)
#prop.trend.test(mytableyes, mytabletotal)

#---
Y <- info$`A1-own`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`A1-fam`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)


#---
Y <- info$`A1-frnd`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`A1-othr`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`A2-wght`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`A2-cals`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`A2-hrt`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`A2-prss`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`A2-sypt`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`A2-ills`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`A2-tpcs`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`A2-onln`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`A2-anls`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`A2-othr`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`A3-papr`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`A3-book`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`A3-napp`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`A3-sapp`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`A3-othr`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`B2-name`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`B2-dose`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`B2-meds`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`B2-opns`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`B2-trtm`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`B2-othr`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`C1-pron`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`C1-atti`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`C1-expn`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`C1-ordr`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`C1-tech`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`C1-time`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`C1-volm`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`C1-othr`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`C21-cnfd`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`C21-bthr`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`C21-ignt`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`C21-latr`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`C21-time`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`C21-trst`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`C21-uint`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`C21-othr`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`D1-call`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`D1-iapp`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`D1-int`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`D1-napp`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)

#---
Y <- info$`D1-othr`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableyes, mytabletotal)


#####################################
tbl = table(X, info$Frgt)
chisq.test(tbl)

tbl = table(X, info$Dnot)
chisq.test(tbl)

tbl = table(X, info$`B-Cnot`)
chisq.test(tbl)

tbl = table(X, info$`B1-when`)
chisq.test(tbl)

tbl = table(X, info$`C-Undr`)
chisq.test(tbl)

tbl = table(X, info$`C2-rept`)
chisq.test(tbl)

tbl = table(X, info$`D-Mobl`)
chisq.test(tbl)

tbl = table(X, info$`D3-rcrd`)
chisq.test(tbl)

tbl = table(X, info$`D4-trns`)
chisq.test(tbl)

tbl = table(X, info$`D5-defs`)
chisq.test(tbl)

tbl = table(X, info$`D6-note`)
chisq.test(tbl)

tbl = table(X, info$`D7-use`)
chisq.test(tbl)