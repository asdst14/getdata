Getting and Cleaning Data: Course Project
===========

This readme introduces the R script for building the tidy data set within the getdata course. 

## The task

"You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject."

## Libraries

The script uses the libraries plyr, dplyr and tidyr and loads them in an initial step. 

## Step 1: Creating the data set

As preparation for task 1, the script loads the different data sets from the directory "UCI HAR Dataset", a subdirectory of the working directory. The data frames train and test contain the raw data with the measured values. The data frames starting with "sub" and "act" contain information about subjects and activities for the train and test partitions. The labels for the variable names are stored in ftr, the labels for the activites are stored in act_labels. The columns of act_labels are renamed to ensure the correct replacement of the activity_ids in the data set in a later step. 

After the loading the different data partitions are combined:
* rbind combines the train and test partitions,
* cbind combines the columns in one data set. 

The entire data set is stored a the data frame called "data". 

## Step 2: Labeling the columns

Task 2 aims at selecting only variables with the measurements mean() and std(). In order to select these columns by investigating the column name, the data set has to have labels columns. Therefore, the script completes task 4 in step 2 and adds the variable names stored in ftr to the data frame. Therefore, two new entries are added to ftr in order to being able to rename the columns for subject and activity_id correctly. 

## Step 3: Extracting the relevant measurements

Using the select-function of the dplyr package the script extract the columns containing "mean()" and "std()" in their names. 

The data frame "data2" stores theses variables as well as the information about the subject and the activity_id. 

## Step 4: Integrating activity labels

The column activity_id contains different numbers representing a specific activity. The label for each activity number ist stored in act_labels. To integrate the activity labels in the data set instead of the numbers, the script uses the join-function and combines the data frames act_labels and data2 by the column activity_id. Afterwards, the unnecessary column activity_id is removed from the new data set data3. 

## Step 5: Creating and writing the tidy data set

The tidy data set is required to save only the means of the measured values for each activity and each subject. The data set is grouped by subject and activity using the group_by-function of the dplyr library. Afterwards, the script uses the function summarise_each to calculate the means of each variable regarding the two groups. The resulting data set is stored in the data frame tidydata and written as a txt-file into the working directory. 