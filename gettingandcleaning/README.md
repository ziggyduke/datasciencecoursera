Getting and cleaning data w4 course project
===========================================
## Files

- `README.md`
This file
- `CodeBook.md`
Codebook describing variables
- `run_analysis.R`
The script that performs the data retrieval and cleaning
- `results.txt`
The saved result of the 5th step in the script.

## Analysis

The analysis is performed by running the `run_analysis.R` script
 
The code will download the data into a subfolder and subsequently run the data cleaning steps

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.


The output from the fifth step is saved in the file `results.txt`

