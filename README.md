final project: Getting and Cleaning Data
A repo for the final output the week 4 final project. 

Includes:

An R script, titled "run_analysis.R" to write the tidy data set from the raw data
The original UCI HAR Dataset, in a folder titled "data"
The tidy data output, titled "wearable-tidy-data.txt"
A codebook including information on the tidy data file, as well the complete original info from the raw data
The Script
The run analyis script takes the raw data, combines and cleans it, and then outputs a tidy data set with the averages for the all measurements on the mean and standard deviation, by subject and activity.

How it works:

Run_analyis()
Gets all of the data from the original set and sets each one as a variable. Note: the files from the original set must be in a folder called 'data'
Using cbind (so combining side by side), combines the xTest and xTraining data.
Sets the column names of this new data frame to the second column of the features file (which includes the names for all the different types of measurements)
Using rbind (combining one on top of the other), combines the subject test and train files.
Sets the column name of this to "Subject"
Row bing the yTest and yTraining files
Sets the column name of this to "Activity"
Swaps out the numeric code for activity (i.e 1 = "Walking") for the descriptive name. For this, I used the activity label file as a guide
Using column bind, brings the frames from set 3, 5 and 8 together into one file
Gets the column names of the mean and standard deviation, using the getColumnNames function, described below.
Using the column names, get just the info for the mean and std
Column binds these into one file, along with the subject and activity names.
Using the native aggreate function, get mean for each column, by subject and activity
Remove the last two columns. Since the aggregate function includes subject and activity as the first two column, we no longer need them at the end (also, Activity is now all null, as teh aggreate function tried to run the mean function on the string, hence the error messages)
Write our tidy data to a txt file, setting the row.name argument to false.

getColumnNames()

Start with an empty variable called stringColNames.
Create a vector, colnames, that hold all possible column names from the data
Find the location of each column name that includes the string passed in the argument (either 'Mean' or 'Std').
Using a for loop, match the location of each column name with the actual name and (using the empty variable from before) create a vector with said names.
Remove the empty value in the above data frame that came with the init of it.
Return the clean vector of the column names including the string passed.
