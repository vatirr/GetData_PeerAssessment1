.PHONY: clean all

mdfiles = CodeBook.md README.md

%.md: %.Rmd
	Rscript -e "library(knitr); knit(commandArgs(T))" $<
	rm -f $(<:.Rmd=.html)

all: tidy.txt $(mdfiles)

tidy.txt: Dataset.zip run_analysis.R
	Rscript run_analysis.R

Dataset.zip:
	curl -o Dataset.zip https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

clean:
	rm -f tidy.txt $(mdfiles)
