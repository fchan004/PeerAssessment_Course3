CodeBook
========================================================

##General description of the features
This a description taken from Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto; the scientist that made the experiment:

    The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

    Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals was calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

    Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

    These signals were used to estimate variables of the feature vector for each pattern:  
    '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


Coursera "Getting and Cleaning Data". Peer Assessment.

According to the instructions given by the professor, this document has a description of the script used to transform the raw data to two sets of tidy data.

##The data
###TidyTable1
There are 68 features that contains measures:

* subject: The id of the volunteer. 30 subjects
* Activity: 6 activities
 * Walking
 * Walking_Upstairs
 * Walking_Downstairs
 * Sitting
 * Standing
 * Laying 

The names of the features other 66 features are composed names where each part has a particular meaning. Each part is going to be explaining at follows.
The names are composed of 5 parts

* Part 1:
 * time: time domain signal
 * frecuency: frequency domain signals
* Part 2:
 * Body: the body of the volunteer as the origin of the measure
 * Gravity: the gravity as the origin of the measure
* Part 3:
 * Acceleration: Acceleration signal of the accelerometer
 * Gyroscope: Gyrosccope signal
 * AccelerationJerk: Acceleration signal deriven in time to obtain Jerk signal
 * GyroscopeJerk: Gyroscope signal deriven in time to obtain Jerk signal
 * AccelerationMag: Acceleration signal magnitude calculated with Euclidean norm
 * GyroscopeMag: Gyroscope signal magnitude calculated with Euclidean norm
 * AccelerationJerkMag: Acceleration Jerk signal magnitude
 * GyroscopeJerkMag: Gyroscope Jerk signal magnitude
* Part 4
 * mean(): Mean Value
 * std(): Standard deviation
* Part 5: (Not all the features include this part at the end.)
 * x: axis x
 * y: axis y
 * z: axis z

##TidyTable2
The names of the features are the same but this table contains the average of each variable for each activity and each subject and was created from TidyTable1
