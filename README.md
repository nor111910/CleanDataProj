R Clean Data project
============================================

This project reads the UCI HAR Dataset from the web site:

  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The process manipulates the data to create a tidy dataset
based on 30 subjects doing 6 activities each providing an 
average of the means and stadard diviations.  The final
result is writen to the out put file for upload to the course project.

Measurements
----------------
The measurements used in the averages were columns with 
mean() and std() only.  This was done to keep out mean/std frequency
and angle of mean/std.

The measurment names were taken from the features.txt file.  
The features are cleaned by removing punctuation and making 
characters lowercase.


The project consists of the following files:
--------------------------------------------
README.md      - information about the project and files
run_analysis.R - analysis script to create the tidy dataset
CodeBook.md    - the codebook for the tidy dataset
tidyData.txt   - tidy dataset (comma separated fields (csv) with headers)


How to run analysis script:
============================================
1. download the analysis script from github site
2. put into your working directory
3. start R
4. setwd() to your working directory
5. run: source("run_analysis.R")
   ** the script follows the process steps below
   the file tidyData.txt will be created in the working directory



Process
============================================
The process used on the dataset to produce the tidy
dataset is as follows:

1. check if data set exists
   -------------------------
   a check is made to see if the UCI HAR Dataset is present in 
   the working directory.  if not then the process pulls the file
   from the web to the working directory and runs unzip on the file.
   if the file does exist then a message saying the file was found
   is printed


2. set up feature and activity lables
   -----------------------------------
   This section runs several steps to set up the feature lables
   that will be used as column headings and activity lables that
   will be used to replace the activity numbers in the Y_data file.

   subSteps:
   ------------
   A. read feature file
      read statement to pull in the feature lables.
   B. extract mean() and std() columns
      the features for mean() and std() only are pulled
      from the feature lables.  The column numbers are stored 
      in the includeCols vector.
   C. remove punctuation from feature lables
      the feature lables are cleaned up by removing punctuations
   D. convert feature lables to lower case
      the feature lables are cast to lower case
   E. read activity lables
      The activity lables are read from the activity file.


3. create data.frame of X and Y test data
   ---------------------------------------
   The test data sets for Y (activity) and x (measurments)
   are read into data frames and combined to get the test data set.
   
   subSteps:
   -------------
   All x (measurements) data set is read
   the data set is trimmed to keep only the included columns
   the Y (activity) data set is read
   the activity numbers are replaced by activity lables
   the test subject data set is read
   the data sets are combined to make the testData set
   column names are added to the testData set


4. create data.frame of X and Y train data
   ----------------------------------------
   The train data sets for Y (activity) and x (measurments)
   are read into data frames and combined to get the train data set.
   
   subSteps:
   -------------
   All x (measurements) data set is read
   the data set is trimmed to keep only the included columns
   the Y (activity) data set is read
   the activity numbers are replaced by activity lables
   the train subject data set is read
   the data sets are combined to make the trainData set
   column names are added to the trainData set


5. combine test data and train data into project data data.frame
   --------------------------------------------------------------
   The testData and trainData sets are combined (appended) to get
   the projData set.  The column names are added to the projData.
 

6. compute averages for each subject/activity measurement values
   -------------------------------------------------------------
   the tidyData set is created by running an aggregate on the 
   measruements for the projData grouping by Subject/Activity.
   The column names are added to the tidyData set.

7. write out the tidy dataset
   --------------------------
   The tidyData set is writen to the working directory as tidyData.txt
   in a CSV format (comma separated fields) with column headings 
   and no quotes or row names.

####### End of README ########