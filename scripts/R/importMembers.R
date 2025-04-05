#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# AI POLICY PROJECT ####
# Import CA Legislature Members List ####
# Version: 1.0, March 2025 ####
# Author: Dr. Kostas Alexandridis, GISP ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~
# 1. Preliminaries ####
#~~~~~~~~~~~~~~~~~~~~~~

# Empty the R environment before running the code
rm(list = ls())

# Set version number
ver <- 1.0


# Define the list of libraries to be loaded
liblist <- c("lubridate", "jsonlite", "dplyr", "magrittr", "R6", "haven", "labelr", "plyr", "stringr", "purrr", "glue", "Hmisc", "psych", "tibble", "here", "tidyr", "knitr", "labelled", "collapse", "formattable", "readxl")

# Load the libraries
sapply(liblist, require, character.only = TRUE)


#~~~~~~~~~~~~~~~~~~~~
# 2. Definitions ####
#~~~~~~~~~~~~~~~~~~~~

# Set the initial working directory to the data directory
setwd(file.path(Sys.getenv("OneDriveConsumer"), "Documents", "Projects", "PolicyAnalysis", "data"))

# Load the projectMetadata and projectDirectories functions from the RData files
load(file = "projectMetadata.RData")
load(file = "projectDirectories.RData")

# Get the metadata
metadata <- projectMetadata(prjComponent = "AI", prjPart = 0)

# Get the project directories
prjDirs <- projectDirectories()


# Set the initial working directory to the R data directory
setwd(prjDirs$pathData)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 3. Process Legislature Members ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Define the path to the Excel file
xldata <- file.path(prjDirs$pathMetadata, "CA Legislature Members Historical.xlsx")

# Import the Excel file into a data frame
dfCalMembers <- read_excel(xldata, sheet = "California Legislature")
print(head(dfCalMembers))

# Create an empty list to store the members by period
calMembers <- list()

# Loop through each unique period in the data frame
# and create a nested list structure for each member
for (period in unique(dfCalMembers$Period)) {
    subset <- dfCalMembers[dfCalMembers$Period == period, ]
    calMembers[[period]] <- list()
    for (row in 1:nrow(subset)) {
        name = subset[row, ]$Label
        calMembers[[period]][[name]] <- list(
            display = subset[row, ]$Display,
            lastName = subset[row, ]$LastName,
            firstName = subset[row, ]$FirstName,
            fullName = subset[row, ]$Name,
            session = subset[row, ]$LegislativeSession,
            period = subset[row, ]$Period,
            body = subset[row, ]$Body,
            district = subset[row, ]$District,
            districtId = subset[row, ]$DistrictID,
            party = subset[row, ]$Party,
            partyAbbrev = subset[row ,]$PartyAbbrev,
            tags = c(subset[row, ]$TagDistrict, subset[row, ]$TagParty, subset[row, ]$TagSession),
            residence = subset[row, ]$Residence,
            limits = subset[row, ]$TermLimited,
            notes = subset[row, ]$Notes
        )
    }
}

rm(name, row, xldata, subset, period)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 4. Export and Save Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Export the dfCalMembers data frame to the data directory as an RData file
save(dfCalMembers, file = file.path(prjDirs$pathData, "dfCalMembers.RData"))

# Export the calMembers list to the data directory as an RData file
save(calMembers, file = file.path(prjDirs$pathData, "calMembers.RData"))


#~~~~~~~~~~~~~~~~~~~
# End of Script ####
#~~~~~~~~~~~~~~~~~~~


