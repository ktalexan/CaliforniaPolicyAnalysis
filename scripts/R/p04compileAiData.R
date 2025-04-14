#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Title: California Policy Analysis R Data Processing
# Part 04: Compile Preliminary AI Data ####
# Version: 2.0, April 2025
# Author: Dr. Kostas Alexandridis, GISP
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 1. Definitions ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Run the projectFunctions script to update the latest version of the project functions
source(file.path(getwd(), "scripts", "R", "p01projectSetup.R"))
source(file.path(getwd(), "scripts", "R", "p02projectFunctions.R"))
source(file.path(getwd(), "scripts", "R", "p03importMembers.R"))

# Set the initial working directory to the R data directory
setwd(prjDirs$pathData)

# Define the metadata for this project component
metadata <- projectMetadata(prjComponent = "AI", prjPart = 0)

# Get the project directories
prjDirs <- projectDirectories()

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2. Lookup Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Obtain and Construct Lookup Data

#~~~~~~~~~~~~~~~~~~~~~~~~
## 2.1. Session List ####
#~~~~~~~~~~~~~~~~~~~~~~~~

# Fetch the session list from the LegiScan API
sessionList <- lookupSession()

# Export the session list to a JSON file
write_json(sessionList, file.path(prjDirs$pathMetadata, "sessionList.json"), pretty = TRUE, auto_unbox = TRUE)

# Save the session list as an RData file
save(sessionList, file = file.path(prjDirs$pathData, "sessionList.RData"))

#~~~~~~~~~~~~~~~~~~~~~~~
## 2.2. People List ####
#~~~~~~~~~~~~~~~~~~~~~~~
# Get the people list from LegiScan API

# Construct the URL for the LegiScan API session people
opUrlPeople <- "&op=getSessionPeople&id="

# for each session in the session list, get the session_id
# and construct the URL for the LegiScan API session people
sessionPeopleUrls <- lapply(sessionList, function(x) {
    sessionId <- x$session_id
    paste0(baseUrl, apiKey, opUrlPeople, sessionId)
})

# Fetch the session people from the LegiScan API
sessionPeople <- lapply(sessionPeopleUrls, function(x) {
    response <- GET(x)
    if (status_code(response) == 200) {
        content(response, as = "parsed", type = "application/json")$sessionpeople
    } else {
        stop("Failed to fetch data from LegiScan API.")
    }
})

# Export the session people to a JSON file
write_json(sessionPeople, file.path(prjDirs$pathMetadata, "sessionPeople.json"), pretty = TRUE, auto_unbox = TRUE)

# Save the session people as an RData file
save(sessionPeople, file = file.path(prjDirs$pathData, "sessionPeople.RData"))

#~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 2.3. Lookup Datasets ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Get the lookup datasets from LegiScan API
datasetList <- lookupDatasets()

# Export the lookup datasets to a JSON file
write_json(datasetList, file.path(prjDirs$pathMetadata, "datasetList.json"), pretty = TRUE, auto_unbox = TRUE)

# Save the lookup datasets as an RData file
save(datasetList, file = file.path(prjDirs$pathData, "datasetList.RData"))

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 2.4. Store Dataset Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Store the dataset data for each session in the dataset list (the archived sessions from 2013 to 2024 don't need to be updated. Only the 2025-2026 session needs to be updated).

for (period in c("Y20132014", "Y20172018", "Y20192020", "Y20212022", "Y20232024", "Y20252026")) {
    cat("\nChecking for updated hash in", paste0(datasetList[[period]]$year_start, "-", datasetList[[period]]$year_end), "dataset\n")
    checkHash(datasetList[[period]])
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 3. Get AI Bills Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# load the listBillsAI.json file from the metadata directory
aiBillsList <- read_json(file.path(prjDirs$pathMetadata, "listBillsAI.json"), simplifyVector = TRUE)

# Create an empty list to store the AI bills data
aiBillsData <- list()

# Loop through each year in the AI Bills List and add the bills data to the master list
for (period in c("Y20132014", "Y20172018", "Y20192020", "Y20212022", "Y20232024", "Y20252026")) {
    years <- paste0(str_sub(gsub("Y", "", period), 1, 4), "-", str_sub(gsub("Y", "", period), -4, -1))
    aiBillsData[[period]] <- getAiBillsData(aiBillsList[[period]], years)
    cat("\n")
}

# Save the AI Bills Data as an RData file
save(aiBillsData, file = file.path(prjDirs$pathData, "aiBillsData.RData"))




## 3.1. Monitor Bills ####
#~~~~~~~~~~~~~~~~~~~~~~~~~
# Get the raw monitor bills from LegiScan API (includes hash tags)
opUrlMonitor <- "&op=getMonitorListRaw&record=all"
monitorBillsUrl <- paste0(baseUrl, apiKey, opUrlMonitor)

# Fetch the monitor bills from the LegiScan API
if (status_code(GET(monitorBillsUrl)) == 200) {
    monitorBills <- content(GET(monitorBillsUrl), as = "parsed", type = "application/json")$monitorlist
    # Create a new list with the bill number as the name for each object
    namedMonitorBills <- lapply(monitorBills, function(x) {
        x$bill_number <- x$bill_number  # Ensure bill_number is included
        x
    })
    names(namedMonitorBills) <- sapply(monitorBills, function(x) x$number)
} else {
    stop("Failed to fetch data from LegiScan API.")
}

# Export the monitor bills to a JSON file
write_json(namedMonitorBills, file.path(prjDirs$pathMetadata, "monitorBills.json"), pretty = TRUE, auto_unbox = TRUE)

# Save the monitor bills as an RData file
save(namedMonitorBills, file = file.path(prjDirs$pathData, "monitorBills.RData"))




## 3.1. AI Bill List ####
#~~~~~~~~~~~~~~~~~~~~~~~~

# The AI Bill List is a list of bills related to artificial intelligence in California legislature
# The list is organized by year and contains the bill numbers for each year
aiBillList <- list(
    Y20132014 = c("SB-836", "SB-860", "AB-1465"),
    Y20172018 = c("ACR-215", "SB-1470", "AB-2662", "AB-1809", "SB-843"),
    Y20192020 = c("SB-348", "SJR-6", "AB-459", "AB-1576", "AB-976", "AB-594", "SB-444", "SB-730", "AB-156", "AB-3317", "SCR-13", "ACR-125", "SB-752", "AB-2269", "AB-3339", "AB-485"),
    Y20212022 = c("SB-1216", "AB-2224", "AB-587", "SR-11", "AB-2826", "AB-1545", "AB-1400", "SB-54", "AB-1651", "AB-178", "AB-179", "SB-178", "SB-179"),
    Y20232024 = c("AB-2652", "SB-1288", "AB-2013", "AB-2811", "SB-893", "SB-1235", "SB-896", "SB-313", "SB-970", "AB-3030", "SB-1229", "SB-1120", "SB-398", "AB-3058", "SB-1047", "AB-3204", "AB-2876", "AB-2885", "AB-3095", "AB-1831", "SB-942", "ACR-96", "SB-933", "SB-892", "AB-2355", "SB-1381", "AJR-6", "AB-1873", "SCR-17", "AB-2905", "AB-3050", "AB-3211", "AB-2877", "AB-331", "SB-1220", "AB-2512", "ACR-227", "AB-2930", "AB-1027", "AB-302", "SCR-121", "AB-2412", "AB-2839", "ACR-219", "SB-1446", "SCR-162", "SB-1154", "AB-2655", "AB-1008", "AB-1526", "AB-2200", "SB-1223", "AB-108", "AB-103", "AB-2928", "AB-100", "SB-100", "SB-103", "AB-106", "SB-158", "SB-106", "AB-158", "AB-104", "SB-104", "SB-107", "AB-107", "AB-1754"),
    Y20252026 = c("SB-813", "SB-833", "SB-579", "AB-316", "SB-524", "SB-366", "SB-420", "SB-11", "SB-468", "AB-412", "AB-1064", "AB-489", "AB-512", "AB-979", "AB-853", "AB-1405", "AB-410", "SB-243", "SB-503", "SB-53", "AB-222", "SB-238", "AB-1159", "AB-1137", "AB-682", "SB-711", "AB-93", "SB-7", "AB-723", "AB-1024", "AB-279", "AB-1018", "AB-1242", "AB-392", "SJR-2", "AB-325", "SB-57", "SB-295", "AB-887", "AB-1170", "SB-354")
)

# Calculate and display the number of bills for each year and the total number of bills
cat(
    "Bills Summary:\n",
    "- 2013-2014: ", length(aiBillList$Y20132014), " bills\n",
    "- 2017-2018: ", length(aiBillList$Y20172018), " bills\n",
    "- 2019-2020: ", length(aiBillList$Y20192020), " bills\n",
    "- 2021-2022: ", length(aiBillList$Y20212022), " bills\n",
    "- 2023-2024: ", length(aiBillList$Y20232024), " bills\n",
    "- 2025-2026: ", length(aiBillList$Y20252026), " bills\n",
    "- Total: ", sum(sapply(aiBillList, length)), " bills\n",
    sep = ""
)

# Save the AI Bill List as an RData file
save(aiBillList, file = "aiBillList.RData")


## 3.2. AI Bill Data Template ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Create an empty list to store the AI bill data
aiBillData <- list()

# Loop through each year in the AI Bill List and create a template for each bill
for (year in names(aiBillList)) {
    aiBillData[[year]] <- list()
    bblType <- "BILL"
    purpose <- "AI"
    section <- switch(year,
        Y20132014 = "2013-2014",
        Y20172018 = "2017-2018",
        Y20192020 = "2019-2020",
        Y20212022 = "2021-2022",
        Y20232024 = "2023-2024",
        Y20252026 = "2025-2026",
        NA
    )
    body <- "California Legislature"
    session <- switch(year,
        Y20132014 = "2013-2014 Regular Session",
        Y20172018 = "2017-2018 Regular Session",
        Y20192020 = "2019-2020 Regular Session",
        Y20212022 = "2021-2022 Regular Session",
        Y20232024 = "2023-2024 Regular Session",
        Y20252026 = "2025-2026 Regular Session",
        NA
    )
    for (bill in aiBillList[[year]]) {
        id <- gsub("-", "", bill)
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
        urlString <- paste0(substr(year, 2, nchar(year)), "0", id)
        aiBillData[[year]][[id]] <- list(
            bblType = bblType,
            purpose = purpose,
            id = id,
            no = as.integer(strsplit(bill, "-")[[1]][2]),
            type = type,
            section = section,
            body = body,
            session = session,
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
            dateUpdated = Sys.Date(),
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
    }
}

# Remove unnecessary variables from the environment
rm(year, bill, bblType, purpose, section, body, session, id, type, urlString)

# Save the AI Bill Data template as an RData file
save(aiBillData, file = "aiBillData.RData")

