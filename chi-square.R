# Frequency tables
attach(info)
altgend <- factor(info$Gend, levels = c("male","female")) #removing "other" gender
altqual <- factor(info$Qual, levels = c("12th grade", "bachelor's degree", "master's degree", "doctoral degree")) #removing everything below 12th grade
altage <- factor(info$Age, levels = c("18-25 years old", "26-35 years old", "36-49 years old", "50-64 years old")) #removing 65+ years old

# 2-way frequency table - notes (own, fam, frnd, othr)

##### VARIABLE (GENDER, AGE, OR QUALS) #####
X <- altgend

#---
Y <- info$`A1-own`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]

# Contingency tables
prop.table(mytable)
prop.table(mytable,1)
prop.table(mytable,2)

prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`A1-fam`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`A1-frnd`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`A1-othr`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#######################################################
#######################################################
Y <- info$`A2-wght`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`A2-cals`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`A2-hrt`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`A2-prss`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`A2-sypt`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`A2-ills`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`A2-tpcs`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`A2-onln`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`A2-anls`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`A2-othr`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#######################################################
#######################################################
Y <- info$`A3-papr`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`A3-book`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`A3-napp`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`A3-sapp`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`A3-othr`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#######################################################
#######################################################
Y <- info$`B2-name`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`B2-opns`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`B2-meds`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`B2-trtm`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`B2-dose`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`B2-othr`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#######################################################
#######################################################
Y <- info$`C21-cnfd`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`C21-ignt`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`C21-bthr`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`C21-latr`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`C21-trst`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`C21-time`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`C21-uint`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#---
Y <- info$`C21-othr`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#######################################################
#######################################################
#Y <- info$`A-Note`
#mytable <- table(X,Y)
#mytable <- mytable[,c("yes","no")]
#prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim

#######################################################
#######################################################
# Chi-square Test
#N <- info$`A-Note`
#mytable <- xtabs(~X+N, data=info)
#ftable(mytable)
#summary(mytable)

#######################################################


# FALTA INFO NOTE


#######################################################
##
# USE THIS FOR QUALS & AGE VVVV
# BUT INVERT VARIABLES (columns = quals/age)
# vvvvvvvvvvvvvvvvvvvvvv

Y <- info$Frgt
mytable <- table(X,Y)
mytable <- mytable[,c("never","occasionally","often","always")]
mytablemale <- mytable["male",]
mytablefemale <- mytable["female",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytablemale, mytabletotal)
prop.trend.test(mytablemale, mytabletotal)
prop.test(mytablefemale, mytabletotal)
prop.trend.test(mytablefemale, mytabletotal)

Y <- info$Dnot
mytable <- table(X,Y)
mytable <- mytable[,c("never","occasionally","often","always")]
mytablemale <- mytable["male",]
mytablefemale <- mytable["female",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytablemale, mytabletotal)
prop.trend.test(mytablemale, mytabletotal)
prop.test(mytablefemale, mytabletotal)
prop.trend.test(mytablefemale, mytabletotal)
##################################

Y <- info$Frgt
mytable <- table(Y,X)
mytablenever <- mytable["never",]
mytableoccasionally <- mytable["occasionally",]
mytableoften <- mytable["often",]
mytablealways <- mytable["always",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytablenever, mytabletotal)
prop.test(mytableoccasionally, mytabletotal)
prop.test(mytableoften, mytabletotal)
prop.test(mytablealways, mytabletotal)

#---
Y <- info$Dnot
mytable <- table(Y,X)
mytablenever <- mytable["never",]
mytableoccasionally <- mytable["occasionally",]
mytableoften <- mytable["often",]
mytablealways <- mytable["always",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytablenever, mytabletotal)
prop.test(mytableoccasionally, mytabletotal)
prop.test(mytableoften, mytabletotal)
prop.test(mytablealways, mytabletotal)

#---
Y <- info$`B-Cnot`
mytable <- table(Y,X)
mytablenever <- mytable["never",]
mytableoccasionally <- mytable["occasionally",]
mytableoften <- mytable["often",]
mytablealways <- mytable["always",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytablenever, mytabletotal)
prop.test(mytableoccasionally, mytabletotal)
prop.test(mytableoften, mytabletotal)
prop.test(mytablealways, mytabletotal)

#---
Y <- info$`B1-when`
mytable <- table(Y,X)
mytableduring <- mytable["during",]
mytableafter <- mytable["after",]
mytablelater <- mytable["later",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableduring, mytabletotal)
prop.test(mytableafter, mytabletotal)
prop.test(mytablelater, mytabletotal)

#---
Y <- info$`C-Undr`
mytable <- table(Y,X)
mytablenever <- mytable["never",]
mytableoccasionally <- mytable["occasionally",]
mytableoften <- mytable["often",]
mytablealways <- mytable["always",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytablenever, mytabletotal)
prop.test(mytableoccasionally, mytabletotal)
prop.test(mytableoften, mytabletotal)
prop.test(mytablealways, mytabletotal)

#---
Y <- info$`C2-rept`
mytable <- table(Y,X)
mytablenever <- mytable["never",]
mytableoccasionally <- mytable["occasionally",]
mytableoften <- mytable["often",]
mytablealways <- mytable["always",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytablenever, mytabletotal)
prop.test(mytableoccasionally, mytabletotal)
prop.test(mytableoften, mytabletotal)
prop.test(mytablealways, mytabletotal)

#---
Y <- info$`D7-use`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytablemaybe <- mytable["maybe",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableno, mytabletotal)
prop.test(mytablemaybe, mytabletotal)
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