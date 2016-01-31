# run_analysis.R processes the data set provided by
#==================================================================
#Human Activity Recognition Using Smartphones Dataset
#Version 1.0
#==================================================================
#Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
#Smartlab - Non Linear Complex Systems Laboratory
#DITEN - Università degli Studi di Genova.
#Via Opera Pia 11A, I-16145, Genoa, Italy.
#activityrecognition@smartlab.ws
# www.smartlab.ws


# This function:
# reads all the test and training data and activity and features labels from the files.
# selects mean and std features from the data sets
# merges the test and training data sets
# using regular expressions changes the feature names to descriptive names
# creates a tidy data set with the average of each variable for each activity and each subject. 

# Output of this function is "TidyData.txt

# Farzad Moazzami 1/30/2016
