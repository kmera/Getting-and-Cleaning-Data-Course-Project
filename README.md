# Getting and Cleaning Data Course Project

# Project Summary
“Activity recognition data set built from the recordings of 30 subjects performing basic activities and postural transitions while carrying a waist-mounted smartphone with embedded inertial sensors. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.”
The assignment consists in getting and cleaning data according to the following procedure:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each             measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the      average of each variable for each activity and each subject.

#-------------------------------------------------------------------------------------

# Repository Contents
This repo includes four files:

tidydata_set.txt. Contains the result of the procedure explained above.

run_analysis.R. The R script needed to generate the data set.

CodeBook.md. Describes the variables, the data, and the work                                       performed to clean up the data.

README.md. Explanation of the project and how the script work.


# The Process
# Input
The input to this process is the raw data which can be downloaded the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

before the download process, there is needed to create or check if there is a directory for the entire data:

if(!file.exists("~/NOKIA/COURSERA/DATA SCIENCE/RWorkingDir/Assignment4")){dir.create("~/NOKIA/COURSERA/DATA SCIENCE/RWorkingDir/Assignment4")}

Now, the download from the original repository:

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileURL, destfile = "dataset.zip", mode = "wb")

the file must be unzipped to access it:

unzip("dataset.zip")

# Process

Step 1: once the files are in the directory, the process starts with the train data preparation, which includes:

Reading ‘X_train.txt’ file, which contains the training data set.

x_train = read.table(file = "./UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")

Reading ‘features.txt’ file, which contains features of the training set.

features = read.table(file = "./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

The first transformation is done by assigning the variable names to the train data set (x_train). The variable names are got from the ‘feature’ object.

colnames(x_train) <- c(features[ , 2])

Reading ‘Y_train.txt’ file, which contains training labels or activities.

y_train = read.table(file = "./UCI HAR Dataset/train/y_train.txt", stringsAsFactors = FALSE)

The second transformation is done by changing the variable names of ‘y_train’ object from ‘V1’ to ‘activity’. It is done by using the ‘rename’ object of “dplyr” library.

y_train <- rename(y_train, activity = V1)

Reading ‘subject_train.txt’ file, which contains the subject id who performed the activity.

subject_train = read.table(file = "./UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE)

The third transformation is done by changing the variable names of ‘subject_train’ object from ‘V1’ to ‘id’. In this case the subject variable name is change to ‘id’ and it is done by using the ‘rename’ object of “dplyr” package.

subject_train <- rename(subject_train, id = V1)

Finally, the combination of the three objects: id (subject_train), data set (x_train) and activities (y_train).

training_data <- cbind(subject_train, y_train, x_train)

Step 2: in this point, the focus is on the test data preparation and, basically is the same procedure done in step 1:

Reading ‘X_test.txt’, which contains the test data set.

x_test = read.table(file = "./UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")

The fourth transformation is done by assigning the variable names to the test data set (x_train). The variable names are got from the ‘feature’ object that was obtained in step 1.

colnames(x_test) <- c(features[ , 2])

Reading ‘Y_test.txt’ file, which contains test labels or activities.

y_test = read.table(file = "./UCI HAR Dataset/test/y_test.txt", stringsAsFactors = FALSE)

Reading ‘subject_test.txt’ file, which contains the subject id who performed the activity.

subject_test = read.table(file = "./UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE)

The fifth transformation is done by changing the variable names of ‘subject_test’ object from ‘V1’ to ‘id’. In this case the subject variable name is change to ‘id’ and it is done by using the ‘rename’ object of “dplyr” package as it was done in step 1.

subject_test <- rename(subject_test, id = V1)

Lastly, the combination of the three objects: id (subject_test), data set (x_test) and activities (y_test).

Step 3. train data and test data are ready to be merged, so the next step exactly done that:

Creating a complete data with ‘rbind’ to merge training data with test data, so now there is just one data set named ‘complete_data’.

complete_data <- rbind(training_data, test_data)

Step 4: Now is time to extract only the measurements on the mean and standard deviation for each measurement, so:

Let’s start by reading ‘activity_labels.txt’, which contains the number and the name of each activity performed.

activity_labels = read.table(file = "./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

The sixth transformation is done by changing the descriptive names of the activities (which are include in the ‘activity_labels’ object), in the data set ‘complete_data’. In this case, is needed to specify the ‘levels’ and the ‘labels’ in the ‘factor’ object because ‘activity_labels’ object has two columns.

complete_dataactivity <- factor(complete_data$activity, levels = activity_labels[, 1], labels = activity_labels[, 2])

As it was used many temporal variables, and those aren’t needed anymore, they will be erased in two steps, train and test.

rm(x_train, features, y_train, subject_train, training_data)

rm(x_test, y_test, subject_test, test_data, data_to_extract, activity_labels) 

Step 5: tidy data is almost done, so to finish, the data labels in ‘complete_data’ must be appropriately named in a descriptive way. According to the course recommendation, the variables names should be in lower case when possible, but in this case only the first two variables (id and activity) will remain in lower case because the others are large and will be difficult to read and understand if those are in lower case to, so capital letters will be used to be more descriptive. Besides, only one variable, x_var, will be used to do that:

Some regular expressions will be eliminated, and this is the seventh variables transformation. 

x_var <- sub("()", "", colnames(complete_data))

x_var <- gsub("-", "", x_var)

The final transformations consist of modifying abbreviations to correct and show them in a descriptive way.

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


# Output

To get the final data set, complete and tidy, the last step is to assign the descriptive variables vector (x_var) to the complete data set named ‘complete_data’:

colnames(complete_data) <- c(x_var)

And finally, eliminating temporal variable ‘x_var’.

rm(x_var) 

#-------------------------------------------------------------------------------------

The last requirement of this assignment is to create a second, independent tidy data set with the average of each variable for each activity and each subject, so:
Loading complete_data in a new ‘tibble’ variable to make sure the use of dplyr package.

tidydata_mean <- as_tibble(complete_data)

To the last step, grouping and summarizing, chaining method will be used to get the average.

tidydata_mean <- tidydata_mean %>% 
        group_by(id, activity) %>%
        summarise_all(mean)
The second tidy data set has been created and is the set ‘tidydata_mean’.

--------------------------------------------------------------------------------------

As was mentioned in the Repository Contents point, it includes the file ‘tidydata_set.txt’ which is generated in the following way:

Generating the final tidy data set text file.

write.table(tidydata_mean, "tidydata_set.txt", quote = FALSE, sep = " ", row.names = FALSE)



