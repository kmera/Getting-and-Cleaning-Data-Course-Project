#-------------------------------------------------------------------
# GETTING AND CLEANING DATA COURSE PROJECT 
#-------------------------------------------------------------------
# ABSTRACT
# Based on the data got from the accelerometer and the gyroscope from a 
# Samsung Galaxy S smartphone, which was also got from an experiment of 
# activity recognition from 30 people, the assignment consists in getting
# and cleaning data according to the following procedure:

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
#-------------------------------------------------------------------
# SCRIPT
#-------------------------------------------------------------------
# loading library
library(dplyr)

#-------------------------------------------------------------------
#DONWLOADING DATA
#-------------------------------------------------------------------
# creating a new dir
if(!file.exists("~/NOKIA/COURSERA/DATA SCIENCE/RWorkingDir/Assignment4")){dir.create("~/NOKIA/COURSERA/DATA SCIENCE/RWorkingDir/Assignment4")}
# setting new dir as a working dir
setwd("~/NOKIA/COURSERA/DATA SCIENCE/RWorkingDir/Assignment4")

# dowloading zip file 
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "dataset.zip", mode = "wb")

#getting files
unzip("dataset.zip")

#-------------------------------------------------------------------
#PREPARING TRAIN DATA
#-------------------------------------------------------------------
# reading X_train.txt which contains the training data set
x_train = read.table(file = "./UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")

# reading features.txt which contains features
features = read.table(file = "./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

# assigning the variable names to the train data set
colnames(x_train) <- c(features[ , 2])

# reading y_train.txt which contains training labels or activities
y_train = read.table(file = "./UCI HAR Dataset/train/y_train.txt", stringsAsFactors = FALSE)
# changing the name of the variable in y_train
y_train <- rename(y_train, activity = V1)

# reading subject_train.txt which contains the subject id who performed the activity
subject_train = read.table(file = "./UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE)
# changing the name of the variable in subject_train
subject_train <- rename(subject_train, id = V1)

# combining subject id (subject_train) with data set (x_train) and activities (y_train)
training_data <- cbind(subject_train, y_train, x_train)

#-------------------------------------------------------------------
#PREPARING TEST DATA
#-------------------------------------------------------------------
# reading X_test.txt which contains the test data set
x_test = read.table(file = "./UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")

# changing the variable names to the test data set
colnames(x_test) <- c(features[ , 2])

#reading y_test.txt which contains test labels or activities
y_test = read.table(file = "./UCI HAR Dataset/test/y_test.txt", stringsAsFactors = FALSE)
# changing the name of the variable in y_test
y_test <- rename(y_test, activity = V1)

# reading subject_test.txt which contains the subject id who performed the test
subject_test = read.table(file = "./UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE)
# changing the name of the variable in subject_test
subject_test <- rename(subject_test, id = V1)

#combining subject id (subject_test) with data set (x_test) with activities (y_test)
test_data <- cbind(subject_test, y_test, x_test)

#-------------------------------------------------------------------
# 1. MERGES THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET 
#-------------------------------------------------------------------
# creating a complete data
complete_data <- rbind(training_data, test_data)

#-------------------------------------------------------------------
# 2. EXTRACTS ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD 
#    DEVIATION FOR EACH MEASUREMENT
#-------------------------------------------------------------------
# selecting the index for the columns needed
data_to_extract<- grep("^id|^activity|*mean|*std", colnames(complete_data))
# new complete data with only mean and standard deviation meas
complete_data <- complete_data[ , data_to_extract]

#-------------------------------------------------------------------
# 3. USES DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE 
#    DATA SET
#-------------------------------------------------------------------
# reading activity_labels.txt which contains the name of the activity
activity_labels = read.table(file = "./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

# changing descriptive activity names in complete_data set
complete_data$activity <- factor(complete_data$activity, levels = activity_labels[, 1], labels = activity_labels[, 2])

#eliminating temporal variables
rm(x_train, features, y_train, subject_train, training_data)
rm(x_test, y_test, subject_test, test_data, data_to_extract, activity_labels)

#-------------------------------------------------------------------
# 4. APPROPRIATELY LABELS THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES
#-------------------------------------------------------------------
#eliminating regular expression
x_var <- sub("\\()", "", colnames(complete_data))
x_var <- gsub("-", "", x_var)

#modifying abbreviations to correct descriptive variables
x_var <- sub("^t", "Time", x_var)
x_var <- sub("*Acc", "Accelerometer", x_var)
x_var <- sub("*mean", "Mean", x_var)
x_var <- sub("*std", "StandardDeviation", x_var)
x_var <- sub("*Gyro", "Gyroscope", x_var)
x_var <- sub("*Mag", "Magnitude", x_var)
x_var <- sub("*BodyBody", "Body", x_var)
x_var <- sub("^f", "Frequency", x_var)
x_var <- sub("Freq$", "Frequency", x_var)
x_var <- sub("FreqX$", "FrequencyX", x_var)
x_var <- sub("FreqY$", "FrequencyY", x_var)
x_var <- sub("FreqZ$", "FrequencyZ", x_var)

# assigning the final descriptive variables vector to complete data set
colnames(complete_data) <- c(x_var)
# eliminating temp variable
rm(x_var)

#-------------------------------------------------------------------
# 5. FROM THE DATA SET IN STEP 4, CREATES A SECOND, INDEPENDENT 
# TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY 
# AND EACH SUBJECT.
#-------------------------------------------------------------------
#loading complete_data in a new tibble variable
tidydata_mean <- as_tibble(complete_data)

#grouping and summarizing by chaining method and getting the average
tidydata_mean <- tidydata_mean %>% 
        group_by(id, activity) %>%
        summarise_all(mean)

#-------------------------------------------------------------------
# GENERATION FINAL TXT FILE
#-------------------------------------------------------------------
#generating final tidy data set
write.table(tidydata_mean, "tidydata_set.txt", quote = FALSE, sep = " ", row.names = FALSE)

#-------------------------------------------------------------------
