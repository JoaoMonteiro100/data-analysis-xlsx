# Data Analysis
This repository consists of 2 complementary parts: a Java parser and an R analyser of the resulting excel file. It was done for a research within the scope of HealthTalks.

## Java parser
The Java portion of this repository can only work on specific `.xlsx` files, which are the result of a survey in Google Forms (available [here](https://goo.gl/forms/6mI6VKjHS0k6Lg1G2 "HealthTalks Questionnaire")). Its result is another `.xlsx` file, formatted in a way that it is easier to analyse in R.

### Requirements
* Apache POI (XSSF) - [download](https://poi.apache.org/download.html) | [guide](http://poi.apache.org/spreadsheet/quick-guide.html)
* Original excel files

## R analysis
First you have to uncomment and run the lines of code in the `PACKAGES TO INSTALL` section at the beginning of the file. After that, run all other lines before `INFO ANALYSIS` to set the variables. Afterwards, run any or all commands in that section, depending on what you intend to analyse.

### Requirements
* Formatted excel file
