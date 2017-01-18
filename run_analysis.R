##  This script reads in test and training data and produces a "tidy" data set
##  as required by the Getting and Cleaning Data Course Project
##  README contains further detail of the approach
##  Codebook contains details of the variables
##  tidy_data.txt contains the required tidy data set as outlined in the assignment.


##  1.  Merge the training and the test sets to create one data set

##  First read the "test" data sets.

subject_test<-read.csv("UCI HAR Dataset/test/subject_test.txt")  ## This identifies the subject
colnames(subject_test)<-c("SubjectIdentifier")                   ##  Add a suitable column heading

y_test<-read.csv("UCI HAR Dataset/test/y_test.txt")              ## This identifies the activity performed
colnames(y_test)<-"activity"
x_test<-read.csv("UCI HAR Dataset/test/X_test.txt",sep="")       ##  This identifies the observations captured


##  Read in the features.txt file to be used as column labels for each of the features measured
features<-read.csv("UCI HAR Dataset/features.txt",header=FALSE,sep="\t")
colnames(x_test)<-t(features)


##  Finally, bind the three files together to arrive at a test file containing the subject, the activity
##  and the features measured

test.results<-cbind(subject_test,y_test,x_test)


##  Similarly, the following reads the "training" versions of the data sets.

subject_train<-read.csv("UCI HAR Dataset/train/subject_train.txt")
y_train<-read.csv("UCI HAR Dataset/train/y_train.txt")
x_train<-read.csv("UCI HAR Dataset/train/X_train.txt",sep="")


colnames(subject_train)<-c("SubjectIdentifier")
colnames(y_train)<-"activity"
colnames(x_train)<-t(features)


train.results<-cbind(subject_train,y_train,x_train)

##  Combine the test and training results to create one data set "experiment"

experiment<-rbind(test.results,train.results)

## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

experiment<-select(experiment,contains("subject"),contains("activity"),contains("mean"),
                    contains("std"), -contains("freq"),-contains("angle"))


##  3.  Uses descriptive activity names to name the activities in the data set.

##  These are as per the  activity_labels.txt file but in a tidier format


Activity_Labels<-mapvalues(experiment$activity,c("1","2","3","4","5","6"),
    c("walking","walking upstairs","walking downstairs","sitting","standing","laying"))


##  The following adds in another column with the description and then removes the column
##  containing the code for the activity


experiment<-cbind(Activity_Labels,experiment)
experiment<-subset(experiment,select=-activity)   


##  4.  Appropriately label the data set with descriptive variable names


tidy_names<-gsub("_","",names(experiment))    ##  removes any "_" in the column names
tidy_names<-gsub("-","", tidy_names)          ##  removes any "-" in the column names
tidy_names<-gsub("\\d+","", tidy_names)       ##  removes any unnecessary numbers in the column names


colnames(experiment)<-tidy_names

##  5.  From the data set in step 4, creates a second, independent tidy data set with the average of 
##   each variable for each activity and each subject.

##  The following calculates the mean for every column except the first two which identifies the subject
##  and the activity

col_cnt<-ncol(experiment)
tidy.df<-ddply(experiment,.(SubjectIdentifier,ActivityLabels),function(x) colMeans(x[,3:col_cnt]))


##  Write to a text file

write.table(tidy.df,file="tidy_data.txt",col.names=TRUE,row.name=FALSE)

##  End of script
