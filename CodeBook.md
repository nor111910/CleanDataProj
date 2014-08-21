CodeBook for Cean Data Tidy data project
----------------------------------------
This codeBook is for the resulting dataset for the Clean Data tidy data project.  
The tidy dataset is in a txt file formated as csv (comma seperated).



Data Source
----------------------------------------
This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" 
which is avaiable at the following link: 

  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Source data consisted of several files for test and train activities. Both test and train
data was kept in their respective folders.  Each has the x_data (measurements), y_data (activities),
and subject lists.  These are to be combine to create subject/activity/measruement dataset layout.
There are 30 subjects that performed 6 activities.  This project required that we use only 
mean and std values for the final averaging in the tidy dataset.



Feature Selection
-----------------------------------------
The measurements kept for the tidy dataset were for mean and standard deviation.  
After review, I chose columns with mean() and std() to be the measurements to represent
the desired averages by subject/activity.





CodeBook for clean data Tidy Data Set
-------------------------------------
```

Variable name           position    Description                DataType   Values
-------------	        ----------  -------------------------  --------   ------
Subject                   1         Subject member performing  Int        1 through 30
                                    test/train activity        
Activity                  2         Activity performed by 
                                    Subject                    Char       WALKING
                                                                          WALKING_UPSTAIRS
                                                                          WALKING_DOWNSTAIRS
                                                                          SITTING
                                                                          STANDING
                                                                          LAYING
     --------------------------- Measurement data ---------------------------
tbodyaccmeanx             3                                    Int
tbodyaccmeany             4                                    Int
tbodyaccmeanz             5                                    Int
tbodyaccstdx              6                                    Int
tbodyaccstdy              7                                    Int
tbodyaccstdz              8                                    Int
tgravityaccmeanx          9                                    Int
tgravityaccmeany         10                                    Int
tgravityaccmeanz         11                                    Int
tgravityaccstdx          12                                    Int
tgravityaccstdy          13                                    Int
tgravityaccstdz          14                                    Int
tbodyaccjerkmeanx        15                                    Int
tbodyaccjerkmeany        16                                    Int
tbodyaccjerkmeanz        17                                    Int
tbodyaccjerkstdx         18                                    Int
tbodyaccjerkstdy         19                                    Int
tbodyaccjerkstdz         20                                    Int
tbodygyromeanx           21                                    Int
tbodygyromeany           22                                    Int
tbodygyromeanz           23                                    Int
tbodygyrostdx            24                                    Int
tbodygyrostdy            25                                    Int
tbodygyrostdz            26                                    Int
tbodygyrojerkmeanx       27                                    Int
tbodygyrojerkmeany       28                                    Int
tbodygyrojerkmeanz       29                                    Int
tbodygyrojerkstdx        30                                    Int
tbodygyrojerkstdy        31                                    Int
tbodygyrojerkstdz        32                                    Int
tbodyaccmagmean          33                                    Int
tbodyaccmagstd           34                                    Int
tgravityaccmagmean       35                                    Int
tgravityaccmagstd        36                                    Int
tbodyaccjerkmagmean      37                                    Int
tbodyaccjerkmagstd       38                                    Int
tbodygyromagmean         39                                    Int
tbodygyromagstd          40                                    Int
tbodygyrojerkmagmean     41                                    Int
tbodygyrojerkmagstd      42                                    Int
fbodyaccmeanx            43                                    Int
fbodyaccmeany            44                                    Int
fbodyaccmeanz            45                                    Int
fbodyaccstdx             46                                    Int
fbodyaccstdy             47                                    Int
fbodyaccstdz             48                                    Int
fbodyaccjerkmeanx        49                                    Int
fbodyaccjerkmeany        50                                    Int
fbodyaccjerkmeanz        51                                    Int
fbodyaccjerkstdx         52                                    Int
fbodyaccjerkstdy         53                                    Int
fbodyaccjerkstdz         54                                    Int
fbodygyromeanx           55                                    Int
fbodygyromeany           56                                    Int
fbodygyromeanz           57                                    Int
fbodygyrostdx            58                                    Int
fbodygyrostdy            59                                    Int
fbodygyrostdz            60                                    Int
fbodyaccmagmean          61                                    Int
fbodyaccmagstd           62                                    Int
fbodybodyaccjerkmagmean  63                                    Int
fbodybodyaccjerkmagstd   64                                    Int
fbodybodygyromagmean     65                                    Int
fbodybodygyromagstd      66                                    Int
fbodybodygyrojerkmagmean 67                                    Int
fbodybodygyrojerkmagstd  68                                    Int

```
