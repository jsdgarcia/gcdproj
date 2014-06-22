## "README"

The script starts by importing the names of the variables from the file "features.txt" and saves them in a vector called **features**.

It then uses the variable names upon importing the test and train data set tables, and includes two new columns for subject and activity id.

Both data sets are merged with rbind.

The resulting dataset is then subset maintaining only columns related to mean and standard deviation, as well as the ids for subject and activity.

Activity labels table is imported and merged with the dataset, creating a descriptive data for the activity variable.

The result is saved to a file.

An aggregation is carried out by using id's and activity description as grouping variable and appling mean function to the other variables.

The result is also saved to a file.
