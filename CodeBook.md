# CodeBook

## Overview
This codebook describes the variables, data, and transformations used in theGetting and Cleaning Data Course Project.

## Data Set Information
The data set used in this project is collected from the accelerometers of the Samsung Galaxy S smartphone. The data includes measurements of various activities performed by subjects.

## Variables
- `subject`: Identifier of the subject who performed the activity (1-30).
- `activity`: Activity performed by the subject (e.g., WALKING, SITTING).
- `tBodyAcc-mean()-X`: Mean value of body acceleration in the X direction (in g).
- `tBodyAcc-mean()-Y`: Mean value of body acceleration in the Y direction (in g).
- `tBodyAcc-mean()-Z`: Mean value of body acceleration in the Z direction (in g).
- `tBodyAcc-std()-X`: Standard deviation of body acceleration in the X direction (in g).
- `tBodyAcc-std()-Y`: Standard deviation of body acceleration in the Y direction (in g).
- `tBodyAcc-std()-Z`: Standard deviation of body acceleration in the Z direction (in g).
- `tGravityAcc-mean()-X`: Mean value of gravity acceleration in the X direction (in g).
- `tGravityAcc-mean()-Y`: Mean value of gravity acceleration in the Y direction (in g).
- `tGravityAcc-mean()-Z`: Mean value of gravity acceleration in the Z direction (in g).
- `tGravityAcc-std()-X`: Standard deviation of gravity acceleration in the X direction (in g).
- `tGravityAcc-std()-Y`: Standard deviation of gravity acceleration in the Y direction (in g).
- `tGravityAcc-std()-Z`: Standard deviation of gravity acceleration in the Z direction (in g).


## Transformations
1. **Merging Data Sets**: Combined the training and test data sets to create one data set.
    - Read feature names and activity labels.
    - Read training and test data sets.
    - Merged the training and test sets using `rbind` and `cbind`.
2. **Extracting Measurements**: Extracted measurements on the mean and standard deviation for each measurement.
    - Selected columns containing "mean" and "std" using `select` from `dplyr`.
3. **Descriptive Activity Names**: Applied descriptive activity names to the data set.
    - Mapped activity codes to descriptive names using the `activities` data frame.
4. **Labeling Data Set**: Appropriately labeled the data set with descriptive variable names.
    - Used the `features` data frame to label columns.
5. **Creating Tidy Data Set**: Created a second, independent tidy data set with the average of each variable for each activity and each subject.
    - Grouped data by `subject` and `activity`, then calculated the mean for each group.

## Units
- Acceleration measurements (`tBodyAcc-mean()`, `tBodyAcc-std()`) are in standard gravity units `g`.

## Notes
- The data set is tidy and ready for analysis.
- All transformations and cleaning steps are performed in the `run_analysis.R` script.
