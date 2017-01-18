### Getting and Cleaning Data Course Project

This project aims to produce a tidy data set derived from data collected from a series of experiments related to wearables.

The data represents data collected from the accelerometers from the Samsung Galaxy S smartphone.  

Please refer to the README file for further detail on the analysis and the original source of data.

##  Variables

- `SubjectIdentifier`

This represents the volunteer in the experiment and has a value from 1 to 30. It is as per subject_test.txt and subject_training.txt in the original data files.
 
- `ActivityLabels`

This is the activity the volunteer was performing during the test.  There are six different activities and the labels were transformed based on the file acitivity_labels.txt in the original data set.  The original code and final description was as follows:
1	walking
2	walking upstairs
3	walking downstairs
4	sitting
5	standing
6 	laying

- 'Features'
There were 66 "features" extracted from the original data source.  All the features that related to the mean or standard deviation of the measurement were extracted.  The labels adopted are as per the original data source but with "_", "-" and leading numbers removed to create tidier column labels.  

The colMeans function was then used to determine the mean of each of these variables according to the volunteer and the activity undertaken.

The final file contains an observation for each combination of volunteer and activity (where performed) and an average of each of the 66 measures that were extracted.  

For completeness, the 66 "features" were as follows:

 tBodyAccmean()X
 tBodyAccmean()Y
 tBodyAccmean()Z
 tGravityAccmean()X
 tGravityAccmean()Y
 tGravityAccmean()Z
 tBodyAccJerkmean()X
 tBodyAccJerkmean()Y
 tBodyAccJerkmean()Z
 tBodyGyromean()X
 tBodyGyromean()Y
 tBodyGyromean()Z
 tBodyGyroJerkmean()X
 tBodyGyroJerkmean()Y
 tBodyGyroJerkmean()Z
 tBodyAccMagmean()
 tGravityAccMagmean()
 tBodyAccJerkMagmean()
 tBodyGyroMagmean()
 tBodyGyroJerkMagmean()
 fBodyAccmean()X
 fBodyAccmean()Y
 fBodyAccmean()Z
 fBodyAccJerkmean()X
 fBodyAccJerkmean()Y
 fBodyAccJerkmean()Z
 fBodyGyromean()X
 fBodyGyromean()Y
 fBodyGyromean()Z
 fBodyAccMagmean()
 fBodyBodyAccJerkMagmean()
 fBodyBodyGyroMagmean()
 fBodyBodyGyroJerkMagmean()
 tBodyAccstd()X
 tBodyAccstd()Y
 tBodyAccstd()Z
 tGravityAccstd()X
 tGravityAccstd()Y
 tGravityAccstd()Z
 tBodyAccJerkstd()X
 tBodyAccJerkstd()Y
 tBodyAccJerkstd()Z
 tBodyGyrostd()X
 tBodyGyrostd()Y
 tBodyGyrostd()Z
 tBodyGyroJerkstd()X
 tBodyGyroJerkstd()Y
 tBodyGyroJerkstd()Z
 tBodyAccMagstd()
 tGravityAccMagstd()
 tBodyAccJerkMagstd()
 tBodyGyroMagstd()
 tBodyGyroJerkMagstd()
 fBodyAccstd()X
 fBodyAccstd()Y
 fBodyAccstd()Z
 fBodyAccJerkstd()X
 fBodyAccJerkstd()Y
 fBodyAccJerkstd()Z
 fBodyGyrostd()X
 fBodyGyrostd()Y
 fBodyGyrostd()Z
 fBodyAccMagstd()
 fBodyBodyAccJerkMagstd()
 fBodyBodyGyroMagstd()
 fBodyBodyGyroJerkMagstd()

