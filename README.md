# Project for Getting and Cleaning Data Course #

## Requirements for run_analysis.R script to run properly ##
- The UCI HAR Dataset directory must be in the same directory as the script.
- That is all.

## What does the run_analysis.R script do? ##
- It first reads in the features.txt file to get the field names for each feature column in the data sets
- It replaces the cryptic shortened names in the variables to more descriptive names.
- The subject and activity columns are read in from the subject and activity files.
- The actual observations for the test and train datasets are read in.
- The feature field names are applied to the train and test datasets.
- Only the columns that contain 'mean' or 'standardDeviation' are included while the other columns besides activity and subject are dropped.
- The subject and activitiy columns are appended to the train and test datasets.
- The train dataset is then appended to the test dataset to gather them into 1 dataset.
- The full dataset is then joined with the activity labels so that the activity labels are displayed instead of their numbers.
- The activity numbers column is dropped as we are only interested in the activity labels.
- To produce the 2nd dataset, the full dataset is reshaped so that the measurements take one row each. 
- Then their averages are taken and place in the next column.
- The 2nd dataset is then written to a file without row names. The file is named 'X_mean.txt'.
- The full dataset is also written to a file. The file is named 'X_all.txt'.
- Finally, the full dataset is returned in the function.