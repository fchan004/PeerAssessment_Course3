##This is the instruction list that describe step by step the process to go from the raw data to 2
# two sets of the tidy data

library(plyr)

###FIRST PART: Downloading the raw data.
#Download raw data
#For download the raw data, the following commands were used
fileURL <- ("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
download.file(fileURL, destfile = "./data.zip")
#The data were downloaded on "Thu Apr 24 11:11:46 2014" (using 'date()' )
### END OF THE FIRST PART

###SECOND PART: The transformation script       
##STEP 0: Load the date in R
##FEATURES
#Loading features
features <-read.table("./features.txt")

##ACTIVITY
#Loading Activity_labels
Activity_labels <-read.table("./activity_labels.txt")
#Putting names to the columns
names(Activity_labels) <- c("ActivityID","Activity")

##Creating Train_Table
#Loading y_train
y_train <-read.table("./y_train.txt")
#Loading x_train
x_train <-read.table("./x_train.txt")
#Loading subject_train
subject_train <-read.table("./subject_train.txt")
#Adding names to x_train 
names(x_train) <- features[,2]
#Creating Train_Table and assigning a name to the first two columns
Train_Table <- cbind(subject_train,y_train,x_train); names(Train_Table)[1:2] <-c("subject","ActivityID")
##END OF STEP 0


#STEP 1: Merges the training and the test sets to create one data set.
##Creating Test_Table
#Loading y_test
y_test <-read.table("./y_test.txt")
#Loading X_test
x_test <-read.table("./X_test.txt")
#Loading subject_test
subject_test <-read.table("./subject_test.txt")
#Adding names to x_train OJO ESTO PUEDE QUE NO SEA ASI
names(x_test) <- features[,2]
#Creating Train_Table and assigning a name to the first two columns
Test_Table <- cbind(subject_test,y_test,x_test); names(Test_Table)[1:2] <-c("subject","ActivityID")

##Creating BigTable
BigTable <-rbind(Test_Table,Train_Table)
##END OF STEP 1:

##STEP 3: Uses descriptive activity names to name the activities in the data set
#(I found more appropiate to make this step at this moment)
# Mearging with the Activity_labels
BigTable <-merge(Activity_labels,BigTable,by.x="ActivityID",by.="ActivityID")
#END OF STEP 3

#Cleaning previous tables.
#(I make this step in order to make a more efficiente use of the memory)
remove('Activity_labels')
remove('y_train','x_train','subject_train','Train_Table')
remove('y_test','x_test','subject_test','Test_Table')

##STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.
##Creating a vector with the labels that have only 'mean' and 'std' values

#From the 'features' dataframe we are taking out the ones that measurments on 'meanFreq'
#(that is differente from 'mean')
No_meanFreq_header <- unique (grep("meanFreq",features$V2, value=TRUE,invert=TRUE))
#Subsetting the columns with 'mean()' and 'std()' in their names
mean_std <- c(".*mean().*", ".*std().*")
mean_std_header <- unique (grep(paste(mean_std,collapse="|"),No_meanFreq_header, value=TRUE))
#mean_std_header is a character vector that contains the names of the columns of interest

#Subsetting the BigTable with the columns of interest stated in 'mean_std_header'
TidyTable1 <- BigTable[,c("subject","Activity", mean_std_header)]
TidyTable1 <- arrange(TidyTable1, subject, decreasing = FALSE)
##END OF STEP 2

##STEP 4: Appropriately labels the data set with descriptive activity names. 
##Reanameing columns
#Taking the names of the TidyTable1 into the character vector column_Names
column_Names <- names(TidyTable1)
#Making substitutions in order to give more appropiate names
column_Names <- gsub("tBodyAcc","time_Body_Acceleration",column_Names)
column_Names <- gsub("tGravityAcc","time_Gravity_Acceleration",column_Names)
column_Names <- gsub("tBodyGyro","time_Body_Gyroscope",column_Names)
column_Names <- gsub("fBodyAcc","frequency_Body_Acceleration",column_Names)
column_Names <- gsub("fBodyGyro","frequency_Body_Gyroscope",column_Names)
column_Names <- gsub("fBodyBodyAccJerkMag","frequency_Body_AccelerationJerkMag",column_Names)
column_Names <- gsub("fBodyBodyGyroMag","frequency_Body_GyroscopeMag",column_Names)
column_Names <- gsub("fBodyBodyGyroJerkMag","frequency_Body_GyroscopeJerkMag",column_Names)
#Setting the new names into the TidyTable1
names(TidyTable1) <-column_Names

##STEP 5: Creates a second, independent tidy data set with the average of each variable for
#each activity and each subject. 
TidyTable2 <- ddply(TidyTable1, .(subject, Activity), numcolwise(mean))
##other option (just for keeping a record of a differente option (a more expensive one))
#TidyTable2 <- split(TidyTable1[,3:length(TidyTable1)], list(TidyTable1$subject,TidyTable1$Activity))
#TidyTable2 <- sapply(TidyTable2,colMeans)
#TidyTable2 <- t(TidyTable2)
##END OF STEP 5

######LAST LINE######
