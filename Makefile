.PHONY: clean all

%.md: %.Rmd
	/usr/bin/Rscript -e "library(knitr); knit(\"$<\")"

all: tidy.txt CodeBook.md README.md

tidy.txt: Dataset.zip run_analysis.R
	Rscript run_analysis.R

Dataset.zip:
	curl -o Dataset.zip https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

clean:
	rm -f tidy.txt CodeBook.md README.md
