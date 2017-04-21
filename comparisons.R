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