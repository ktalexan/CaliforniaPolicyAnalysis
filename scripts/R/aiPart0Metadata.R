#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# AI POLICY ANALYSIS PROJECT ####
# Part 0: Project Definitions ####
# Version: 1.0, March 2025 ####
# Author: Dr. Kostas Alexandridis, GISP ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ver <- 1.0


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


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 3. Compile Preliminary AI Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## 3.1. AI Bill List ####
#~~~~~~~~~~~~~~~~~~~~~~~~

# The AI Bill List is a list of bills related to artificial intelligence in California legislature
# The list is organized by year and contains the bill numbers for each year
aiBillList <- list(
    Y20132014 = c("SB-836", "SB-860", "AB-1465"),
    Y20172018 = c("ACR-215", "SB-1470", "AB-2662", "AB-1809", "SB-843"),
    Y20192020 = c("SB-348", "SJR-6", "AB-459", "AB-1576", "AB-976", "AB-594", "SB-444", "SB-730", "AB-156", "AB-3317", "SCR-13", "ACR-125", "SB-752", "AB-2269", "AB-3339", "AB-485"),
    Y20212022 = c("SB-1216", "AB-2224", "AB-587", "SR-11", "AB-2826", "AB-1545", "AB-1400", "SB-54", "AB-1651", "AB-179"),
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
    bblType = "BILL"
    purpose = "AI"
    section = switch(year,
        Y20132014 = "2013-2014",
        Y20172018 = "2017-2018",
        Y20192020 = "2019-2020",
        Y20212022 = "2021-2022",
        Y20232024 = "2023-2024",
        Y20252026 = "2025-2026",
        NA
    )
    body = "California Legislature"
    session = switch(year,
        Y20132014 = "2013-2014 Regular Session",
        Y20172018 = "2017-2018 Regular Session",
        Y20192020 = "2019-2020 Regular Session",
        Y20212022 = "2021-2022 Regular Session",
        Y20232024 = "2023-2024 Regular Session",
        Y20252026 = "2025-2026 Regular Session",
        NA
    )
    for (bill in aiBillList[[year]]) {
        id = gsub("-", "", bill)
        type = switch(strsplit(bill, "-")[[1]][1],
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
        urlString = paste0(substr(year, 2, nchar(year)),"0",id)
        aiBillData[[year]][[id]] <- list(
            bblType = bblType,
            purpose = purpose,
            id = id,
            no = as.integer(strsplit(bill, "-")[[1]][2]),
            type = type,
            section = section,
            body = body,
            session = session,
            text = paste0("https://leginfo.legislature.ca.gov/faces/billTextClient.xhtml?bill_id=", urlString,"&search_keywords=artificial+intelligence"),
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
rm(bill, bblType, purpose, section, body, session, id, type, urlString)

# Save the AI Bill Data template as an RData file
save(aiBillData, file = "aiBillData.RData")


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 4. Populate AI Bill Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## 2013-2014 ####
#~~~~~~~~~~~~~~~~

### SB-836 ####

print(aiBillData$Y20132014$SB836$text)

# Topic
aiBillData$Y20132014$SB836$topic <- "SB-836 Brain research: Cal-BRAIN program"

# Title
aiBillData$Y20132014$SB836$title <- paste0(aiBillData$Y20132014$SB836$title, "An act to add Chapter 15 (commencing with Section 92985) to Part 57 of Division 9 of Title 3 of the Education Code, relating to brain research.")

# tldr for aiBillData$Y20132014$SB836$text
aiBillData$Y20132014$SB836$tldr <- "SB-836 establishes the California Brain Research through Advancing Innovative Neurotechnologies (Cal-BRAIN) program to support research and development of neurotechnologies for brain disorders. The program aims to advance understanding of the brain and improve treatments for brain-related conditions. It is a collaborative effort involving various stakeholders, including state agencies, research institutions, and private organizations."

# tags (lowercase, words separated by dash)
aiBillData$Y20132014$SB836$tags <- c("artificial-intelligence", "brain-research", "cal-brain-program", "neurotechnologies", "brain-disorders", "research-and-development", "collaboration", "state-agencies", "research-institutions", "private-organizations")

# sponsors
aiBillData$Y20132014$SB836$sponsors = list(
    Corbett = calMembers$Y20132014$Corbett
)

# cosponsors
aiBillData$Y20132014$SB836$cosponsors = list(
    Anderson = calMembers$Y20132014$Anderson,
    Beall = calMembers$Y20132014$Beall,
    Block = calMembers$Y20132014$Block,
    Cannella = calMembers$Y20132014$Cannella,
    Correa = calMembers$Y20132014$Correa,
    Evans = calMembers$Y20132014$Evans,
    Galgiani = calMembers$Y20132014$Galgiani,
    Hancock = calMembers$Y20132014$Hancock,
    Hill = calMembers$Y20132014$Hill,
    Lara = calMembers$Y20132014$Lara,
    Lieu = calMembers$Y20132014$Lieu,
    Liu = calMembers$Y20132014$Liu,
    Nielsen = calMembers$Y20132014$Nielsen,
    Roth = calMembers$Y20132014$Roth,
    Wolk = calMembers$Y20132014$Wolk,
    Skinner = calMembers$Y20132014$Skinner,
    Waldron = calMembers$Y20132014$Waldron
)

# dateStart
aiBillData$Y20132014$SB836$dateStart <- as.Date("2014-01-06")

# dateEnd
aiBillData$Y20132014$SB836$dateEnd <- as.Date("2014-11-30")

# dateUpdated
aiBillData$Y20132014$SB836$dateUpdated <- Sys.Date()

# version
aiBillData$Y20132014$SB836$version <- "Amended Senate"

# outcome
aiBillData$Y20132014$SB836$outcome <- "Failed"

# chaptered
aiBillData$Y20132014$SB836$chaptered <- FALSE

# chapterNo
aiBillData$Y20132014$SB836$chapterNo <- NA

# active
aiBillData$Y20132014$SB836$active <- FALSE

# result
aiBillData$Y20132014$SB836$result <- "Died"

# vote
aiBillData$Y20132014$SB836$vote <- "Majority"

# appropriation
aiBillData$Y20132014$SB836$appropriation <- FALSE

# fiscal
aiBillData$Y20132014$SB836$fiscal <- FALSE

# local
aiBillData$Y20132014$SB836$local <- FALSE

# urgency
aiBillData$Y20132014$SB836$urgency <- FALSE

# tax
aiBillData$Y20132014$SB836$tax <- FALSE

# action
aiBillData$Y20132014$SB836$action <- "From Assembly without further action"

# pdf
aiBillData$Y20132014$SB836$pdf <- "20130SB83695AMD.pdf"

# aiDisposition
aiBillData$Y20132014$SB836$aiDisposition <- "Supportive"

# aiType
aiBillData$Y20132014$SB836$aiType <- "Research and Development"

# aiSector
aiBillData$Y20132014$SB836$aiSector <- "Health"

# aiSubSector
aiBillData$Y20132014$SB836$aiSubSector <- "Neuroscience"

# aiDomain
aiBillData$Y20132014$SB836$aiDomain <- "Neuroscience"

# aiAccountability
aiBillData$Y20132014$SB836$aiAccountability <- "Accountable"

# aiImpact
aiBillData$Y20132014$SB836$aiImpact <- "Positive"

# aiEthics
aiBillData$Y20132014$SB836$aiEthics <- "Ethical"

# aiInnovation
aiBillData$Y20132014$SB836$aiInnovation <- "Innovative"

# aiPrivacy
aiBillData$Y20132014$SB836$aiPrivacy <- "Privacy"

# aiTransparency
aiBillData$Y20132014$SB836$aiTransparency <- "Transparent"


### SB-860 ####

print(aiBillData$Y20132014$SB860$text)

# Topic
aiBillData$Y20132014$SB860$topic <- "SB-860 Education finance: education omnibus trailer bill"

# Title
aiBillData$Y20132014$SB860$title <- paste0(aiBillData$Y20132014$SB860$title, "An act to amend Sections 69432, 69432.7, 69433.6, 70022, 70023, 79200, 81821, 84321.6, 84750.5, 84751, 87482, 89295, 92493, 92494, 92495, 92495.5, and 92675 of, to amend the heading of Article 5 (commencing with Section 79200) of Chapter 9 of Part 48 of Division 7 of Title 3 of, to add Sections 79204, 79205, 79206, 79207, 79208, 79209, 84750.6, 84754.6, 89712, 90083, 92495.6, and 94102.1 to, to add Article 1.5 (commencing with Section 78220) to Chapter 2 of Part 48 of Division 7 of Title 3 of, to add Article 5 (commencing with Section 89770) to Chapter 6 of Part 55 of Division 8 of Title 3 of, and to add Chapter 15 (commencing with Section 92985) to Part 57 of Division 9 of Title 3 of, the Education Code, to amend Sections 17581.7 and 68926.3 of the Government Code, to amend Section 13146 of the Health and Safety Code, and to amend Sections 10726 and 10742 of the Public Contract Code, relating to postsecondary education, and making an appropriation therefor, to take effect immediately, bill related to the budget.")

# tldr for aiBillData$Y20132014$SB860$text
aiBillData$Y20132014$SB860$tldr <- "SB-860 is an education omnibus trailer bill that makes various amendments to the Education Code and other related codes. It includes provisions related to postsecondary education, funding, and program implementation. The bill aims to streamline processes, enhance educational opportunities, and ensure compliance with state regulations. It also addresses budget-related matters and appropriations for educational programs."

# tags
# (lowercase, words separated by dash, include "artificial-intelligence")
aiBillData$Y20132014$SB860$tags <- c("artificial-intelligence", "education-finance", "education-omnibus-trailer-bill", "postsecondary-education", "funding", "program-implementation", "streamlining-processes", "educational-opportunities", "state-regulations", "budget-related-matters")

# sponsors
aiBillData$Y20132014$SB860$sponsors = list(
    CommitteeBFR = calMembers$Y20132014$CommitteeBFR
)

# cosponsors
aiBillData$Y20132014$SB860$cosponsors = NA

# dateStart
aiBillData$Y20132014$SB860$dateStart <- as.Date("2014-01-09")

# dateEnd
aiBillData$Y20132014$SB860$dateEnd <- as.Date("2014-06-20")

# dateUpdated
aiBillData$Y20132014$SB860$dateUpdated <- Sys.Date()

# version
aiBillData$Y20132014$SB860$version <- "Chaptered"

# outcome
aiBillData$Y20132014$SB860$outcome <- "Chaptered"

# chaptered
aiBillData$Y20132014$SB860$chaptered <- TRUE

# chapterNo
aiBillData$Y20132014$SB860$chapterNo <- 34

# active
aiBillData$Y20132014$SB860$active <- FALSE

# result
aiBillData$Y20132014$SB860$result <- "Chaptered"

# vote
aiBillData$Y20132014$SB860$vote <- "Majority"

# appropriation
aiBillData$Y20132014$SB860$appropriation <- TRUE

# fiscal
aiBillData$Y20132014$SB860$fiscal <- TRUE

# local
aiBillData$Y20132014$SB860$local <- TRUE

# urgency
aiBillData$Y20132014$SB860$urgency <- TRUE

# tax
aiBillData$Y20132014$SB860$tax <- FALSE

# action
aiBillData$Y20132014$SB860$action <- "Chaptered by Secretary of State. Chapter 34, Statutes of 2014"

# pdf
aiBillData$Y20132014$SB860$pdf <- "20130SB86096CHP.pdf"

# aiDisposition
aiBillData$Y20132014$SB860$aiDisposition <- "Neutral"

# aiType
aiBillData$Y20132014$SB860$aiType <- "Research and Development"

# aiSector
aiBillData$Y20132014$SB860$aiSector <- "Education"

# aiSubSector
aiBillData$Y20132014$SB860$aiSubSector <- "Postsecondary Education"

# aiDomain
aiBillData$Y20132014$SB860$aiDomain <- "Education"

# aiAccountability
aiBillData$Y20132014$SB860$aiAccountability <- "Accountable"

# aiImpact
aiBillData$Y20132014$SB860$aiImpact <- "Positive"

# aiEthics
aiBillData$Y20132014$SB860$aiEthics <- "Ethical"

# aiInnovation
aiBillData$Y20132014$SB860$aiInnovation <- "Innovative"

# aiPrivacy
aiBillData$Y20132014$SB860$aiPrivacy <- "Privacy"

# aiTransparency
aiBillData$Y20132014$SB860$aiTransparency <- "Transparent"

