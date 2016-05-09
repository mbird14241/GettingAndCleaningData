The script run_analysis.R analyses the published accelerometer data from the Samsung Galaxy S experiments.  It does the following:

1.  Reads training measurements, training activity data and training subject data.  It merges these assuming the rows in all 3 files correspond to the same sample.
2.  Reads testing measurements, testing activity data and testing subject data.  It merges these assuming the rows in all 3 files correspond to the same sample.
3.  Merges the combined training data set and testing data set assuming the column layout is identical.
4.  Reads column headers from the features.txt file.
5.  Searches the column headers and extracts columns containing means and standard deviations based on a text search of column headers.
6.  Applies a more descriptive name to the activity in each row.
7.  Applies the previously read headers to the complete data set.
8.  Groups the data samples by subject and activity and calculates averages for each column.
9.  Writes the summary data to a new file called summaryDataSet.csv.