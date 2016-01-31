Variables descriptions used on run_analysis.R:

    x_train, y_train, x_test, y_test, subject_train, subject_test, features and activity_labels contain the data from the downloaded files.
    All the data is charged in data frames TEST and TRAIN. We merge these two tables into TEST_AND_TRAIN.
    We filter columns with TEST_AND_TRAIN_SELECTED ( Columns with the words 'mean', 'std', 'subject' or 'activity').
    Finally, AVG_TEST_AND_TRAIN contains the relevant averages which were stored in a AVG_TEST_AND_TRAIN.txt file.
