Getting and Cleaning Data: Code book
=============

This code book contains information about the data set "tidydata.txt", which had to be created as the objective of the course project of the course "Getting and Cleaning Data". 

## General information

The data set shows information about activities of different persons recorded with a Samsung Galaxy S II smartphone using its embedded accelerometer and gyroscope. The persons are volunteers within an age bracket of 19-48 years. 

The data set contains 180 observations and 68 variables in 181 rows; the first row contains the column names.

## Information about variables

### Class variables

subject:
A numeric variable identifying the different persons. The range of the values spans from 1 to 30. 

activity:
A factor variable with six levels storing the different activities; each person performed six activities: 
* walking,
* walking_upstairs,
* walking_downstairs,
* sitting, 
* standing, and
* laying. 

### Interval variables

The raw sensor signals are pre-processed in the original data set. As a result, the acceleration signal was separated into measurements of the body acceleration (e.g. tBodyAcc) and the gravity acceleration (e.g. tGravityAcc). In addition, there were calculated Jerk signals and the magnitude of these signals (e.g. tBodyAccJerk, tGravityAccMag). Finally, another transformation (Fast Fourier Transform) was applied to some of the signals, they have an initial f to indicate frequency domain signals. 

These variables in the original data set are holding information about several measurements of an activity for each person. The data set "tidydata.txt" summarizes theses measurements calculating the mean of each measure grouped by persons and activities. The resulting variables show for each person the mean of the original signals for each activity.

The names of the variables contain additional information about the derived measure like mean() or std(); XYZ stands for each axis of the 3-dimensional signals. The values of the variables are between -1 and +1.
The interval variables are named like the following:

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyBodyAccJerkMag
* fBodyGyroMag
* fBodyBodyGyroJerkMag