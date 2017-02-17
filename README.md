# Data Analysis
This repository consists of 2 complementary parts: a Java parser and an R analyser of the resulting excel file. It was done for a research within the scope of HealthTalks.

## Java parser
It reads and merges two excel files into one, formatting it according to the specifications.

### Instructions
Just run the file `src/Parser.java`.

### Requirements
* Apache POI (XSSF) - [download](https://poi.apache.org/download.html) | [guide](http://poi.apache.org/spreadsheet/quick-guide.html)

> *NOTE:* This program only works for two specific `.xlsx` files, which are the result of two surveys in Google Forms (available [here](https://goo.gl/forms/6mI6VKjHS0k6Lg1G2 "HealthTalks Questionnaire")). The resulting file is another `.xlsx` file, formatted in a way that it is easier to analyse in R.

---

## R analysis
It has alternative (shorter) header names for the data read from the excel file, as well as several graphs that use those variables.

### Instructions
Open the file `analysis.R` and install all the necessary packages (comments in the first lines). Run all the other functions before `INFO ANALYSIS` to set the variables, and the ones afterwards to create the graphs.

> *NOTE:* These instructions only work on the excel file created by `src/Parser.java`.
