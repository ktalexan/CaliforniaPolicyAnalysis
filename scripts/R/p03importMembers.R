#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Title: California Policy Analysis R Data Processing
# Part 03: Import CA Legislature Members ####
# Version: 2.0, April 2025
# Author: Dr. Kostas Alexandridis, GISP
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# if standalone run the project setup script to load the required libraries and set up the environment
#source(file.path(getwd(), "scripts", "R", "p01projectSetup.R"))
#source(file.path(getwd(), "scripts", "R", "p02projectFunctions.R"))


#~~~~~~~~~~~~~~~~~~~~
# 1. Definitions ####
#~~~~~~~~~~~~~~~~~~~~

# Set the initial working directory to the data directory
setwd(file.path(getwd(), "data"))

# Load the projectMetadata and projectDirectories functions from the RData files
sapply(c("projectMetadata.Rdata", "projectDirectories.Rdata"), load, .GlobalEnv)

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
    for (row in 1:nrow(subset)) { # nolint: seq_linter.
        name <- subset[row, ]$Label
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
            partyAbbrev = subset[row, ]$PartyAbbrev,
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

# Return to the original working directory
setwd(prjDirs$pathPrj)

#~~~~~~~~~~~~~~~~~~~
# End of Script ####
#~~~~~~~~~~~~~~~~~~~
