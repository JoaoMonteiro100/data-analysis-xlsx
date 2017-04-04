# Frequency tables
attach(info)
altgend <- factor(info$Gend, levels = c("male","female")) #removing "other" gender
altqual <- factor(info$Qual, levels = c("12th grade", "bachelor's degree", "master's degree", "doctoral degree")) #removing everything below 12th grade
altage <- factor(info$Age, levels = c("18-25 years old", "26-35 years old", "36-49 years old", "50-64 years old")) #removing 65+ years old

# 2-way frequency table - notes (own, fam, frnd, othr)

##### VARIABLE (GENDER, AGE, OR QUALS) #####
X <- altqual

#---
Y <- info$`A-Note`
mytable <- table(Y,X)
mytableno <- mytable["no",]
mytableyes <- mytable["yes",]
mytabletotal <- margin.table(mytable,2)
prop.test(mytableno, mytabletotal)
prop.trend.test(mytableno, mytabletotal)
prop.test(mytableyes, mytabletotal)
prop.trend.test(mytableyes, mytabletotal)

#---
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

