###############################################################################
##	Project Title:	Final Peer Reviewed Project, Getting and Cleaning Data#
##	File Title:		run_analysis.R                                        #
##	Author:		John Rogard Tabori                                    #
##	Date Submitted:	February 8, 2020                                      #
##	Additional Docs:	READ.ME and The Code Book                             #
##	NOTE:  The r-code below may not run correctly on your system as it is   #
##		 specifically tied to my environment.  See my comments in the     #
##		 READ.ME file on how I have handled this issue.                   #
###############################################################################
##	Package Library Calls which are run when working with R; not all of     #
##	the packages are required for the code below.                           #
###############################################################################
library(plyr)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(tidyr)
library(readr)
library(statsr)
library(lubridate)
library(stringr)
library(Hmisc)
library(reshape2)
################################################################################
##	Steps 1-2: r-code for creating a merged "training" and "test" file, as   #
##		     well as a smaller file only containing the average and        #
##		     standard deviation variables that will be used in Steps 3 & 4.#
##	               	                                                       #
################################################################################
TrainDataWithSubjectCode <- read_table2("subject_train.txt", col_names = "subject")
ActivityCodeCol <- read_table2("y_train.txt", col_names = "activitycode")
TAS1 <-cbind(ActivityCodeCol, TrainDataWithSubjectCode)
trainDataVariableNames <- read.csv("features_var_names10.csv", header = FALSE)
trainDataVariableNames2 <- filter(trainDataVariableNames,1,2,3,41,42,43,81,82,83,121,122,123,161,162,163,201,214,227,240,253,266,267,268,294,295,296,345,346,347,373,374,375,424,425,426,452,453,454,503,513,516,526,529,539,542,552,4,5,6,44,45,46,84,85,86,124,125,126,164,165,166,202,215,228,241,254,269,270,271,348,349,350,427,428,429,504,517,530,543)
varVecTDF <- tolower(as.vector(trainDataVariableNames2[ , 2]))
trainData5 <- read_table2("X_train2.txt", col_names = varVecTDF)
Train1 <- select(trainData5, 1,2,3,41,42,43,81,82,83,121,122,123,161,162,163,201,214,227,240,253,266,267,268,294,295,296,345,346,347,373,374,375,424,425,426,452,453,454,503,513,516,526,529,539,542,552,4,5,6,44,45,46,84,85,86,124,125,126,164,165,166,202,215,228,241,254,269,270,271,348,349,350,427,428,429,504,517,530,543)
Train1F <- cbind(TAS1, Train1)
Train1F <- mutate(Train1F, testortrain = "TRAIN")
################################################################################
##	Step 1.B:  r-code preparing the projct "test" file to be merged with     #
##		     the "training" file (Train1F)                                 #
################################################################################
TrainDataWithSubjectCode2 <- read_table2("subject_test.txt", col_names = "subject")
ActivityCodeCol2 <- read_table2("y_test.txt", col_names = "activitycode")
TAS2 <-cbind(ActivityCodeCol2, TrainDataWithSubjectCode2)
trainDataVariableNames <- read.csv("features_var_names10.csv", header = FALSE)
trainDataVariableNames2 <- filter(trainDataVariableNames,1,2,3,41,42,43,81,82,83,121,122,123,161,162,163,201,214,227,240,253,266,267,268,294,295,296,345,346,347,373,374,375,424,425,426,452,453,454,503,513,516,526,529,539,542,552,4,5,6,44,45,46,84,85,86,124,125,126,164,165,166,202,215,228,241,254,269,270,271,348,349,350,427,428,429,504,517,530,543)
varVecTDF <- tolower(as.vector(trainDataVariableNames2[ , 2]))
testData5 <- read_table2("X_test.txt", col_names = varVecTDF)
Test1 <- select(testData5, 1,2,3,41,42,43,81,82,83,121,122,123,161,162,163,201,214,227,240,253,266,267,268,294,295,296,345,346,347,373,374,375,424,425,426,452,453,454,503,513,516,526,529,539,542,552,4,5,6,44,45,46,84,85,86,124,125,126,164,165,166,202,215,228,241,254,269,270,271,348,349,350,427,428,429,504,517,530,543)
Test1F <- cbind(TAS2, Test1)
Test1F <-mutate(Test1F, testortrain = "TEST")
##################################################################################
##	Step 1.C - 2:  The r-code below creates fully merged files with all the    #
##			   variables (MF1) and one with only the assignment required   #
##			   variables representing means and standard deviations(MF2).  #
##													   #                                                  #
##################################################################################
MFTR <- cbind(TAS1, trainData5)
MFTR <- mutate(MFTR, testortrain = "TRAIN")
MFTE <- cbind(TAS2, testData5)
MFTE <- mutate(MFTE, testortrain = "TEST")
MF1 <- rbind(MFTR, MFTE)
MF2 <- rbind(Train1F, Test1F)
##################################################################################
##	Steps 3-4:	The r-code below further modifies the raw files generated in   #
##			Steps 1-2 and one smaller file compliant with the assignment.  #
##			All three files are written out as *.csv files to allow for    #
##			further analysis, and where desired, further "tidying".        #
##################################################################################
MF1[,'activitycode']<-factor(MF1[,'activitycode'])
alphaactivitycode <- revalue(MF1[,"activitycode"], c("1" = "WALKING", "2" = "WALKING_UPSTAIRS", "3" = "WALKING_DOWNSTAIRS", "4" = "SITTING", "5" = "STANDING", "6" = "LAYING"))
MF1 <- cbind(alphaactivitycode, MF1)
MF1[,'subject']<-factor(MF1[,'subject'])
write.csv(MF1, 'MF1out.csv')
MF2[,'activitycode']<-factor(MF2[,'activitycode'])
alphaactivitycode <- revalue(MF2[,"activitycode"], c("1" = "WALKING", "2" = "WALKING_UPSTAIRS", "3" = "WALKING_DOWNSTAIRS", "4" = "SITTING", "5" = "STANDING", "6" = "LAYING"))
MF2 <- cbind(alphaactivitycode, MF2)
MF2[,'subject']<-factor(MF2[,'subject'])
MF2Means <- MF2 %>% 
group_by(subject, alphaactivitycode,activitycode,testortrain) %>%
summarise_each(funs(mean))
write.table(MF2Means,"tidyhumanactivitydataset.txt", row.name = FALSE)
write.csv(MF2Means, "MF2Means.csv")
write.csv(MF2, 'MF2out.csv')
MF1vars <- names(MF1)
write.table(MF1vars, "MF1vars.txt",row.name = FALSE)
MF2vars <- names(MF2)
write.table(MF2vars, "MF2vars.txt",row.name = FALSE)
MF2MeltMeansVars <- names(MF2MeltMean)
write.table(MF2MeltMeansVars, "MF2MeltMeanVars.txt",row.name = FALSE)


