#Getting and Cleaning Data Course Project - CodeBook

This document shows a description of the variables, the data, and the transformations or work that is performed to clean up the data.

#Variables
The tidy data set file (tidydata_set.txt) has 81 variables (and 180 observations), which are:

#id: 
it’s an integer from 1 to 30 and corresponds the group of 30 volunteers within an age bracket of 19-48 years that were selected for this experiment.

#activity: 
it’s a factor which represents the six activities performed for each person (id) and the values are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.


Basically, there are both time domain and frequency domain measurements that were got using Samsung Galaxy S II embedded accelerometer and gyroscope to captured 3-axial linear acceleration and 3-axial angular velocity. The frequency domain measures were got using Fast Fourier Transform or FFT on some time domain signals.
According to the UCI Machine Learning Repository, features are normalized and bounded within [-1,1], the units used for the accelerations (total and body) are g's (gravity of earth -> 9.80665 m/seg2), and the gyroscope units are rad/seg.
From the entire raw data, in this tidy data set are only included mean and standard deviation measures.

#Time domain measures:
Body acceleration mean 3-axial signals in the X, Y and Z directions:

• TimeBodyAccelerometerMeanX

• TimeBodyAccelerometerMeanY

• TimeBodyAccelerometerMeanZ


Body acceleration standard deviation 3-axial signals in the X, Y and Z directions:

• TimeBodyAccelerometerStandardDeviationX

• TimeBodyAccelerometerStandardDeviationY

• TimeBodyAccelerometerStandardDeviationZ


Gravity acceleration mean 3-axial signals in the X, Y and Z directions:

• TimeGravityAccelerometerMeanX

• TimeGravityAccelerometerMeanY

• TimeGravityAccelerometerMeanZ


Gravity acceleration standard deviation 3-axial signals in the X, Y and Z directions:

• TimeGravityAccelerometerStandardDeviationX

• TimeGravityAccelerometerStandardDeviationY

• TimeGravityAccelerometerStandardDeviationZ


Body acceleration jerk mean 3-axial signals in the X, Y and Z directions:

• TimeBodyAccelerometerJerkMeanX

• TimeBodyAccelerometerJerkMeanY

• TimeBodyAccelerometerJerkMeanZ


Body acceleration jerk standard deviation 3-axial signals in the X, Y and Z directions:

• TimeBodyAccelerometerJerkStandardDeviationX

• TimeBodyAccelerometerJerkStandardDeviationY

• TimeBodyAccelerometerJerkStandardDeviationZ


Body gyroscope mean 3-axial signals in the X, Y and Z directions:

• TimeBodyGyroscopeMeanX

• TimeBodyGyroscopeMeanY

• TimeBodyGyroscopeMeanZ


Body gyroscope standard deviation 3-axial signals in the X, Y and Z directions:

• TimeBodyGyroscopeStandardDeviationX

• TimeBodyGyroscopeStandardDeviationY

• TimeBodyGyroscopeStandardDeviationZ


Body gyroscope jerk mean 3-axial signals in the X, Y and Z directions:

• TimeBodyGyroscopeJerkMeanX

• TimeBodyGyroscopeJerkMeanY

• TimeBodyGyroscopeJerkMeanZ


Body gyroscope jerk standard deviation 3-axial signals in the X, Y and Z directions:

• TimeBodyGyroscopeJerkStandardDeviationX

• TimeBodyGyroscopeJerkStandardDeviationY

• TimeBodyGyroscopeJerkStandardDeviationZ


Body acceleration magnitude measures:

• TimeBodyAccelerometerMagnitudeMean

• TimeBodyAccelerometerMagnitudeStandardDeviation

• TimeBodyAccelerometerJerkMagnitudeMean

• TimeBodyAccelerometerJerkMagnitudeStandardDeviation


Gravity acceleration magnitude measures:

• TimeGravityAccelerometerMagnitudeMean

• TimeGravityAccelerometerMagnitudeStandardDeviation


Body gyroscope magnitude measures:

• TimeBodyGyroscopeMagnitudeMean

• TimeBodyGyroscopeMagnitudeStandardDeviation

• TimeBodyGyroscopeJerkMagnitudeMean

• TimeBodyGyroscopeJerkMagnitudeStandardDeviation


#Frequency domain measures:

Body acceleration mean 3-axial signals in the X, Y and Z directions:

• FrequencyBodyAccelerometerMeanX

• FrequencyBodyAccelerometerMeanY

• FrequencyBodyAccelerometerMeanZ


Body acceleration standard deviation 3-axial signals in the X, Y and Z directions:

• FrequencyBodyAccelerometerStandardDeviationX

• FrequencyBodyAccelerometerStandardDeviationY

• FrequencyBodyAccelerometerStandardDeviationZ


Body acceleration mean frequency 3-axial signals in the X, Y and Z directions:

• FrequencyBodyAccelerometerMeanFrequencyX

• FrequencyBodyAccelerometerMeanFrequencyY

• FrequencyBodyAccelerometerMeanFrequencyZ


Body acceleration jerk mean 3-axial signals in the X, Y and Z directions:

• FrequencyBodyAccelerometerJerkMeanX

• FrequencyBodyAccelerometerJerkMeanY

• FrequencyBodyAccelerometerJerkMeanZ


Body acceleration jerk standard deviation 3-axial signals in the X, Y and Z directions:

• FrequencyBodyAccelerometerJerkStandardDeviationX

• FrequencyBodyAccelerometerJerkStandardDeviationY

• FrequencyBodyAccelerometerJerkStandardDeviationZ


Body acceleration jerk mean frequency 3-axial signals in the X, Y and Z directions:

• FrequencyBodyAccelerometerJerkMeanFrequencyX

• FrequencyBodyAccelerometerJerkMeanFrequencyY

• FrequencyBodyAccelerometerJerkMeanFrequencyZ


Body gyroscope mean 3-axial signals in the X, Y and Z directions:

• FrequencyBodyGyroscopeMeanX

• FrequencyBodyGyroscopeMeanY

• FrequencyBodyGyroscopeMeanZ


Body gyroscope standard deviation 3-axial signals in the X, Y and Z directions:

• FrequencyBodyGyroscopeStandardDeviationX

• FrequencyBodyGyroscopeStandardDeviationY

• FrequencyBodyGyroscopeStandardDeviationZ


Body gyroscope mean frequency 3-axial signals in the X, Y and Z directions:

• FrequencyBodyGyroscopeMeanFrequencyX

• FrequencyBodyGyroscopeMeanFrequencyY

• FrequencyBodyGyroscopeMeanFrequencyZ


Body acceleration magnitude measures:

• FrequencyBodyAccelerometerMagnitudeMean

• FrequencyBodyAccelerometerMagnitudeStandardDeviation

• FrequencyBodyAccelerometerMagnitudeMeanFrequency

• FrequencyBodyAccelerometerJerkMagnitudeMean

• FrequencyBodyAccelerometerJerkMagnitudeStandardDeviation

• FrequencyBodyAccelerometerJerkMagnitudeMeanFrequency


Body gravity magnitude measures:

• FrequencyBodyGyroscopeMagnitudeMean

• FrequencyBodyGyroscopeMagnitudeStandardDeviation

• FrequencyBodyGyroscopeMagnitudeMeanFrequency

• FrequencyBodyGyroscopeJerkMagnitudeMean

• FrequencyBodyGyroscopeJerkMagnitudeStandardDeviation

• FrequencyBodyGyroscopeJerkMagnitudeMeanFrequency


#Data
As a result of the run_analysis.R script, the tidy data set was created and generated a text file named ‘tidydata_set.txt’.

#Transformations
The first transformation is done by assigning the variable names to the train data set (x_train). The variable names are got from the ‘feature’ object.


The second transformation is done by changing the variable names of ‘y_train’ object from ‘V1’ to ‘activity’. It is done by using the ‘rename’ object of “dplyr” library.


The third transformation is done by changing the variable names of ‘subject_train’ object from ‘V1’ to ‘id’. In this case the subject variable name is change to ‘id’ and it is done by using the ‘rename’ object of “dplyr” library.


The fourth transformation is done by assigning the variable names to the test data set (x_train). 


The fifth transformation is done by changing the variable names of ‘subject_test’ object from ‘V1’ to ‘id’. In this case the subject variable name is change to ‘id’ and it is done by using the ‘rename’ object of “dplyr” package.


The sixth transformation is done by changing the descriptive names of the activities (which are include in the ‘activity_labels’ object), in the data set ‘complete_data’. In this case, is needed to specify the ‘levels’ and the ‘labels’ in the ‘factor’ object because ‘activity_labels’ object has two columns.


Some regular expressions will be eliminated such as "()", "-", and this is the seventh variables transformation. 


The final transformations consist of modifying abbreviations to correct and show them in a descriptive way.

"^t" -> "Time"

"*Acc" -> "Accelerometer"

"*mean" -> "Mean"

"*std" -> "StandardDeviation"

"*Gyro" -> "Gyroscope"

"*Mag" -> "Magnitude"

"*BodyBody" -> "Body"

"^f" -> "Frequency"

"Freq$" -> "Frequency"

"FreqX$" -> "FrequencyX"

"FreqY$" -> "FrequencyY"

"FreqZ$" -> "FrequencyZ"


#Study design
In this case, the study design was done by University of California, Irvine (UCI) and the data set information can be found in: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
For each record in the dataset it is provided: 

• Triaxial acceleration from the accelerometer (total acceleration) and the estimated   body acceleration. 

• Triaxial Angular velocity from the gyroscope. 

• A 561-feature vector with time and frequency domain variables. 

• Its activity label. 

• An identifier of the subject who carried out the experiment.


