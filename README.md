Analysis of the UCI HAR Dataset
===============================

The following three sections outline the steps carried out in [run_analysis.R](run_analysis.R) to analyze the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Phase 1: Loading
----------------

* The analysis script expects the input dataset to be present, in zip format, as a file named `Dataset.zip`.
* The function `loader(filename)` reads a file directly from the zip file.
* Activity labels are loaded from the input dataset.
* Features labels are also loaded from the zip file; any parentheses in the labels are removed.
* The function `read_data_set(subsetname)` reads one set of measures (train or test) from the zip file.
    * The column names are applied while reading the files: *activity*, *subject*, and then all the features labels, which have been read before.
    * The underlying calls to `read.table` also ensure that any hyphen present in the feature labels gets replaced by dots in the column names.

Phase 2: Processing
-------------------

1. `rbind` is used to merge the data from test and training sets.

2. A regular expression is used to select the columns to keep in the analysis, together with the first two columns (activity and subject). See the [code book](CodeBook.md) for rationales.

3. The `factor` with the activity levels read before is applied as descriptive labels to the activity column.

4. No further modification to the column names is necessary.

5. `colMeans` is used together with `ddply` in the `plyr` package to compute the means per activity and subject.  `g[-(1:2)]` excludes the activity and subject columns from the calculations of the mean.

Phase 3: Saving
---------------

The tidy data set is saved in a space-separated text file, with the first row as header.

The output can be read back with:


```r
tidy <- read.table('tidy.txt', header=T)
```

Makefile
========

This project also has a makefile which, on systems which support it, takes care of

* Downloading `Dataset.zip` from the web;
* Running [run_analysis.R](run_analysis.R);
* Generating markdown files from `.Rmd` source.
