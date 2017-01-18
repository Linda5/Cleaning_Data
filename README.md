### Getting and Cleaning Data Course Project

This project aims to produce a tidy data set derived from data collected from a series of experiments related to wearables.

The data represents data collected from the accelerometers from the Samsung Galaxy S smartphone.  

The experiment involved two sets of data, where 70% of the volunteers were selected for generating the "training" data and 30% the "test" data.

##  Data sources

A full description of the original data is here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

and the data used for the project was obtained from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data used for this assignment was as follows:

features.txt:   	This contains the features captured for each test.  e.g.  
activity_labels.txt:  	This contains the labels for each activity.  e.g.  "walking", "walking upstairs", etc.
X_test.txt:		The observations for the participants in the "test" set of data.
subject_test.txt:	This identifies the individual (subject) who performed the activity in the "test" set.
y_test.txt:		This identifies the activity that the individual was performing for the "test" set.

Similar to the last three files, there were additional files containing data relating to the "training" set of data (X_train.txt, subject_train.txt and y_train.txt).

##  run_analysis.R

The objective of this script is to :

(a)  Merge the training and the test sets to create one data set.
(b)  Extracts only the measurements on the standard deviation for each mesurement.
(c)  Uses descriptive activity names to name the activities in the data set
(d)  Appropriately labels the data set with descriptive variable names.
(e)  Derive a tidy data set with the average of each variable for each activity and each subject.

##  Analysis

Initially a first set of data is created which holds the data relating to each of the features by subject and activity in the "test" class.  The features.txt file is used to determine appropriate labels for the data.  The data is stored in a file test.results.

Similarly, the training data is stored in train.results and finally the training and test results are combined into a file called "experiment".

Only the mean and standard deviation was required for each measure.  The select function was used to extract the required fields.  

The mapvalues function was used to map the "code" for each activity with a description.  e.g. An acitivity code of 1 referred to the activity of walking.

The data was then "tidied" by removing unnecessary fields in the column names ("_", "-" and numbers which prefaced each feature).  
It was considered appropriate that the labels continued to have some upper case fields to assist in understanding the feature.

ddply was used to apply the mean function to each of the columns by subject and activity.  The data was stored in tidy.df.

Finally, the file was written to tidy_data.txt.

##  Code Book

A code book has been included which describes the variables and summaries calculated, along with units, and any other relevant information.

##  Tidy Data Set

tidy_data.txt contains the output of the run_analysis.R script as described above.



