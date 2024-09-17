## # Load the 'dplyr' library
library(dplyr)
        
## Checking for and creating a data directory
if (!file.exists("data")) {dir.create("data")}

## Getting project's data 
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file(fileUrl, destfile = "./data/Dataset.zip", method = "curl") 

## Unzip project's data
unzip(zipfile = "./data/Dataset.zip", exdir = "./Dataset")

  
## 1. Merging the training and the test sets to create one data set.
  
  # Read data
    features <- read.table("./Dataset/UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
    activities <- read.table("./Dataset/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
    
    x_train <- read.table("./Dataset/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
    y_train <- read.table("./Dataset/UCI HAR Dataset/train/y_train.txt", col.names = "code")
    subject_train <- read.table("./Dataset/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
    
    x_test <- read.table("./Dataset/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
    y_test <- read.table("./Dataset/UCI HAR Dataset/test/y_test.txt", col.names = "code")
    subject_test <- read.table("./Dataset/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
    

    # Merge the training and the test sets to create one data set.
    x <- rbind(x_train, x_test)
    y <- rbind(y_train, y_test)
    subject <- rbind(subject_train, subject_test)
    merged_data <- cbind(subject, y, x)
    
      
## 2. Extracting only the measurements on the mean and standard deviation for each measurement.      
    measurements <- merged_data %>% 
      select(subject, code, contains("mean"), contains("std"))
     
    
## 3. Using descriptive activity names to name the activities in the data set. 
    measurements$code <- activities[measurements$code, 2]
    
    
## 4. Appropriately labeling the data set with descriptive variable names.   
    names(measurements)[2] = "activity"
    names(measurements) <- gsub("Acc", "Accelerometer", names(measurements))
    names(measurements) <- gsub("Gyro", "Gyroscope", names(measurements))
    names(measurements) <- gsub("BodyBody", "Body", names(measurements))
    names(measurements) <- gsub("Mag", "Magnitude", names(measurements))
    names(measurements) <- gsub("^t", "Time", names(measurements))
    names(measurements) <- gsub("^f", "Frequency", names(measurements))
    names(measurements) <- gsub("tBody", "TimeBody", names(measurements))
    names(measurements) <- gsub("-mean()", "Mean", names(measurements), ignore.case = TRUE)
    names(measurements) <- gsub("-std()", "STD", names(measurements), ignore.case = TRUE)
    names(measurements) <- gsub("-freq()", "Frequency", names(measurements), ignore.case = TRUE)
    names(measurements) <- gsub("angle", "Angle", names(measurements))
    names(measurements) <- gsub("gravity", "Gravity", names(measurements))


## 5. From the data set in step 4, create a second, independent tidy data set 
##    with the average of each variable for each activity and each subject. 
    
    TidyData <- measurements %>% 
      group_by(subject, activity) %>% 
      summarize_all(list(mean))
    
      # Write the 'TidyData' to a text file
      write.table(TidyData, "TidyData.txt", row.name=FALSE)
    