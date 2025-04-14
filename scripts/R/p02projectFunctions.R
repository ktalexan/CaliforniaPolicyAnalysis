#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Title: California Policy Analysis R Data Processing
# Part 02: Project Functions ####
# Version: 2.0, April 2025
# Author: Dr. Kostas Alexandridis, GISP
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# If standalone, run the project setup script to load the required libraries and set up the environment
#source(file.path(getwd(), "scripts", "R", "p01projectSetup.R"))


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 1. Metadata ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Define the global project settings by creating a function that returns a list of the project's metadata

#' @title Project Metadata Function
#' @description Generates a list of metadata for the project based on the component and part.
#' @param prjComponent A string indicating the project component (e.g., "LC" for Legislative Committee or "AI" for Artificial Intelligence).
#' @param prjPart An integer indicating the project part (e.g., 0 for Maintenance Operations, 1 for Preliminary Operations, etc.).
#' @return A list containing metadata information such as project name, title, version, author, project years, start date, and end date.
#' @examples
#' projectMetadata("AI", 1)
#' projectMetadata("LC", 2)
#' @export metadata
projectMetadata <- function(prjComponent, prjPart) { # nolint: object_name_linter.
    # Set the project component
    if (prjComponent == "LC") {
        prjTitle <- "OCEA Legislative Committee Analysis"
        prjYears <- "2025-2026"
        startDate <- "2024-12-02"
    } else if (prjComponent == "AI") {
        prjTitle <- "AI Legislative Policy Analysis"
        prjYears <- c("2011-2012", "2013-2014", "2015-2016", "2017-2018", "2019-2020", "2021-2022", "2023-2024", "2025-2026")
        startDate <- "2010-12-02"
    }
    
    # Set the title based on the part
    if (prjPart == 0) {
        prjStep <- "Project Maintenance Operations"
    } else if (prjPart == 1) {
        prjStep <- "Part 1: Preliminary Operations"
    } else if (prjPart == 2) {
        prjStep <- "Part 2: Creating Bibliography Entries and Databases"
    } else if (prjPart == 3) {
        prjStep <- "Part 3: Analysis Markdown Documents"
    } else if (prjPart == 4) {
        prjStep <- "Part 4: Data Analysis and Visualization"
    }
    
    # create a new list
    data <- list(
        "name" = prjTitle,
        "title" = prjStep,
        "version" = glue("Version {projectVersion}, {format(Sys.Date(), '%B %Y')}"),
        "author" = "Dr. Kostas Alexandridis, GISP",
        "projectYears" = prjYears,
        "startDate" = startDate,
        "endDate" = Sys.Date()
    )
    # Set this program's metadata
    cat("Project Global Settings:\n")
    print(glue("\r\tName: \t{data$name}\n\r\tTitle: \t{data$title} \n\r\tVersion: {data$version} \n\r\tAuthor: {data$author}\n"))
    cat("Data Dates:\n")
    # join the prjYears with commas
    prjYears = paste(data$projectYears, collapse = ", ")
    
    print(glue("\r\tStart Date: \t{data$startDate}\n\r\tEnd Date: \t{data$endDate}\n\r\tPeriods: \t{paste(data$projectYears, collapse = ', ')}"))
    # Return the data list
    data
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2. Directories ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Define the global directory settings using the following function that returns a list of the project's directories

#' @title Project Directories Function
#' @description Generates a list of global directory settings for the project.
#' @details This function sets the working directory to the project's root directory and creates a list of paths for various project components, such as data, scripts, and metadata. It also prints the directory settings to the console for reference.
#' @return A list containing paths to various project directories.
#' @examples
#' dirs <- projectDirectories()
#' print(dirs)
#' @export projectDirectories
projectDirectories <- function() {
    # Get the basic project directory on the OneDrive Documents directory
    setwd(file.path(Sys.getenv("OneDriveConsumer"), "Documents", "GitHub", "CaliforniaPolicyAnalysis"))
    # Create a new data list
    data <- list(
        "pathPrj" = getwd(),
        "pathAdmin" = file.path(getwd(), "admin"),
        "pathAnalysis" = file.path(getwd(), "analysis"),
        "pathData" = file.path(getwd(), "data"),
        "pathDataDocs" = file.path(getwd(), "data", "documents"),
        "pathDataMd" = file.path(getwd(), "data", "markdown"),
        "pathDataRis" = file.path(getwd(), "data", "ris"),
        "pathGraphics" = file.path(getwd(), "graphics"),
        "pathMetadata" = file.path(getwd(), "metadata"),
        "pathScripts" = file.path(getwd(), "scripts"),
        "pathScriptsR" = file.path(getwd(), "scripts", "R"),
        "pathScriptsPy" = file.path(getwd(), "scripts", "python"),
        "pathScriptsMd" = file.path(getwd(), "scripts", "markdown"),
        "pathScriptsRis" = file.path(getwd(), "scripts", "ris"),
        "pathNotebooks" = file.path(getwd(), "metadata", "notebooks")
    )
    # Print output in console
    cat("Directory Global Settings:\n")
    print(glue(
        "\nGeneral:",
        "\n\tDefault: \t{data$pathScriptsR}",
        "\n\tProject: \t{data$pathPrj}",
        "\nData: ",
        "\n\tMain Data: \t{data$pathData}",
        "\n\tDocuments: \t{data$pathDataDocs}",
        "\n\tMarkdown: \t{data$pathDataMd}",
        "\n\tRIS: \t{data$pathDataRis}",
        "\nAnalysis: ",
        "\n\tAnalysis: \t{data$pathAnalysis}",
        "\n\tGraphics: \t{data$pathGraphics}",
        "\nScripts: ",
        "\n\tR Scripts: \t{data$pathScriptsR}",
        "\n\tPython Scripts: {data$pathScriptsPy}",
        "\n\tMarkdown Scripts: {data$pathScriptsMd}",
        "\n\tRIS Scripts: \t{data$pathScriptsRis}",
        "\nOther: ",
        "\n\tMetadata: \t{data$pathMetadata}",
        "\n\tNotebooks: \t{data$pathNotebooks}",
    ))
    # Return the data list
    data
}

# check if a file in the global environment
if (!exists("prjDirs")) {
    # if not, load the project directories
    prjDirs <- projectDirectories()
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 3. Bill Structure ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Define a function to add the bill structure

#' @title Add Bill Structure
#' @description Creates a structured list of metadata for a legislative bill.
#' @param year An integer representing the year of the bill.
#' @param bill A string representing the bill identifier (e.g., "AB-123").
#' @return A list containing metadata about the bill, including type, session, and URLs for various resources.
#' @examples
#' addBillStructure(2025, "AB-123")
#' @export addBillStructure
addBillStructure <- function(year, bill) {
    # Define variables for the bill
    id <- gsub("-", "", bill)
    period <- paste(year, year + 1, sep = "-")
    type <- switch(strsplit(bill, "-")[[1]][1],
        "AB" = "Assembly Bill",
        "SB" = "Senate Bill",
        "AR" = "Assembly Resolution",
        "SR" = "Senate Resolution",
        "ACR" = "Assembly Concurrent Resolution",
        "SCR" = "Senate Concurrent Resolution",
        "AJR" = "Assembly Joint Resolution",
        "SJR" = "Senate Joint Resolution",
        "ACA" = "Assembly Constitutional Amendment",
        "SCA" = "Senate Constitutional Amendment",
        NA
    )
    urlString <- paste0(year, year+1, "0", id)
    # Create a list entry for the bill
    data <- list(
        bblType = "BILL",
        purpose = "AI",
        id = id,
        type = type,
        no = as.integer(strsplit(bill, "-")[[1]][2]),
        section = period,
        body = "California Legislature",
        session = paste0(period, " Regular Session"),
        text = paste0("https://leginfo.legislature.ca.gov/faces/billTextClient.xhtml?bill_id=", urlString, "&search_keywords=artificial+intelligence"),
        history = paste0("https://leginfo.legislature.ca.gov/faces/billHistoryClient.xhtml?bill_id=", urlString),
        status = paste0("https://leginfo.legislature.ca.gov/faces/billStatusClient.xhtml?bill_id=", urlString),
        votes = paste0("https://leginfo.legislature.ca.gov/faces/billVotesClient.xhtml?bill_id=", urlString),
        analysis = paste0("https://leginfo.legislature.ca.gov/faces/billAnalysisClient.xhtml?bill_id=", urlString),
        todaysLaw = paste0("https://leginfo.legislature.ca.gov/faces/billCompareClient.xhtml?bill_id=", urlString),
        compare = paste0("https://leginfo.legislature.ca.gov/faces/billVersionsCompareClient.xhtml?bill_id=", urlString),
        topic = NA,
        title = paste0(bill, ": "),
        tldr = NA,
        tags = NA,
        sponsors = NA,
        cosponsors = NA,
        dateStart = NA,
        dateEnd = NA,
        dateUpdated = NA,
        version = NA,
        outcome = NA,
        chaptered = NA,
        chapterNo = NA,
        active = NA,
        result = NA,
        vote = NA,
        appropriation = NA,
        fiscal = NA,
        local = NA,
        urgency = NA,
        tax = NA,
        action = NA,
        pdf = NA,
        aiDisposition = NA,
        aiType = NA,
        aiSector = NA,
        aiSubSector = NA,
        aiDomain = NA,
        aiAccountability = NA,
        aiImpact = NA,
        aiEthics = NA,
        aiInnovation = NA,
        aiPrivacy = NA,
        aiTransparency = NA
    )
    # Remove unnecessary variables
    #rm(id, period, type, urlString)
    # Return the data
    data
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 4. Add Sponsors ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Define a function to add sponsors to the bill data

#' @title Add Sponsors
#' @description Generates a list of sponsors for a given year and set of names.
#' @param year An integer representing the year of the sponsors.
#' @param names A vector of strings representing the names of the sponsors.
#' @return A list containing sponsor details for the specified year.
#' @examples
#' addSponsors(2025, c("John Doe", "Jane Smith"))
#' @export addSponsors
addSponsors <- function(year, names) {
    sponsors_list <- list()
    for (name in names) {
        if (name %in% names(calMembers[[year]])) {
            sponsors_list[[name]] = calMembers[[year]][[name]]
        } else {
            stop(paste("Sponsor", name, "not found in year", year, "Possible alternatives:", grep(substr(name, 1, nchar(name) - 2), names(calMembers[[year]]), value = TRUE)))
        }
    }
    # Return the sponsors list
    sponsors_list
}

#~~~~~~~~~~~~~~~~~~~~~~~~~
# 5. Create Bill Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~

# Define a function to create bill data for a legislative session

#' @title Create Bill Data
#' @description Generates a list of bill data for a specified year and period.
#' @param year A string representing the years of the legislative session.
#' @details The year should be in the format "YYYY-YYYY" (e.g., "2025-2026").
#' The function requires (a) the 'jsonlite' package to read JSON files and (b) the 'prjDirs' object to specify the path to the metadata and data directories.
#' @return A list containing bill data for the specified year and period.
#' @examples
#' createBillData("2025-2026")
#' @export createBillData
createBillData <- function(year) {
    # construct the lookup period string
    period <- paste0("Y", gsub("-", "", year))
    periodMd <- fromJSON(file.path(prjDirs$pathMetadata, "legiscanMetadata.json"))[[period]]
    # convert to date the periodMd$modified and periodMd$exported
    modified <- as.Date(periodMd$modified, format = "%m-%d-%Y")
    exported <- as.Date(periodMd$exported, format = "%m-%d-%Y")

    # Create a new list to store the bill data
    aiBills <- list()
        
    # Loop through each bill in the specified year
    for (b in names(fromJSON(file.path(prjDirs$pathMetadata, "listBillsAI.json"))[[period]])) {
        # Read the JSON file for the bill
        aiBills[[b]] <- fromJSON(file.path(prjDirs$pathData, "legiscan", "json", year, "bill", paste0(b, ".json")))$bill
    }

    cat(year, "Bill Data:\n", "- Number of Bills:", length(names(aiBills)), "\n", "- List of Bills: ", paste(names(aiBills), collapse = ", "), "\n", "- Modified: ", format(modified, "%m/%d/%Y"), "\n", "- Exported: ", format(exported, "%m/%d/%Y"), "\n")

    # Return the list of bills
    aiBills
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 5. Save Functions ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Save the metadata function to disk
save(projectMetadata, file = file.path(prjDirs$pathData, "projectMetadata.RData"))

# Save the project directories function to disk
save(projectDirectories, file = file.path(prjDirs$pathData, "projectDirectories.RData"))

# Save the bill structure function to disk
save(addBillStructure, file = file.path(prjDirs$pathData, "addBillStructure.RData"))

# Save the sponsors function to disk
save(addSponsors, file = file.path(prjDirs$pathData, "addSponsors.RData"))

# Save the create bill data function to disk
save(createBillData, file = file.path(prjDirs$pathData, "createBillData.RData"))

# Clear the workspace
#rm(list = ls())

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# End of Script ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
