#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# AI POLICY ANALYSIS PROJECT
# Add AI Bills Data for 2025-2026
# Version: 1.0, March 2025
# Author: Dr. Kostas Alexandridis, GISP
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~
# 1. Preliminaries ####
#~~~~~~~~~~~~~~~~~~~~~~

# Empty the R environment before running the code
rm(list = ls())

# Version of the code
ver <- 1.0

# Define the list of libraries to be loaded
liblist <- c("lubridate", "jsonlite", "dplyr", "magrittr", "R6", "haven", "labelr", "plyr", "stringr", "purrr", "glue", "Hmisc", "psych", "tibble", "here", "tidyr", "knitr", "labelled", "collapse", "formattable")

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

# Load the list of California legislature members (dataframe and list)
load(file = "dfCalMembers.RData")
load(file = "calMembers.RData")
load(file = "addBillStructure.RData")
load(file = "addSponsors.RData")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 3. Compile Preliminary AI Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Define the list of bills to be added
billList <- c("SB-813", "SB-833", "SB-579", "AB-316", "SB-524", "SB-366", "SB-420", "SB-11", "SB-468", "AB-412", "AB-1064", "AB-489", "AB-512", "AB-979", "AB-853", "AB-1405", "AB-410", "SB-243", "SB-503", "SB-53", "AB-222", "SB-238", "AB-1159", "AB-1137", "AB-682", "SB-711", "AB-93", "SB-7", "AB-723", "AB-1024", "AB-279", "AB-1018", "AB-1242", "AB-392", "SJR-2", "AB-325", "SB-57", "SB-295", "AB-887", "AB-1170", "SB-354")

# Define the list to store the AI bills data for 2013-2014
aiBills20132014 <- list()

# Loop through each year in the AI Bill List and create a template for each bill
for (bill in billList) {
    id <- gsub("-", "", bill)
    # Call the function to add the bill structure
    aiBills20252026[[id]] <- addBillStructure(2025, bill)
}

# Remove unnecessary variables
rm(bill, id)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 4. Populate AI Bill Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## SB-813 ####

## SB-833 ####

## SB-579 ####

## AB-316 ####

## SB-524 ####

## SB-366 ####

## SB-420 ####

## SB-11 ####

## SB-468 ####

## AB-412 ####

## AB-1064 ####

## AB-489 ####

## AB-512 ####

## AB-979 ####

## AB-853 ####

## AB-1405 ####

## AB-410 ####

## SB-243 ####

## SB-503 ####

## SB-53 ####

## AB-222 ####

## SB-238 ####

## AB-1159 ####

## AB-1137 ####

## AB-682 ####

## SB-711 ####

## AB-93 ####

## SB-7 ####

## AB-723 ####

## AB-1024 ####

## AB-279 ####

## AB-1018 ####

## AB-1242 ####

## AB-392 ####

## SJR-2 ####

## AB-325 ####

## SB-57 ####

## SB-295 ####

## AB-887 ####

## AB-1170 ####

## SB-354 ####

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 5. Export and Save Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Remove unnecessary variables
rm(billList)

# Export the dfCalMembers data frame to the data directory as an RData file
save(aiBills20252026, file = file.path(prjDirs$pathData, "aiBills20252026.RData"))

# Export the calMembers list to the data directory as an RData file
save(calMembers, file = file.path(prjDirs$pathData, "calMembers.RData"))

#~~~~~~~~~~~~~~~~~~~
# End of Script ####
#~~~~~~~~~~~~~~~~~~~
