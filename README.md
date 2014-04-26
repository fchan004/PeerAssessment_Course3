README
========================================================
Coursera "Getting and Cleaning Data". Peer Assessment.

According to the instructions given by the professor, this document has a description of the script used to transform the raw data to two sets of tidy data.

##The raw data
It has been downloaded from the url:

    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip   

The data were downloaded on

    Thu Apr 24 11:11:46 2014

Using part the description made my Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto; the owners of the data:

    The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. ... The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 

As the data owners state, the data comes separated in a train and test sets. Both sets contains .txt files: an "y" file that contains the activity performed by a subject, the "x" file that contains the data captured by the smartphone; and a "subject" file that contains the id of the volunteer.

In the root of the raw data directory there are some .txt files that are gonna be used. The "activity_label" file that contains the description of the activity id contains in the "y" files. A "features.txt" file that contains the names associated with the distinct columns of the "x" file.

###The features
This description was taken from the "features_info.txt" available in the original downloaded zip file:

    The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

    Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals was calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

    Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

    These signals were used to estimate variables of the feature vector for each pattern:  
    '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The names of the variables (i.e.  tAcc-XYZ) where substituted by a more completed names. For more details of the features, please read de ```CodeBook.md```

##The run_analysis.R script
The run_analysis.R script assumes that you have install the "plyr" package. It must be run in two parts.

First the file MUST be downloaded in the working directory and decompresed. The next files MUST be in the working directory (Step 0 in the code):

* subject_test.txt
* subject_train.txt
* X_text.txt
* X_train.txt
* y_test.txt
* y_train.txt

The second part can be run as a whole. The results will be the two tables ```TidyTable1```
and ```TidyTable2```.

##Table descriptions
###TidyTable1
This table contains data from the raw data measures particularly those which involves the measures of the ```mean``` and ```standard deviation```. This variables where merged with the subjects and the activity (the label) performed by the subject.


###TidyTable2
This table is an independent tidy data set with the average of each variable for each activity and each subject made using "TidyTable1" as a base

####The data set includes
* README.md
* CodeBook.md
* run_analysis.R
* TidyTable1.txt
* TidyTable2.txt
