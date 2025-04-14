# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Title: California Policy Analysis R Data Processing
# Part 01: Project Setup ####
# Version: 2.0, April 2025
# Author: Dr. Kostas Alexandridis, GISP
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Empty the R environment before running the code
rm(list = ls())

# Load the required libraries from libraries.json and apply them
library(jsonlite)
sapply(fromJSON(file.path(getwd(), "metadata", "libraries.json")), require, character.only = TRUE)

# Set version
projectVersion <- 2.0
