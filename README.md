# Getting and Cleaning Data Course Project

## Project Overview
This project demonstrates the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The data set used in this project is collected from the accelerometers of the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

## Data
The data for this project can be found at the following link: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.

## Repository Contents
- `run_analysis.R`: Script to perform the data analysis.
- `CodeBook.md`: Describes the variables, data, and transformations performed to clean the data.
- `README.md`: This file, providing an overview of the project and instructions.
- `TidyData.txt`: The tidy dataset derived from the final step of the analysis.

## Analysis
The `run_analysis.R` script performs the following steps:
1. Merges the training and test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Instructions
1. Download the data set from the link provided above.
2. Unzip the data set into your working directory.
3. Run the `run_analysis.R` script to generate the tidy data set.

## Code Book
The `CodeBook.md` file provides detailed information about the variables, data, and transformations used in this project.
