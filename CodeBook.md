Code Book
=========



The processed data set consists of 180 observations of 68 variables.  The input data set is the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), which is a

> Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Selection of variables and summaries
------------------------------------

### Numerical variables

* Of the input data, only the means and standard deviations within sampling windows are retained. They are identified in the source data set as features having "-mean()" or "-std()" as a component in their name.
* The names of the retained variables have been only minimally modified to make them legal variable names in R:
    1. Hyphens have been replaced with dots.
    2. Parentheses have been removed.
    
    For instance, *tBodyAcc-mean()-X* has become *tBodyAcc.mean.X*.
* The variables are unit-less, having already been normalized in the input data.
* For physical descriptions and experimental setup you are refererred to the code book of the input data.
    
### Categorical variables

* *activity*: one of LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS.
* *subject*: the individual, identified by a number from 1 to 30, whose motion is being measured while performing one of the activities above.

### Summaries
The selected numeric variables are averaged by subject and activity.
