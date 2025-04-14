#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Title: California Policy Analysis R Data Processing
# Part 02: Project Functions ####
# Version: 2.0, April 2025
# Author: Dr. Kostas Alexandridis, GISP
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# If standalone, run the project setup script to load the required libraries and set up the environment
#source(file.path(getwd(), "scripts", "R", "p01projectSetup.R"))

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 1. Preliminaries ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Define the API key and base URL for LegiScan API
apiKey <- Sys.getenv("LEGISCAN_API_KEY")
baseUrl <- "https://api.legiscan.com/?key="

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2. Metadata ####
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
# 3. Directories ####
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
# 4. Bill Structure ####
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
# 5. Add Sponsors ####
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

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 6. Look Up Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~
## 6.1. Session Lookup ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~

# Define a function to look up the session list from the LegiScan API

#' @title Lookup Session
#' @description Retrieves the session list from the LegiScan API for a specified year.
#' @param none No parameters required for this function.
#' @return A list containing session information for the specified year.
#' @examples
#' lookupSession()
#' @export lookupSession
lookupSession <- function() {
    # Construct the URL for the LegiScan API session list
    opUrlSession <- "&op=getSessionList&state=CA"
    sessionListUrl <- paste0(baseUrl, apiKey, opUrlSession)

    # Fetch the session list from the LegiScan API
    if (status_code(GET(sessionListUrl)) == 200) {
        print("LegiScan API Session List retrieved successfully")
        sessionList <- content(GET(sessionListUrl), as = "parsed", type = "application/json")$sessions
        names(sessionList) <- sapply(sessionList, function(x) glue("Y{x$year_start}{x$year_end}"))
    } else {
        stop("Failed to fetch data from LegiScan API.")
    }
    # Return the session list
    sessionList
}

#~~~~~~~~~~~~~~~~~~~~~~~~~
## 6.2. Lookup People ####
#~~~~~~~~~~~~~~~~~~~~~~~~~

# Define a function to look up people from the LegiScan API

#' @title Lookup People
#' @description Retrieves the people list from the LegiScan API for a specified year.
#' @param year An integer representing the year for which to retrieve the people list.
#' @return A list containing people information for the specified year.
#' @examples
#' lookupPeople(2025)
#' @export lookupPeople
lookupPeople <- function() {
    # Construct the URL for the LegiScan API people list
    opUrlPeople <- "&op=getSessionPeople&id="
    
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 6.3. Lookup Datasets ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Define a function to look up datasets from the LegiScan API

#' @title Lookup Datasets
#' @description Retrieves the dataset list from the LegiScan API for a specified year.
#' @param none No parameters required for this function.
#' @return A list containing dataset information for the specified year.
#' @examples
#' lookupDatasets(2025)
#' @export lookupDatasets
lookupDatasets <- function() {
    # Construct the URL for the LegiScan API dataset list
    opUrlDataset <- "&op=getDatasetList&state=CA"
    datasetListUrl <- paste0(baseUrl, apiKey, opUrlDataset)

    # Fetch the dataset list from the LegiScan API
    if (status_code(GET(datasetListUrl)) == 200) {
        print("LegiScan API Dataset List retrieved successfully")
        datasetList <- content(GET(datasetListUrl), as = "parsed", type = "application/json")$datasetlist
        names(datasetList) <- sapply(datasetList, function(x) glue("Y{x$year_start}{x$year_end}"))
    } else {
        stop("Failed to fetch data from LegiScan API.")
    }
    # Return the dataset list
    datasetList
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 6.4. Store Dataset Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Define a function to store dataset data from the LegiScan API

#' @title Store Dataset Data
#' @description Downloads and extracts dataset data from the LegiScan API for a specified dataset.
#' @param dataset A list containing dataset information, including session ID and access key.
#' @return None. The function downloads and extracts the dataset data to the specified directory.
#' @examples
#' storeDatasetData(datasetList$Y20252026)
#' @export storeDatasetData
storeDatasetData <- function(dataset) {
    # Get the years string
    years <- paste0(dataset$year_start, "-", dataset$year_end)
    # Construct the URL for the LegiScan API dataset list
    datasetUrl <- paste0(baseUrl, apiKey,"&op=getDataset&access_key=", dataset$access_key, "&id=", dataset$session_id)
    
    # get the response
    resp <- GET(datasetUrl)
    # check the response status
    if (http_error(resp)) {
        stop("Failed to retrieve dataset for session ID: ", dataset$session_id)
    }
    # parse the content
    content <- content(resp)
    dataDecode <- base64_dec(content[["dataset"]][["zip"]])
    temp <- file.path(prjDirs$pathData, "temp.zip")
    writeBin(dataDecode, temp)

    # Using the unzip function extract only the contents of a subdirectory in the zipped file, to a new directory
    unzip(temp, exdir = file.path(prjDirs$pathData, "temp"))

    # Read the folders in the temp directory
    tempFolder <- list.files(file.path(prjDirs$pathData, "temp", "CA"))

    # Read the files in the temp folder
    tempFiles <- list.files(file.path(prjDirs$pathData, "temp", "CA", tempFolder))

    # Check if the destination directory exists, if not create it
    if (!dir.exists(file.path(prjDirs$pathData, "legiscan", "datasets", years))) {
        dir.create(file.path(prjDirs$pathData, "legiscan", "datasets", years), recursive = TRUE)
    }

    # copy the files in the tempFolder to a new directory
    file.copy(file.path(prjDirs$pathData, "temp", "CA", tempFolder, tempFiles), file.path(prjDirs$pathData, "legiscan", "datasets", years), overwrite=TRUE, recursive = TRUE)

    # Delete the temp folder and zip file from the data directory
    unlink(file.path(prjDirs$pathData, "temp"), recursive = TRUE)
    unlink(file.path(prjDirs$pathData, "temp.zip"))

    cat("Dataset for session ID: ", dataset$session_id, " downloaded and extracted successfully.\n")
    cat("Files saved to: ", file.path(prjDirs$pathData, "legiscan", "datasets", years), "\n")
}

# Define a function to check the hash of the dataset and store it if necessary
# It is good to run this function before running the storeDatasetData function

#' @title Check Hash
#' @description Checks the hash of the dataset and stores it if necessary.
#' @param dataset A list containing dataset information, including session ID and access key.
#' @return None. The function checks the hash and stores the dataset data if needed.
#' @examples
#' checkHash(datasetList$Y20252026)
#' @export checkHash
checkHash <- function(dataset) {
    hashDataset <- dataset$dataset_hash
    filePath <- file.path(prjDirs$pathData, "legiscan", "datasets", paste0(dataset$year_start, "-", dataset$year_end), "hash.md5")
    hashFile <- readLines(filePath, warn = FALSE)
    # if the hashDataset and hashFile are the same, do nothing, else run the storeDatasetData function
    if (hashDataset == hashFile) {
        message("The dataset hash is the same as the file hash. No need to update the dataset.")
    } else {
        message("The dataset hash is different from the file hash. Updating the dataset.")
        storeDatasetData(dataset)
    }
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 7. Create Bill Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 3. Preliminary AI Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 3.1. Get AI Bills Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Function to get AI Bills Data
# This function takes a list of bills and a year as input and returns the data for each bill in the list

#' @title Get AI Bills Data
#' @description This function takes a list of bills and a year as input and returns the data for each bill in the list.
#' @param list A list of bills to be processed.
#' @param years A string representing the year of the bills to be processed.
#' @return A list of data for each bill in the input list.
#' @examples
#' getAiBillsData(list = aiBillsList$Y20132014, years = "2013-2014")
#' @export getAiBillsData
getAiBillsData <- function(list, years) {
    # Begin the process
    cat("Processing AI Bills for", years, "Legislative Session")
    # Get the year list label
    yearsLabel <- paste0("Y", gsub("-", "", years))
    # Create an internal list to store the data
    data <- list()
    # Loop through the list of bills and read the JSON files from disk
    for (bill in names(list)) {
        billData <- read_json(file.path(prjDirs$pathData, "legiscan", "datasets", years, "bill", paste0(bill, ".json")), simplifyVector = TRUE)$bill
        
        # Add each bill to the data list
        data[[bill]] <- billData
    }
    # Return the data list
    cat("\n- Total bills:", length(names(data)), "\n")
    # list the names of the bills separated by commas
    cat("- Bill names:", paste(names(data), collapse = ", "), "\n")
    data
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 8. Save Functions ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Save the metadata function to disk
save(projectMetadata, file = file.path(prjDirs$pathData, "projectMetadata.RData"))

# Save the project directories function to disk
save(projectDirectories, file = file.path(prjDirs$pathData, "projectDirectories.RData"))

# Save the bill structure function to disk
save(addBillStructure, file = file.path(prjDirs$pathData, "addBillStructure.RData"))

# Save the sponsors function to disk
save(addSponsors, file = file.path(prjDirs$pathData, "addSponsors.RData"))

# Save the session lookup function to disk
save(lookupSession, file = file.path(prjDirs$pathData, "lookupSession.RData"))

# Save the people lookup function to disk
save(lookupPeople, file = file.path(prjDirs$pathData, "lookupPeople.RData"))

# Save the lookup datasets function to disk
save(lookupDatasets, file = file.path(prjDirs$pathData, "lookupDatasets.RData"))

# Save the store dataset data function to disk
save(storeDatasetData, file = file.path(prjDirs$pathData, "storeDatasetData.RData"))

# Save the create bill data function to disk
save(createBillData, file = file.path(prjDirs$pathData, "createBillData.RData"))

# Save the get AI bills data function to disk
save(getAiBillsData, file = file.path(prjDirs$pathData, "getAiBillsData.RData"))

# Clear the workspace
#rm(list = ls())

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# End of Script ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
