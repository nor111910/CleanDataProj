#############################################
# run_analysis.R
# R script
#--------------------------------------------
# Purpose:
# This script runs analysis on UCI HAR Dataset.
#
#############################################
# libraries


######################
# variables
######################
activityFile   <- testDataPath   <- "UCI HAR Dataset/activity_labels.txt"
featuresFile   <- testDataPath   <- "UCI HAR Dataset/features.txt"

#testDataPath   <- "UCI HAR Dataset/test"
testXdataFile  <- "UCI HAR Dataset/test/X_test.txt"
testYdataFile  <- "UCI HAR Dataset/test/y_test.txt"
testSubjFile   <- "UCI HAR Dataset/test/subject_test.txt"

#trainDataPath  <- "UCI HAR Dataset/train"
trainXdataFile <- "UCI HAR Dataset/train/X_train.txt"
trainYdataFile <- "UCI HAR Dataset/train/y_train.txt"
trainSubjFile  <- "UCI HAR Dataset/train/subject_train.txt"



##################################
### Main processing section
##################################

##
## process steps:
## 1. check if data set exists
##    if not download and unzip the data set
## 2. set up feature and activity lables
##    A. read featrue file
##    B. extract mean() and std() columns
##    C. remove punctuation from feature lables
##    D. convert feature lables to lower case
##    E. read activity lables
## 3. create data.frame of X and Y test data
## 4. create data.frame of X and Y train data
## 5. combine test data and train data into project data data.frame
## 6. compute averages for each subject/activity measurement values
## 7. write out the tidy dataset
##


## Step 1
## check for file
##
message("1. Checking for UCI HAR Dataset")

if(!file.exists("./UCI HAR Dataset"))
  {
	message("   File not found... downloading")
	setInternet2(TRUE)
	webFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	locFile <- "dlfile.zip"
	download.file(webFile,locFile)
	unzip(locFile)
  } else {
	message("   File found")
  }	

## Step 2
## Setup feature and activity lables
##
message("2. reading feature lables")

## step 2.A
## read feature lables
featureLables <- read.table(featuresFile,sep="",header=F,as.is=T)

## step 2.B
## extract mean() and std() features
##
lm=grep("mean\\(",featureLables$V2,value=F)  # list of mean() column values
lsd=grep("std\\(",featureLables$V2,value=F)  # list of std() column values
l=c(lm,lsd)                                  # combined list of mean and std column values
l=sort(l)                                    # sorted list
includeCols=l                                # reassign list to clear var name

## step 2.C
## remove punctuation from feature lables
##
featureLables=gsub( "[[:punct:]]" ,""  ,featureLables$V2)

## step 2.D
## convert feature lables to lower case
##
featureLables=sapply(featureLables,function(x) {tolower(x)})

## step 2.E
## read activity lables
##
activityLables <- read.table(activityFile,sep="",header=F,as.is=T)


## step 3
## test data
message("3. read test data")
testXdataAll  <- read.table(testXdataFile,sep="",header=F)               # read X data
testXdata     <- testXdataAll[,c(includeCols)]                           # keep only selected columns
testYdata     <- read.table(testYdataFile,sep="",header=F)               # read Y data
testYAC       <- sapply(testYdata$V1,function(x) {activityLables[x,2]} ) # sub activity numbers with names
testSubj      <- read.table(testSubjFile,sep="",header=F)                # read subject data
testData      <- cbind(testSubj,testYAC,testXdata)                       # combine all test data
colnames(testData) <- c("Subject","Activity",featureLables[includeCols]) # assign column names


## step 4
## train data
message("4. reading test data")
trainXdataAll <- read.table(trainXdataFile,sep="",header=F)               # read X data
trainXdata    <- trainXdataAll[,c(includeCols)]                           # keep only selected columns
trainYdata    <- read.table(trainYdataFile,sep="",header=F)               # read Y data
trainYAC      <- sapply(trainYdata$V1,function(x) {activityLables[x,2]} ) # sub activity numbers with names
trainSubj     <- read.table(trainSubjFile,sep="",header=F)                # read subject data
trainData     <- cbind(trainSubj,trainYAC,trainXdata)                     # combine all train data
colnames(trainData) <- c("Subject","Activity",featureLables[includeCols]) # assign column names


## step 5
## combining data
message("5. combining test and train data")
projData <- rbind(testData,trainData)
colnames(projData) <- c("Subject","Activity",featureLables[includeCols])


## step 6
## compute avgs for subject,activity
message("6. Compute subject,activity avgs")
subject=projData$Subject
activity=projData$Activity
nc <- ncol(projData)
tidyData=aggregate( projData[,3:nc] ,list(subject,activity) , FUN=mean )
colnames(tidyData) <- c("Subject","Activity",featureLables[includeCols])

## step 7
## writing data files
message("7. writing datasets")
write.table(tidyData,"projData.txt",sep=",",row.names=F,col.names=T,quote=F)
write.table(tidyData,"tidyData.txt",sep=",",row.names=F,col.names=T,quote=F)

message("---- Eof of process ---")

######## EOF ###########