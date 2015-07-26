Getting and Cleaning Data - Course Project - Code Book

Original data set used for the project is in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The description of the original data is in http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The following files from the original data set were used for the exercise.

Files containing measurements of 10299 instances. There are 561 attributes observed in each of the 2 files.

X_train.txt - Training data set
X_test.txt - Testing data set


Files containing the subject information for each of the 10299 instances (both files). There is only one information in the file about the subject identifier.

subject_train.txt 
subject_test.txt

Files containing the activity information for each of the 10299 instances (both files). There is only one information in the file about the activity.

y_train.txt
y_test.txt

File containing information about all the 561 attributes measured - Features.txt

File containing the description of each activity - activity_labesl.txt


The script run_analysis.R performs the following tasks based on the above files.


1. Combine the data in training and test sets for the measurements, subject and activity and produce the below 3 sets.


data  with 10299 rows and 561 columns
subject with 10299 rows and 1 column
activity with 10299 rows and 1 column

2. Read the features file to get the information on attributes and extract only attributes related to mean and std.

Extract only those attributes from data and store it in extract_data.

extract_data will be 10299 rows and 66 columns for each attribute (for mean and std)

3. Remove the underscore in activity description from activity_labels.txt and replace the activity identifiers in activity file with labels.

WALKING
WALKINGUPSTAIRS
WALKINGDOWNSTAIRS
SITTING
STANDING
LAYING

4. Remove the paranthesis from 66 attribute names and assign them as column names for extract_data

5. Assign column name as subject for the only column in subject file

6. Combine activity, subject and extract_data files to create a tidy data set

7. Calculate the mean on each attribute by activity/subject and create a new file average_data_set_step_5_file.txt.This file will have 180 records and 66 columns for each attribute (related to mean and std)
180 columns for 30 subjects and 6 activities (30 * 6)