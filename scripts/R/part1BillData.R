#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# AI POLICY PROJECT ####
# Part 1: Import AI Bill Data ####
# Version: 1.0, March 2025 ####
# Author: Dr. Kostas Alexandridis, GISP ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~
# 1. Preliminaries ####
#~~~~~~~~~~~~~~~~~~~~~~

# Empty the R environment before running the code
rm(list = ls())

# Define the list of libraries to be loaded
liblist <- c("lubridate", "jsonlite", "dplyr", "magrittr", "R6", "haven", "labelr", "plyr", "stringr", "purrr", "glue", "Hmisc", "psych", "tibble", "here", "tidyr", "knitr", "labelled", "collapse", "formattable")

# Load the libraries
sapply(liblist, require, character.only = TRUE)


#~~~~~~~~~~~~~~~~~~~~
# 2. Definitions ####
#~~~~~~~~~~~~~~~~~~~~

# Set the initial working directory to the data directory
setwd(file.path(Sys.getenv("OneDriveCommercial"), "Documents", "aiPolicy", "data"))

# Load the projectMetadata and projectDirectories functions from the RData files
load(file = "projectMetadata.RData")
load(file = "projectDirectories.RData")

# Get the metadata
metadata <- projectMetadata(part = 0)

# Get the project directories
prjDirs <- projectDirectories()


# Set the initial working directory to the R data directory
setwd(file.path(Sys.getenv("OneDriveCommercial"), "Documents", "aiPolicy", "data"))

# Load the AI Bills list ####
load(file.path("aiBills.RData"))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 3. Import AI Bill Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~


createRisData <- function(bill) {
    # Set the working directory to the ris data directory
    setwd(file.path(prjDirs$dataPath, "ris"))
    
    # Define the file name
    risfile <- paste0(bill, ".ris")
    
    # Define the json bill data
    billdata <- aiBills[[bill]]
    
    # check if the file exists and if it does, delete it
    if (file.exists(risfile)) {
        cat("File already exists. Deleting the file...\n")
        file.remove(risfile)
        cat("Creating the ris file.\n")
        file.create(risfile)
    } else {
        cat("Creating the ris file.\n")
        file.create(risfile)
    }
    
    # Check if there are any open connections and close them
    if (length(showConnections()) > 0) {
        closeAllConnections()
    }
    
    # Create the file connection
    fileConn <- file(risfile, open = "wt")
    
    # Write the RIS header
    writeLines("TY  - BILL", fileConn)
    
    # Write the bill number and titles
    writeLines(
        c(
            paste0("M1  - ", gsub("-", "", billdata$billNumber)),
            paste0("ST  - ", billdata$billNumber, ": ", billdata$shortTitle),
            paste0("TI  - ", billdata$billNumber, ": ", billdata$title)
        ), fileConn)
    
    # Write the sponsor information
    # Check if the sponsor is a single person or multiple people
    if (length(billdata$sponsor) > 1) {
        # If there are multiple sponsors, write them as separate lines
        for (i in seq_along(billdata$sponsor)) {
            writeLines(paste0("A2  - ", billdata$sponsor[i]), fileConn)
        }
    } else {
        # If there is only one sponsor, write it as a single line
        writeLines(paste0("A2  - ", billdata$sponsor), fileConn)
    }
    
    # Write the cosponsor information
    if (length(billdata$cosponsor) > 1) {
        # If there are multiple cosponsors, write them as separate lines
        for (i in seq_along(billdata$cosponsor)) {
            writeLines(paste0("A3  - ", billdata$sponsor[i]), fileConn)
        }
    } else {
        # If there is only one cosponsor, write it as a single line
        writeLines(paste0("A3  - ", billdata$cosponsor), fileConn)
    }
    
    # Write the bill information
    writeLines(
        c(
            paste0("SE  - ", billdata$session),
            paste0("T3  - ", billdata$legislativeBody),
            paste0("ET  - ", billdata$session),
            paste0("T2  - ", billdata$code),
            paste0("VL  - ", billdata$codeVolume),
            paste0("DA  - ", billdata$date),
            paste0("Y2  - ", billdata$lastUpdated),
            paste0("UR  - ", billdata$text),
            paste0("OP  - ", billdata$history),
            paste0("AB  - ", billdata$tldr),
            paste0("N1  - ", billdata$digest),
            paste0("M2  - sponsorUrl: ", billdata$sponsorUrl),
            paste0("M2  - district: ", billdata$district),
            paste0("M2  - party: ", billdata$party),
            paste0("M2  - outcome: ", billdata$measureOutcome),
            paste0("M2  - chapterNo: ", billdata$chapterNo),
            paste0("M2  - measureVote: ", billdata$measureVote),
            paste0("M2  - measureAppropriation: ", billdata$measureAppropriation),
            paste0("M2  - measureFiscal: ", billdata$measureFiscal),
            paste0("M2  - measureLocal: ", billdata$measureLocal),
            paste0("M2  - measureUrgency: ", billdata$measureUrgency),
            paste0("M2  - measureTax: ", billdata$measureTax),
            paste0("M2  - aiDisposition: ", billdata$aiDisposition),
            paste0("M2  - aiType: ", billdata$aiType),
            paste0("M2  - aiSector: ", billdata$aiSector),
            paste0("M2  - aiSubsector: ", billdata$aiSubsector),
            paste0("M2  - aiDomain: ", billdata$aiDomain),
            paste0("M2  - aiAccountability: ", billdata$aiAccountability),
            paste0("M2  - aiImpact: ", billdata$aiImpact),
            paste0("M2  - aiEthics: ", billdata$aiEthics),
            paste0("M2  - aiInnovation: ", billdata$aiInnovation),
            paste0("M2  - aiPrivacy: ", billdata$aiPrivacy),
            paste0("M2  - aiTransparency: ", billdata$aiTransparency),
            paste0("KW  - ", gsub(" ", "-", tolower(billdata$legislativeBody))),
            paste0("KW  - ", gsub(" ", "-", tolower(billdata$session))),
            paste0("KW  - ", gsub(" ", "-", tolower(billdata$type))),
            paste0("KW  - party-", tolower(billdata$party)),
            paste0("KW  - ", tolower(strsplit(billdata$type, " ")[[1]][1]), "-district-", billdata$district)
            
        ), fileConn)
    
    # Write the status outcome
    if (billdata$measureOutcome == "In Progress") {
        writeLines("KW  - active-bill-in-progress", fileConn)
    } else if (billdata$measureOutcome == "Failed") {
        writeLines("KW  - inactive-bill-died", fileConn)
    }
    
    # Write the AI disposition
    writeLines(paste0("KW  - ", tolower(billdata$aiDisposition)), fileConn)
    
    # find if "Artificial Intelligence" is not in the billdata$tags
    if (any(!grepl("Artificial Intelligence", billdata$tags))) {
        writeLines("KW  - artificial-intelligence", fileConn)
    }
    
    # Write the remaining keywords to the file
    for (tag in billdata$tags) {
        writeLines(paste0("KW  - ", gsub(" ", "-", tolower(tag))), fileConn)
    }
    
    # Write the end of record line
    writeLines("ER  - ", fileConn)
    
    # Close the file connection
    close(fileConn)
    
    # Print a message indicating that the file has been created
    cat(glue("File {risfile} created successfully.\n"))
    
    # Check if there are any open connections and close them
    if (length(showConnections()) > 0) {
        closeAllConnections()
    }
    
    # Return
    return()
}


# Create a function that generates a single ris file for all the bills
batchRisData <- function(file) {
    # Set the working directory to the ris data directory
    setwd(file.path(prjDirs$dataPath, "ris"))
    
    risfile <- "aiBills.ris"
    
    # check if the file exists and if it does, delete it
    if (file.exists(risfile)) {
        cat("File already exists. Deleting the file...\n")
        file.remove(risfile)
        cat("Creating the ris file.\n")
        file.create(risfile)
    } else {
        cat("Creating the ris file.\n")
        file.create(risfile)
    }
    
    # Check if there are any open connections and close them
    if (length(showConnections()) > 0) {
        closeAllConnections()
    }
    
    # Create the file connection
    fileConn <- file(risfile, open = "wt")
    
    # Loop through each bill in the data
    for(bill in names(file)) {
        
        # Get the bill data
        billdata <- file[[bill]]
        
        # Write the RIS header
        writeLines("TY  - BILL", fileConn)
        
        # Write the bill number and titles
        writeLines(
            c(
                paste0("M1  - ", gsub("-", "", billdata$billNumber)),
                paste0("ST  - ", billdata$billNumber, ": ", billdata$shortTitle),
                paste0("TI  - ", billdata$billNumber, ": ", billdata$title)
            ), fileConn)
        
        # Write the sponsor information
        # Check if the sponsor is a single person or multiple people
        if (length(billdata$sponsor) > 1) {
            # If there are multiple sponsors, write them as separate lines
            for (i in seq_along(billdata$sponsor)) {
                writeLines(paste0("A2  - ", billdata$sponsor[i]), fileConn)
            }
        } else {
            # If there is only one sponsor, write it as a single line
            writeLines(paste0("A2  - ", billdata$sponsor), fileConn)
        }
        
        # Write the cosponsor information
        if (length(billdata$cosponsor) > 1) {
            # If there are multiple cosponsors, write them as separate lines
            for (i in seq_along(billdata$cosponsor)) {
                writeLines(paste0("A3  - ", billdata$sponsor[i]), fileConn)
            }
        } else {
            # If there is only one cosponsor, write it as a single line
            writeLines(paste0("A3  - ", billdata$cosponsor), fileConn)
        }
        
        # Write the bill information
        writeLines(
            c(
                paste0("SE  - ", billdata$session),
                paste0("T3  - ", billdata$legislativeBody),
                paste0("ET  - ", billdata$session),
                paste0("T2  - ", billdata$code),
                paste0("VL  - ", billdata$codeVolume),
                paste0("DA  - ", billdata$date),
                paste0("Y2  - ", billdata$lastUpdated),
                paste0("UR  - ", billdata$text),
                paste0("OP  - ", billdata$history),
                paste0("AB  - ", billdata$tldr),
                paste0("N1  - ", billdata$digest),
                paste0("M2  - sponsorUrl: ", billdata$sponsorUrl),
                paste0("M2  - district: ", billdata$district),
                paste0("M2  - party: ", billdata$party),
                paste0("M2  - outcome: ", billdata$measureOutcome),
                paste0("M2  - chapterNo: ", billdata$chapterNo),
                paste0("M2  - measureVote: ", billdata$measureVote),
                paste0("M2  - measureAppropriation: ", billdata$measureAppropriation),
                paste0("M2  - measureFiscal: ", billdata$measureFiscal),
                paste0("M2  - measureLocal: ", billdata$measureLocal),
                paste0("M2  - measureUrgency: ", billdata$measureUrgency),
                paste0("M2  - measureTax: ", billdata$measureTax),
                paste0("M2  - aiDisposition: ", billdata$aiDisposition),
                paste0("M2  - aiType: ", billdata$aiType),
                paste0("M2  - aiSector: ", billdata$aiSector),
                paste0("M2  - aiSubsector: ", billdata$aiSubsector),
                paste0("M2  - aiDomain: ", billdata$aiDomain),
                paste0("M2  - aiAccountability: ", billdata$aiAccountability),
                paste0("M2  - aiImpact: ", billdata$aiImpact),
                paste0("M2  - aiEthics: ", billdata$aiEthics),
                paste0("M2  - aiInnovation: ", billdata$aiInnovation),
                paste0("M2  - aiPrivacy: ", billdata$aiPrivacy),
                paste0("M2  - aiTransparency: ", billdata$aiTransparency),
                paste0("KW  - ", gsub(" ", "-", tolower(billdata$legislativeBody))),
                paste0("KW  - ", gsub(" ", "-", tolower(billdata$session))),
                paste0("KW  - ", gsub(" ", "-", tolower(billdata$type))),
                paste0("KW  - party-", tolower(billdata$party)),
                paste0("KW  - ", tolower(strsplit(billdata$type, " ")[[1]][1]), "-district-", billdata$district)
                
            ), fileConn)
        
        # Write the status outcome
        if (billdata$measureOutcome == "In Progress") {
            writeLines("KW  - active-bill-in-progress", fileConn)
        } else if (billdata$measureOutcome == "Failed") {
            writeLines("KW  - inactive-bill-died", fileConn)
        }
        
        # Write the AI disposition
        writeLines(paste0("KW  - ", tolower(billdata$aiDisposition)), fileConn)
        
        # find if "Artificial Intelligence" is not in the billdata$tags
        if (any(!grepl("Artificial Intelligence", billdata$tags))) {
            writeLines("KW  - artificial-intelligence", fileConn)
        }
        
        # Write the remaining keywords to the file
        for (tag in billdata$tags) {
            writeLines(paste0("KW  - ", gsub(" ", "-", tolower(tag))), fileConn)
        }
        
        # Write the end of record line
        writeLines("ER  - ", fileConn)
        
        # Write the next line
        writeLines("", fileConn)
        
        # Print a message indicating that the file has been created
        cat(glue("Bill {bill} added.\n"))
    }
    
    # Close the file connection
    close(fileConn)
    
    # Check if there are any open connections and close them
    if (length(showConnections()) > 0) {
        closeAllConnections()
    }
    
    # Return
    return()
}

batchRisData(aiBills)

