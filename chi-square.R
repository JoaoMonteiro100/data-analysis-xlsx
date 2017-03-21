# Frequency tables
attach(info)
altgend <- factor(info$Gend, levels = c("male","female")) #removing "other" gender
altqual <- factor(info$Qual, levels = c("12th grade", "bachelor's degree", "master's degree", "doctoral degree")) #removing everything below 12th grade
altage <- factor(info$Age, levels = c("18-25 years old", "26-35 years old", "36-49 years old", "50-64 years old")) #removing 65+ years old

# 2-way frequency table - notes (own, fam, frnd, othr)

##### VARIABLE (GENDER, AGE, OR QUALS) #####
X <- altqual

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
Y <- info$`A-Note`
mytable <- table(X,Y)
mytable <- mytable[,c("yes","no")]
prop.test(mytable,correct=FALSE) #prop1 sao homens, prop2 mulheres; estes sao os sim


#######################################################
#######################################################
# Chi-square Test
N <- info$`A-Note`
mytable <- xtabs(~X+N, data=info)
#ftable(mytable)
summary(mytable)