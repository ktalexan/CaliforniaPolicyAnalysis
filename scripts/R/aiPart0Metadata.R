#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# AI POLICY ANALYSIS PROJECT 
# Part 0: Project Definitions
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

# open the url for the bill text in the default web browser
browseURL(aiBillData$Y20132014$SB836$text)

# Topic from aiBillData$Y20132014$SB836$status
aiBillData$Y20132014$SB836$topic <- "SB-836 Brain research: Cal-BRAIN program"

# Title from aiBillData$Y20132014$SB836$status
aiBillData$Y20132014$SB836$title <- paste0(aiBillData$Y20132014$SB836$title, "An act to add Chapter 15 (commencing with Section 92985) to Part 57 of Division 9 of Title 3 of the Education Code, relating to brain research.")

# tldr for aiBillData$Y20132014$SB836$text
aiBillData$Y20132014$SB836$tldr <- "SB-836 establishes the California Brain Research through Advancing Innovative Neurotechnologies (Cal-BRAIN) program to support research and development of neurotechnologies for brain disorders. The program aims to advance understanding of the brain and improve treatments for brain-related conditions. It is a collaborative effort involving various stakeholders, including state agencies, research institutions, and private organizations."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBillData$Y20132014$SB836$tags <- c("artificial-intelligence", "brain-research", "cal-brain-program", "neurotechnologies", "brain-disorders", "research-and-development", "collaboration", "state-agencies", "research-institutions", "private-organizations")

# sponsors and cosponsors
aiBillData$Y20132014$SB836$sponsors <- list(
    CorbettS = calMembers$Y20132014$CorbettS
)
aiBillData$Y20132014$SB836$cosponsors <- list(
    AndersonS = calMembers$Y20132014$AndersonS,
    BeallS = calMembers$Y20132014$BeallS,
    BlockS = calMembers$Y20132014$BlockS,
    CannellaS = calMembers$Y20132014$CannellaS,
    CorreaS = calMembers$Y20132014$CorreaS,
    EvansS = calMembers$Y20132014$EvansS,
    GalgianiS = calMembers$Y20132014$GalgianiS,
    HancockS = calMembers$Y20132014$HancockS,
    HillS = calMembers$Y20132014$HillS,
    LaraS = calMembers$Y20132014$LaraS,
    LieuS = calMembers$Y20132014$LieuS,
    LiuS = calMembers$Y20132014$LiuS,
    NielsenS = calMembers$Y20132014$NielsenS,
    RothS = calMembers$Y20132014$RothS,
    WolkS = calMembers$Y20132014$WolkS,
    SkinnerA = calMembers$Y20132014$SkinnerA,
    WaldronA = calMembers$Y20132014$WaldronA
)

# dateStart, dateEnd, and dateUpdated
aiBillData$Y20132014$SB836$dateStart <- as.Date("2014-01-06")
aiBillData$Y20132014$SB836$dateEnd <- as.Date("2014-11-30")
aiBillData$Y20132014$SB836$dateUpdated <- Sys.Date()

# measures
aiBillData$Y20132014$SB836$version <- "Amended Senate"
aiBillData$Y20132014$SB836$outcome <- "Failed"
aiBillData$Y20132014$SB836$chaptered <- FALSE
aiBillData$Y20132014$SB836$chapterNo <- NA
aiBillData$Y20132014$SB836$active <- FALSE
aiBillData$Y20132014$SB836$result <- "Died"
aiBillData$Y20132014$SB836$vote <- "Majority"
aiBillData$Y20132014$SB836$appropriation <- FALSE
aiBillData$Y20132014$SB836$fiscal <- FALSE
aiBillData$Y20132014$SB836$local <- FALSE
aiBillData$Y20132014$SB836$urgency <- FALSE
aiBillData$Y20132014$SB836$tax <- FALSE
aiBillData$Y20132014$SB836$action <- "From Assembly without further action"
aiBillData$Y20132014$SB836$pdf <- "20130SB83695AMD.pdf"

# AI properties assessed from the text in aiBillData$Y20132014$SB836$text
aiBillData$Y20132014$SB836$aiDisposition <- "Supportive"
aiBillData$Y20132014$SB836$aiType <- "Research and Development"
aiBillData$Y20132014$SB836$aiSector <- "Health"
aiBillData$Y20132014$SB836$aiSubSector <- "Neuroscience"
aiBillData$Y20132014$SB836$aiDomain <- "Neuroscience"
aiBillData$Y20132014$SB836$aiAccountability <- "Moderate"
aiBillData$Y20132014$SB836$aiImpact <- "Moderate"
aiBillData$Y20132014$SB836$aiEthics <- "Moderate"
aiBillData$Y20132014$SB836$aiInnovation <- "Low"
aiBillData$Y20132014$SB836$aiPrivacy <- "Low"
aiBillData$Y20132014$SB836$aiTransparency <- "Moderate"

### SB-860 ####

# open the url for the bill text in the default web browser
browseURL(aiBillData$Y20132014$SB860$text)

# Topic from aiBillData$Y20132014$SB860$status
aiBillData$Y20132014$SB860$topic <- "SB-860 Education finance: education omnibus trailer bill"

# Title from aiBillData$Y20132014$SB860$status
aiBillData$Y20132014$SB860$title <- paste0(aiBillData$Y20132014$SB860$title, "An act to amend Sections 69432, 69432.7, 69433.6, 70022, 70023, 79200, 81821, 84321.6, 84750.5, 84751, 87482, 89295, 92493, 92494, 92495, 92495.5, and 92675 of, to amend the heading of Article 5 (commencing with Section 79200) of Chapter 9 of Part 48 of Division 7 of Title 3 of, to add Sections 79204, 79205, 79206, 79207, 79208, 79209, 84750.6, 84754.6, 89712, 90083, 92495.6, and 94102.1 to, to add Article 1.5 (commencing with Section 78220) to Chapter 2 of Part 48 of Division 7 of Title 3 of, to add Article 5 (commencing with Section 89770) to Chapter 6 of Part 55 of Division 8 of Title 3 of, and to add Chapter 15 (commencing with Section 92985) to Part 57 of Division 9 of Title 3 of, the Education Code, to amend Sections 17581.7 and 68926.3 of the Government Code, to amend Section 13146 of the Health and Safety Code, and to amend Sections 10726 and 10742 of the Public Contract Code, relating to postsecondary education, and making an appropriation therefor, to take effect immediately, bill related to the budget.")

# tldr for aiBillData$Y20132014$SB860$text
aiBillData$Y20132014$SB860$tldr <- "SB-860 is an education omnibus trailer bill that makes various amendments to the Education Code and other related codes. It includes provisions related to postsecondary education, funding, and program implementation. The bill aims to streamline processes, enhance educational opportunities, and ensure compliance with state regulations. It also addresses budget-related matters and appropriations for educational programs."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBillData$Y20132014$SB860$tags <- c("artificial-intelligence", "education-finance", "education-omnibus-trailer-bill", "postsecondary-education", "funding", "program-implementation", "streamlining-processes", "educational-opportunities", "state-regulations", "budget-related-matters")

# sponsors and cosponsors
aiBillData$Y20132014$SB860$sponsors <- list(
    CommitteeOnBudgetandFiscalReviewS = calMembers$Y20132014$CommitteeOnBudgetandFiscalReviewS
)
aiBillData$Y20132014$SB860$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBillData$Y20132014$SB860$dateStart <- as.Date("2014-01-09")
aiBillData$Y20132014$SB860$dateEnd <- as.Date("2014-06-20")
aiBillData$Y20132014$SB860$dateUpdated <- Sys.Date()

# measures
aiBillData$Y20132014$SB860$version <- "Chaptered"
aiBillData$Y20132014$SB860$outcome <- "Chaptered"
aiBillData$Y20132014$SB860$chaptered <- TRUE
aiBillData$Y20132014$SB860$chapterNo <- 34
aiBillData$Y20132014$SB860$active <- FALSE
aiBillData$Y20132014$SB860$result <- "Chaptered"
aiBillData$Y20132014$SB860$vote <- "Majority"
aiBillData$Y20132014$SB860$appropriation <- TRUE
aiBillData$Y20132014$SB860$fiscal <- TRUE
aiBillData$Y20132014$SB860$local <- TRUE
aiBillData$Y20132014$SB860$urgency <- TRUE
aiBillData$Y20132014$SB860$tax <- FALSE
aiBillData$Y20132014$SB860$action <- "Chaptered by Secretary of State. Chapter 34, Statutes of 2014"
aiBillData$Y20132014$SB860$pdf <- "20130SB86096CHP.pdf"

# AI properties assessed from the text in aiBillData$Y20132014$SB860$text
aiBillData$Y20132014$SB860$aiDisposition <- "Neutral"
aiBillData$Y20132014$SB860$aiType <- "Research and Development"
aiBillData$Y20132014$SB860$aiSector <- "Education"
aiBillData$Y20132014$SB860$aiSubSector <- "Postsecondary Education"
aiBillData$Y20132014$SB860$aiDomain <- "Education"
aiBillData$Y20132014$SB860$aiAccountability <- "Moderate"
aiBillData$Y20132014$SB860$aiImpact <- "Moderate"
aiBillData$Y20132014$SB860$aiEthics <- "Low"
aiBillData$Y20132014$SB860$aiInnovation <- "Moderate"
aiBillData$Y20132014$SB860$aiPrivacy <- "Moderate"
aiBillData$Y20132014$SB860$aiTransparency <- "Moderate"

### AB-1465 ####

# open the url for the bill text in the default web browser
browseURL(aiBillData$Y20132014$AB1465$text)

# Topic from aiBillData$Y20132014$AB1465$status
aiBillData$Y20132014$AB1465$topic <- "AB-1465 Education finance: education omnibus trailer bill"

# Title from aiBillData$Y20132014$AB1465$status
aiBillData$Y20132014$AB1465$title <- paste0(aiBillData$Y20132014$AB1465$title, "An act to amend Sections 69432, 69432.7, 69433.6, 70022, 70023, 79200, 81821, 84321.6, 84750.5, 84751, 87482, 89295, 92493, 92494, 92495, 92495.5, and 92675 of, to amend the heading of Article 5 (commencing with Section 79200) of Chapter 9 of Part 48 of Division 7 of Title 3 of, to add Sections 79204, 79205, 79206, 79207, 79208, 79209, 84750.6, 84754.6, 89712, 90083, 92495.6, and 94102.1 to, to add Article 1.5 (commencing with Section 78220) to Chapter 2 of Part 48 of Division 7 of Title 3 of, to add Article 5 (commencing with Section 89770) to Chapter 6 of Part 55 of Division 8 of Title 3 of, and to add Chapter 15 (commencing with Section 92985) to Part 57 of Division 9 of Title 3 of, the Education Code, to amend Sections 17581.7 and 68926.3 of the Government Code, to amend Section 13146 of the Health and Safety Code, and to amend Sections 10726 and 10742 of the Public Contract Code, relating to postsecondary education, and making an appropriation therefor, to take effect immediately, bill related to the budget")

# tldr for aiBillData$Y20132014$AB1465$text
aiBillData$Y20132014$AB1465$tldr <- "AB-1465 is an education omnibus trailer bill that makes various amendments to the Education Code and other related codes. It includes provisions related to postsecondary education, funding, and program implementation. The bill aims to streamline processes, enhance educational opportunities, and ensure compliance with state regulations. It also addresses budget-related matters and appropriations for educational programs."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBillData$Y20132014$AB1465$tags <- c("artificial-intelligence", "education-finance", "education-omnibus-trailer-bill", "postsecondary-education", "funding", "program-implementation", "streamlining-processes", "educational-opportunities", "state-regulations", "budget-related-matters")

# sponsors and cosponsors
aiBillData$Y20132014$AB1465$sponsors <- list(
    CommitteeOnBudgetA = calMembers$Y20132014$CommitteeOnBudgetA,
    SkinnerA = calMembers$Y20132014$SkinnerA,
    BloomA = calMembers$Y20132014$BloomA,
    CamposA = calMembers$Y20132014$CamposA,
    ChesbroA = calMembers$Y20132014$ChesbroA,
    DababnehA = calMembers$Y20132014$DababnehA,
    DalyA = calMembers$Y20132014$DalyA,
    DickinsonA = calMembers$Y20132014$DickinsonA,
    GordonA = calMembers$Y20132014$GordonA,
    JonesSawyerA = calMembers$Y20132014$JonesSawyerA,
    MullinA = calMembers$Y20132014$MullinA,
    MuratsuchiA = calMembers$Y20132014$MuratsuchiA,
    NazarianA = calMembers$Y20132014$NazarianA,
    RodriguezA = calMembers$Y20132014$RodriguezA,
    StoneA = calMembers$Y20132014$StoneA,
    TingA = calMembers$Y20132014$TingA,
    WeberA = calMembers$Y20132014$WeberA
)
aiBillData$Y20132014$AB1465$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBillData$Y20132014$AB1465$dateStart <- as.Date("2014-01-09")
aiBillData$Y20132014$AB1465$dateEnd <- as.Date("2014-11-30")
aiBillData$Y20132014$AB1465$dateUpdated <- Sys.Date()

# measures
aiBillData$Y20132014$AB1465$version <- "Amended Senate"
aiBillData$Y20132014$AB1465$outcome <- "Failed"
aiBillData$Y20132014$AB1465$chaptered <- FALSE
aiBillData$Y20132014$AB1465$chapterNo <- NA
aiBillData$Y20132014$AB1465$active <- FALSE
aiBillData$Y20132014$AB1465$result <- "Died"
aiBillData$Y20132014$AB1465$vote <- "Majority"
aiBillData$Y20132014$AB1465$appropriation <- TRUE
aiBillData$Y20132014$AB1465$fiscal <- TRUE
aiBillData$Y20132014$AB1465$local <- TRUE
aiBillData$Y20132014$AB1465$urgency <- TRUE
aiBillData$Y20132014$AB1465$tax <- FALSE
aiBillData$Y20132014$AB1465$action <- "Died on inactive file"
aiBillData$Y20132014$AB1465$pdf <- "20130AB146598AMD.pdf"

# AI properties assessed from the text in aiBillData$Y20132014$AB1465$text
aiBillData$Y20132014$AB1465$aiDisposition <- "Neutral"
aiBillData$Y20132014$AB1465$aiType <- "Education and Training"
aiBillData$Y20132014$AB1465$aiSector <- "Education"
aiBillData$Y20132014$AB1465$aiSubSector <- "Postsecondary Education"
aiBillData$Y20132014$AB1465$aiDomain <- "Education"
aiBillData$Y20132014$AB1465$aiAccountability <- "Moderate"
aiBillData$Y20132014$AB1465$aiImpact <- "Moderate"
aiBillData$Y20132014$AB1465$aiEthics <- "Low"
aiBillData$Y20132014$AB1465$aiInnovation <- "Moderate"
aiBillData$Y20132014$AB1465$aiPrivacy <- "Moderate"
aiBillData$Y20132014$AB1465$aiTransparency <- "Moderate"

## 2017-2018 ####
#~~~~~~~~~~~~~~~~

### ACR-215 ####

# open the url for the bill text in the default web browser
browseURL(aiBillData$Y20172018$ACR215$text)

# Topic from aiBillData$Y20172018$ACR215$status
aiBillData$Y20172018$ACR215$topic <- "ACR-215 23 Asilomar AI Principles"

# Title from aiBillData$Y20172018$ACR215$status
aiBillData$Y20172018$ACR215$title <- paste0(aiBillData$Y20172018$ACR215$title, "Relative to the 23 Asilomar AI Principles")

# tldr for aiBillData$Y20172018$ACR215$text
aiBillData$Y20172018$ACR215$tldr <- "ACR-215 recognizes the 23 Asilomar AI Principles, which are guidelines for the ethical development and use of artificial intelligence. These principles emphasize the importance of safety, transparency, accountability, and collaboration in AI research and applications. The resolution aims to promote responsible AI practices and ensure that AI technologies benefit humanity while minimizing risks."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBillData$Y20172018$ACR215$tags <- c("artificial-intelligence", "asilomar-ai-principles", "ethical-development", "guidelines", "safety", "transparency", "accountability", "collaboration", "responsible-ai-practices", "benefit-humanity")

# sponsors and cosponsors
aiBillData$Y20172018$ACR215$sponsors <- list(
    KileyA = calMembers$Y20172018$Kiley
)
aiBillData$Y20172018$ACR215$cosponsors <- list(
    AcostaA = calMembers$Y20172018$AcostaA,
    AguiarCurryA = calMembers$Y20172018$AguiarCurryA,
    ArambulaA = calMembers$Y20172018$ArambulaA,
    BakerA = calMembers$Y20172018$BakerA,
    BermanA = calMembers$Y20172018$BermanA,
    BigelowA = calMembers$Y20172018$BigelowA,
    BloomA = calMembers$Y20172018$BloomA,
    BontaA = calMembers$Y20172018$BontaA,
    BurkeA = calMembers$Y20172018$BurkeA,
    CaballeroA = calMembers$Y20172018$CaballeroA,
    CalderonA = calMembers$Y20172018$CalderonA,
    CarrilloA = calMembers$Y20172018$CarrilloA,
    ChauA = calMembers$Y20172018$ChauA,
    ChavezA = calMembers$Y20172018$ChavezA,
    ChenA = calMembers$Y20172018$ChenA,
    ChiuA = calMembers$Y20172018$ChiuA,
    ChuA = calMembers$Y20172018$ChuA,
    CooleyA = calMembers$Y20172018$CooleyA,
    CooperA = calMembers$Y20172018$CooperA,
    CunninghamA = calMembers$Y20172018$CunninghamA,
    DahleA = calMembers$Y20172018$DahleA,
    DalyA = calMembers$Y20172018$DalyA,
    EggmanA = calMembers$Y20172018$EggmanA,
    FloraA = calMembers$Y20172018$FloraA,
    FongA = calMembers$Y20172018$FongA,
    FrazierA = calMembers$Y20172018$FrazierA,
    FriedmanA = calMembers$Y20172018$FriedmanA,
    GabrielA = calMembers$Y20172018$GabrielA,
    GallagherA = calMembers$Y20172018$GallagherA,
    GarciaEA = calMembers$Y20172018$GarciaEA,
    GarciaCA = calMembers$Y20172018$GarciaCA,
    GipsonA = calMembers$Y20172018$GipsonA,
    GloriaA = calMembers$Y20172018$GloriaA,
    GrayA = calMembers$Y20172018$GrayA,
    GraysonA = calMembers$Y20172018$GraysonA,
    HarperA = calMembers$Y20172018$HarperA,
    HoldenA = calMembers$Y20172018$HoldenA,
    IrwinA = calMembers$Y20172018$IrwinA,
    JonesSawyerA = calMembers$Y20172018$JonesSawyerA,
    KalraA = calMembers$Y20172018$KalraA,
    LackeyA = calMembers$Y20172018$LackeyA,
    LevineA = calMembers$Y20172018$LevineA,
    LimonA = calMembers$Y20172018$LimonA,
    LowA = calMembers$Y20172018$LowA,
    MaienscheinA = calMembers$Y20172018$MaienscheinA,
    MathisA = calMembers$Y20172018$MathisA,
    MayesA = calMembers$Y20172018$MayesA,
    McCartyA = calMembers$Y20172018$McCartyA,
    MelendezA = calMembers$Y20172018$MelendezA,
    MullinA = calMembers$Y20172018$MullinA,
    MuratsuchiA = calMembers$Y20172018$MuratsuchiA,
    NazarianA = calMembers$Y20172018$NazarianA,
    ODonnellA = calMembers$Y20172018$ODonnellA,
    ObernolteA = calMembers$Y20172018$ObernolteA,
    PattersonA = calMembers$Y20172018$PattersonA,
    QuirkA = calMembers$Y20172018$QuirkA,
    QuirkSilvaA = calMembers$Y20172018$QuirkSilvaA,
    RendonA = calMembers$Y20172018$RendonA,
    ReyesA = calMembers$Y20172018$ReyesA,
    RivasA = calMembers$Y20172018$RivasA,
    RodriguezA = calMembers$Y20172018$RodriguezA,
    RubioA = calMembers$Y20172018$RubioA,
    SalasA = calMembers$Y20172018$SalasA,
    SantiagoA = calMembers$Y20172018$SantiagoA,
    SteinorthA = calMembers$Y20172018$SteinorthA,
    StoneMA = calMembers$Y20172018$StoneMA,
    ThurmondA = calMembers$Y20172018$ThurmondA,
    TingA = calMembers$Y20172018$TingA,
    VoepelA = calMembers$Y20172018$VoepelA,
    WaldronA = calMembers$Y20172018$WaldronA,
    WeberA = calMembers$Y20172018$WeberA,
    WoodA = calMembers$Y20172018$WoodA
)

# dateStart, dateEnd, and dateUpdated
aiBillData$Y20172018$ACR215$dateStart <- as.Date("2018-04-05")
aiBillData$Y20172018$ACR215$dateEnd <- as.Date("2018-09-07")
aiBillData$Y20172018$ACR215$dateUpdated <- Sys.Date()
aiBillData$Y20172018$ACR215$version <- "Chaptered"
aiBillData$Y20172018$ACR215$outcome <- "Chaptered"
aiBillData$Y20172018$ACR215$chaptered <- TRUE
aiBillData$Y20172018$ACR215$chapterNo <- 286
aiBillData$Y20172018$ACR215$active <- FALSE
aiBillData$Y20172018$ACR215$result <- "Chaptered"
aiBillData$Y20172018$ACR215$vote <- "No Vote"
aiBillData$Y20172018$ACR215$appropriation <- FALSE
aiBillData$Y20172018$ACR215$fiscal <- FALSE
aiBillData$Y20172018$ACR215$local <- FALSE
aiBillData$Y20172018$ACR215$urgency <- FALSE
aiBillData$Y20172018$ACR215$tax <- FALSE
aiBillData$Y20172018$ACR215$action <- "Chaptered by Secretary of State. Chapter 286, Statutes of 2018"
aiBillData$Y20172018$ACR215$pdf <- "20170ACR215_97.pdf"

# AI properties assessed from the text in aiBillData$Y20172018$ACR215$text
aiBillData$Y20172018$ACR215$aiDisposition <- "Supportive"
aiBillData$Y20172018$ACR215$aiType <- "Principles and Guidelines"
aiBillData$Y20172018$ACR215$aiSector <- "Governance"
aiBillData$Y20172018$ACR215$aiSubSector <- "Policy and Regulation"
aiBillData$Y20172018$ACR215$aiDomain <- "Ethics"
aiBillData$Y20172018$ACR215$aiAccountability <- "Moderate"
aiBillData$Y20172018$ACR215$aiImpact <- "Moderate"
aiBillData$Y20172018$ACR215$aiEthics <- "Moderate"
aiBillData$Y20172018$ACR215$aiInnovation <- "Low"
aiBillData$Y20172018$ACR215$aiPrivacy <- "Low"
aiBillData$Y20172018$ACR215$aiTransparency <- "Moderate"

### SB-1470 ####

# open the url for the bill text in the default web browser
browseURL(aiBillData$Y20172018$SB1470$text)

# Topic from aiBillData$Y20172018$SB1470$status
aiBillData$Y20172018$SB1470$topic <- "SB-1470 Commission on the Future of Work"

# Title from aiBillData$Y20172018$SB1470$status
aiBillData$Y20172018$SB1470$title <- paste0(aiBillData$Y20172018$SB1470$title, "An act to add Chapter 7.1 (commencing with Section 160) to Division 1 of the Labor Code, relating to employment development")

# tldr for aiBillData$Y20172018$SB1470$text
aiBillData$Y20172018$SB1470$tldr <- "SB-1470 establishes the Commission on the Future of Work to address the impact of technology, including artificial intelligence, on employment and the workforce. The commission will study and make recommendations on policies to ensure that workers are prepared for the changing job landscape and that the benefits of technological advancements are shared equitably. The bill aims to promote a fair and inclusive future of work in California."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBillData$Y20172018$SB1470$tags <- c("artificial-intelligence", "commission-on-the-future-of-work", "employment-development", "technology-impact", "workforce-preparation", "policy-recommendations", "equitable-benefits", "fair-and-inclusive-future")

# sponsors and cosponsors
aiBillData$Y20172018$SB1470$sponsors <- list(
    SternS = calMembers$Y20172018$SternS
)
aiBillData$Y20172018$SB1470$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBillData$Y20172018$SB1470$dateStart <- as.Date("2018-02-16")
aiBillData$Y20172018$SB1470$dateEnd <- as.Date("2018-11-30")
aiBillData$Y20172018$SB1470$dateUpdated <- Sys.Date()

# measures
aiBillData$Y20172018$SB1470$version <- "Amended Assembly"
aiBillData$Y20172018$SB1470$outcome <- "Failed"
aiBillData$Y20172018$SB1470$chaptered <- FALSE
aiBillData$Y20172018$SB1470$chapterNo <- NA
aiBillData$Y20172018$SB1470$active <- FALSE
aiBillData$Y20172018$SB1470$result <- "Died"
aiBillData$Y20172018$SB1470$vote <- "Majority"
aiBillData$Y20172018$SB1470$appropriation <- FALSE
aiBillData$Y20172018$SB1470$fiscal <- TRUE
aiBillData$Y20172018$SB1470$local <- FALSE
aiBillData$Y20172018$SB1470$urgency <- FALSE
aiBillData$Y20172018$SB1470$tax <- FALSE
aiBillData$Y20172018$SB1470$action <- "From Assembly without further action"
aiBillData$Y20172018$SB1470$pdf <- "20170SB1470_98.pdf"

# AI properties assessed from the text in aiBillData$Y20172018$SB1470$text
aiBillData$Y20172018$SB1470$aiDisposition <- "Neutral"
aiBillData$Y20172018$SB1470$aiType <- "General"
aiBillData$Y20172018$SB1470$aiSector <- "Governance"
aiBillData$Y20172018$SB1470$aiSubSector <- "Policy and Regulation"
aiBillData$Y20172018$SB1470$aiDomain <- "Ethics"
aiBillData$Y20172018$SB1470$aiAccountability <- "Moderate"
aiBillData$Y20172018$SB1470$aiImpact <- "Moderate"
aiBillData$Y20172018$SB1470$aiEthics <- "Moderate"
aiBillData$Y20172018$SB1470$aiInnovation <- "Low"
aiBillData$Y20172018$SB1470$aiPrivacy <- "Low"
aiBillData$Y20172018$SB1470$aiTransparency <- "Moderate"

### AB-2662 ####

# open the url for the bill text in the default web browser
browseURL(aiBillData$Y20172018$AB2662$text)

# Topic from aiBillData$Y20172018$AB2662$status
aiBillData$Y20172018$AB2662$topic <- "AB-2662 State government: Office of Planning and Research: electronic media: child development"

# Title from aiBillData$Y20172018$AB2662$status
aiBillData$Y20172018$AB2662$title <- paste0(aiBillData$Y20172018$AB2662$title, "AB-2662: An act to add Section 65040.16 to the Government Code, relating to state government, and making an appropriation therefor")

# tldr for aiBillData$Y20172018$AB2662$text
aiBillData$Y20172018$AB2662$tldr <- "AB-2662 establishes the Office of Planning and Research to develop and implement a comprehensive strategy for the use of electronic media in child development programs. The bill aims to enhance the effectiveness of child development initiatives through the integration of technology and digital resources. It emphasizes the importance of research, collaboration, and innovation in improving outcomes for children and families."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBillData$Y20172018$AB2662$tags <- c("artificial-intelligence", "state-government", "office-of-planning-and-research", "electronic-media", "child-development", "comprehensive-strategy", "technology-integration", "digital-resources", "research-and-collaboration", "innovation")

# sponsors and cosponsors
aiBillData$Y20172018$AB2662$sponsors <- list(
    ChauA = calMembers$Y20172018$ChauA
)
aiBillData$Y20172018$AB2662$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBillData$Y20172018$AB2662$dateStart <- as.Date("2018-02-15")
aiBillData$Y20172018$AB2662$dateEnd <- as.Date("2018-11-30")
aiBillData$Y20172018$AB2662$dateUpdated <- Sys.Date()

# measures
aiBillData$Y20172018$AB2662$version <- "Amended Assembly"
aiBillData$Y20172018$AB2662$outcome <- "Failed"
aiBillData$Y20172018$AB2662$chaptered <- FALSE
aiBillData$Y20172018$AB2662$chapterNo <- NA
aiBillData$Y20172018$AB2662$active <- FALSE
aiBillData$Y20172018$AB2662$result <- "Died"
aiBillData$Y20172018$AB2662$vote <- "Majority"
aiBillData$Y20172018$AB2662$appropriation <- TRUE
aiBillData$Y20172018$AB2662$fiscal <- TRUE
aiBillData$Y20172018$AB2662$local <- FALSE
aiBillData$Y20172018$AB2662$urgency <- FALSE
aiBillData$Y20172018$AB2662$tax <- FALSE
aiBillData$Y20172018$AB2662$action <- "From committee without further action"
aiBillData$Y20172018$AB2662$pdf <- "20170AB2662_97.pdf"

# AI properties assessed from the text in aiBillData$Y20172018$AB2662$text
aiBillData$Y20172018$AB2662$aiDisposition <- "Neutral"
aiBillData$Y20172018$AB2662$aiType <- "General"
aiBillData$Y20172018$AB2662$aiSector <- "Governance"
aiBillData$Y20172018$AB2662$aiSubSector <- "Policy and Regulation"
aiBillData$Y20172018$AB2662$aiDomain <- "Ethics"
aiBillData$Y20172018$AB2662$aiAccountability <- "Moderate"
aiBillData$Y20172018$AB2662$aiImpact <- "Moderate"
aiBillData$Y20172018$AB2662$aiEthics <- "Moderate"
aiBillData$Y20172018$AB2662$aiInnovation <- "Low"
aiBillData$Y20172018$AB2662$aiPrivacy <- "Low"
aiBillData$Y20172018$AB2662$aiTransparency <- "Moderate"

### AB-1809 ####

# open the url for the bill text in the default web browser
browseURL(aiBillData$Y20172018$AB1809$text)

# Topic from aiBillData$Y20172018$AB1809$status
aiBillData$Y20172018$AB1809$topic <- "AB-1809 Higher education trailer bill"

# Title from aiBillData$Y20172018$AB1809$status
aiBillData$Y20172018$AB1809$title <- paste0(aiBillData$Y20172018$AB1809$title, "AB-1809: An act to amend Sections 8152, 8154, 19104.5, 52523, 66021.1, 66027.8, 68075.6, 69432, 69433.6, 69435.3, 70023, 70900, 70901, 72506, 76004, 76300, 76350, 78401, 79149.3, 79149.5, 82542, 84040.5, 84750.5, 84751, 84810.5, 84900, 84901, 84906, 84913, 84916, 99151, 99152, 99153, 99154, and 99162 of, to amend the heading of Article 9 (commencing with Section 84900) of Chapter 5 of Part 50 of Division 7 of Title 3 of, to amend and repeal Sections 84750.6, 84750.7, and 88912.5 of, to add Sections 66749.6, 66749.7, 78222, 79148.1, 79149.7, 84750.4, and 84750.41 to, to add Article 10 (commencing with Section 54800) to Chapter 9 of Part 29 of Division 4 of Title 2 of, to add Part 46.5 (commencing with Section 75000), Part 52.7 (commencing with Section 88670), and Part 54.82 (commencing with Section 88930) to Division 7 of Title 3 of, to add Article 2.5 (commencing with Section 92010) to Chapter 1 of Part 57 of Division 9 of Title 3 of, to add and repeal Section 89290.5 of, to repeal Sections 88910, 88912, and 88913 of, and to repeal and add Section 79149.1 of, the Education Code, to add Sections 22874.7 and 22958.4 to, and to add Article 7 (commencing with Section 65059.1) to Chapter 1.5 of Division 1 of Title 7 of, the Government Code, to amend Section 33492.78 of the Health and Safety Code, to amend Section 95 of the Revenue and Taxation Code, to add Section 18928 to the Welfare and Institutions Code, and to amend the Budget Act of 2017 by amending Item 6870-101-0001 of Section 2.00 of that act, relating to education, and making an appropriation therefor, to take effect immediately, bill related to the budget")

# tldr for aiBillData$Y20172018$AB1809$text
aiBillData$Y20172018$AB1809$tldr <- "AB-1809 is a higher education trailer bill that makes various amendments to the Education Code and other related codes. It includes provisions related to funding, program implementation, and administrative processes in higher education. The bill aims to streamline operations, enhance educational opportunities, and ensure compliance with state regulations. It also addresses budget-related matters and appropriations for educational programs."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBillData$Y20172018$AB1809$tags <- c("artificial-intelligence", "higher-education-trailer-bill", "education-finance", "funding", "program-implementation", "administrative-processes", "streamlining-operations", "educational-opportunities", "state-regulations", "budget-related-matters")

# sponsors and cosponsors
aiBillData$Y20172018$AB1809$sponsors <- list(
    CommitteeOnBudgetA = calMembers$Y20172018$CommitteeOnBudgetA,
    TingA = calMembers$Y20172018$TingA,
    ArambulaA = calMembers$Y20172018$ArambulaA,
    BloomA = calMembers$Y20172018$BloomA,
    CaballeroA = calMembers$Y20172018$CaballeroA,
    ChiuA = calMembers$Y20172018$ChiuA,
    CooperA = calMembers$Y20172018$CooperA,
    JonesSawyerA = calMembers$Y20172018$JonesSawyerA,
    LimonA = calMembers$Y20172018$LimonA,
    McCartyA = calMembers$Y20172018$McCartyA,
    MedinaA = calMembers$Y20172018$MedinaA,
    MullinA = calMembers$Y20172018$MullinA,
    MuratsuchiA = calMembers$Y20172018$MuratsuchiA,
    ODonnellA = calMembers$Y20172018$ODonnellA,
    RubioA = calMembers$Y20172018$RubioA,
    StoneA = calMembers$Y20172018$StoneA,
    WeberA = calMembers$Y20172018$WeberA,
    WoodA = calMembers$Y20172018$WoodA
)
aiBillData$Y20172018$AB1809$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBillData$Y20172018$AB1809$dateStart <- as.Date("2018-01-10")
aiBillData$Y20172018$AB1809$dateEnd <- as.Date("2018-06-27")
aiBillData$Y20172018$AB1809$dateUpdated <- Sys.Date()

# measures
aiBillData$Y20172018$AB1809$version <- "Chaptered"
aiBillData$Y20172018$AB1809$outcome <- "Chaptered"
aiBillData$Y20172018$AB1809$chaptered <- TRUE
aiBillData$Y20172018$AB1809$chapterNo <- 33
aiBillData$Y20172018$AB1809$active <- FALSE
aiBillData$Y20172018$AB1809$result <- "Chaptered"
aiBillData$Y20172018$AB1809$vote <- "Majority"
aiBillData$Y20172018$AB1809$appropriation <- TRUE
aiBillData$Y20172018$AB1809$fiscal <- TRUE
aiBillData$Y20172018$AB1809$local <- TRUE
aiBillData$Y20172018$AB1809$urgency <- TRUE
aiBillData$Y20172018$AB1809$tax <- FALSE
aiBillData$Y20172018$AB1809$action <- "Chaptered by Secretary of State. Chapter 33, Statutes of 2018"
aiBillData$Y20172018$AB1809$pdf <- "20170AB1809_96.pdf"

# AI properties assessed from the text in aiBillData$Y20172018$AB1809$text
aiBillData$Y20172018$AB1809$aiDisposition <- "Neutral"
aiBillData$Y20172018$AB1809$aiType <- "Research and Development"
aiBillData$Y20172018$AB1809$aiSector <- "Education"
aiBillData$Y20172018$AB1809$aiSubSector <- "Postsecondary Education"
aiBillData$Y20172018$AB1809$aiDomain <- "Education"
aiBillData$Y20172018$AB1809$aiAccountability <- "Moderate"
aiBillData$Y20172018$AB1809$aiImpact <- "Moderate"
aiBillData$Y20172018$AB1809$aiEthics <- "Moderate"
aiBillData$Y20172018$AB1809$aiInnovation <- "Low"
aiBillData$Y20172018$AB1809$aiPrivacy <- "Low"
aiBillData$Y20172018$AB1809$aiTransparency <- "Low"

### SB-843 ####

# open the url for the bill text in the default web browser
browseURL(aiBillData$Y20172018$SB843$text)

# Topic from aiBillData$Y20172018$SB843$status
aiBillData$Y20172018$SB843$topic <- "SB-843 Higher education trailer bill"

# Title from aiBillData$Y20172018$SB843$status
aiBillData$Y20172018$SB843$title <- paste0(aiBillData$Y20172018$SB843$title, "An act to amend Sections 8152, 8154, 19104.5, 52523, 66021.1, 66027.8, 68075.6, 69432, 69433.6, 69435.3, 70023, 70900, 70901, 72506, 76004, 76300, 76350, 78401, 79149.3, 79149.5, 82542, 84040.5, 84750.5, 84751, 84810.5, 84900, 84901, 84906, 84913, 84916, 99151, 99152, 99153, 99154, and 99162 of, to amend the heading of Article 9 (commencing with Section 84900) of Chapter 5 of Part 50 of Division 7 of Title 3 of, to amend and repeal Sections 84750.6, 84750.7, and 88912.5 of, to add Sections 66749.6, 66749.7, 78222, 79148.1, 79149.7, 84750.4, and 84750.41 to, to add Article 10 (commencing with Section 54800) to Chapter 9 of Part 29 of Division 4 of Title 2 of, to add Part 46.5 (commencing with Section 75000), Part 52.7 (commencing with Section 88670), and Part 54.82 (commencing with Section 88930) to Division 7 of Title 3 of, to add Article 2.5 (commencing with Section 92010) to Chapter 1 of Part 57 of Division 9 of Title 3 of, to add and repeal Section 89290.5 of, to repeal Sections 88910, 88912, and 88913 of, and to repeal and add Section 79149.1 of, the Education Code, to add Sections 22874.7 and 22958.4 to, and to add Article 7 (commencing with Section 65059.1) to Chapter 1.5 of Division 1 of Title 7 of, the Government Code, to amend Section 33492.78 of the Health and Safety Code, to amend Section 95 of the Revenue and Taxation Code, to add Section 18928 to the Welfare and Institutions Code, and to amend the Budget Act of 2017 by amending Item 6870-101-0001 of Section 2.00 of that act, relating to education, and making an appropriation therefor, to take effect immediately, bill related to the budget")

# tldr for aiBillData$Y20172018$SB843$text
aiBillData$Y20172018$SB843$tldr <- "SB-843 is a higher education trailer bill that makes various amendments to the Education Code and other related codes. It includes provisions related to funding, program implementation, and administrative processes in higher education. The bill aims to streamline operations, enhance educational opportunities, and ensure compliance with state regulations. It also addresses budget-related matters and appropriations for educational programs."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBillData$Y20172018$SB843$tags <- c("artificial-intelligence", "higher-education-trailer-bill", "education-finance", "funding", "program-implementation", "administrative-processes", "streamlining-operations", "educational-opportunities", "state-regulations", "budget-related-matters")

# sponsors and cosponsors
aiBillData$Y20172018$SB843$sponsors <- list(
    CommitteeOnBudgetandFiscalReviewS = calMembers$Y20172018$CommitteeOnBudgetandFiscalReviewS
)
aiBillData$Y20172018$SB843$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBillData$Y20172018$SB843$dateStart <- as.Date("2018-01-10")
aiBillData$Y20172018$SB843$dateEnd <- as.Date("2018-11-30")
aiBillData$Y20172018$SB843$dateUpdated <- Sys.Date()

# measures
aiBillData$Y20172018$SB843$version <- "Amended Assembly"
aiBillData$Y20172018$SB843$outcome <- "Failed"
aiBillData$Y20172018$SB843$chaptered <- FALSE
aiBillData$Y20172018$SB843$chapterNo <- NA
aiBillData$Y20172018$SB843$active <- FALSE
aiBillData$Y20172018$SB843$result <- "Died"
aiBillData$Y20172018$SB843$vote <- "Majority"
aiBillData$Y20172018$SB843$appropriation <- TRUE
aiBillData$Y20172018$SB843$fiscal <- TRUE
aiBillData$Y20172018$SB843$local <- TRUE
aiBillData$Y20172018$SB843$urgency <- TRUE
aiBillData$Y20172018$SB843$tax <- FALSE
aiBillData$Y20172018$SB843$action <- "From Assembly without further action"
aiBillData$Y20172018$SB843$pdf <- "20170SB843_98.pdf"

# AI properties assessed from the text in aiBillData$Y20172018$SB843$text
aiBillData$Y20172018$SB843$aiDisposition <- "Neutral"
aiBillData$Y20172018$SB843$aiType <- "General"
aiBillData$Y20172018$SB843$aiSector <- "Education"
aiBillData$Y20172018$SB843$aiSubSector <- "Postsecondary Education"
aiBillData$Y20172018$SB843$aiDomain <- "Education"
aiBillData$Y20172018$SB843$aiAccountability <- "Moderate"
aiBillData$Y20172018$SB843$aiImpact <- "Moderate"
aiBillData$Y20172018$SB843$aiEthics <- "Moderate"
aiBillData$Y20172018$SB843$aiInnovation <- "Low"
aiBillData$Y20172018$SB843$aiPrivacy <- "Low"
aiBillData$Y20172018$SB843$aiTransparency <- "Moderate"

## 2019-2020 ####
#~~~~~~~~~~~~~~~~

### SB-348 ####

# open the url for the bill text in the default web browser
browseURL(aiBillData$Y20192020$SB348$text)

# Topic from aiBillData$Y20192020$SB348$status
aiBillData$Y20192020$SB348$topic <- "SB-348 Department of Technology: artificial intelligence: strategic plans"

# Title from aiBillData$Y20192020$SB348$status
aiBillData$Y20192020$SB348$title <- paste0(aiBillData$Y20192020$SB348$title, "An act to add Chapter 6 (commencing with Section 12897) to Part 2.5 of Division 3 of Title 2 of the Government Code, relating to state government")

# tldr for aiBillData$Y20192020$SB348$text
aiBillData$Y20192020$SB348$tldr <- "SB-348 requires the Department of Technology to develop and implement a strategic plan for the use of artificial intelligence in state government. The bill aims to ensure that AI technologies are used effectively, ethically, and transparently in public services. It emphasizes the importance of collaboration, accountability, and public engagement in the development and deployment of AI systems."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBillData$Y20192020$SB348$tags <- c("artificial-intelligence", "department-of-technology", "strategic-plans", "state-government", "effective-use", "ethical-use", "transparent-use", "public-services", "collaboration", "accountability")

# sponsors and cosponsors
aiBillData$Y20192020$SB348$sponsors <- list(
    ChangS = calMembers$Y20192020$ChangS
)
aiBillData$Y20192020$SB348$cosponsors <- list(
    KileyA = calMembers$Y20192020$KileyA
)

# dateStart, dateEnd, and dateUpdated
aiBillData$Y20192020$SB348$dateStart <- as.Date("2019-02-19")
aiBillData$Y20192020$SB348$dateEnd <- as.Date("2020-11-30")
aiBillData$Y20192020$SB348$dateUpdated <- Sys.Date()

# measures
aiBillData$Y20192020$SB348$version <- "Amended Assembly"
aiBillData$Y20192020$SB348$outcome <- "Failed"
aiBillData$Y20192020$SB348$chaptered <- FALSE
aiBillData$Y20192020$SB348$chapterNo <- NA
aiBillData$Y20192020$SB348$active <- FALSE
aiBillData$Y20192020$SB348$result <- "Died"
aiBillData$Y20192020$SB348$vote <- "Majority"
aiBillData$Y20192020$SB348$appropriation <- FALSE
aiBillData$Y20192020$SB348$fiscal <- TRUE
aiBillData$Y20192020$SB348$local <- FALSE
aiBillData$Y20192020$SB348$urgency <- FALSE
aiBillData$Y20192020$SB348$tax <- FALSE
aiBillData$Y20192020$SB348$action <- "From Assembly without further action"
aiBillData$Y20192020$SB348$pdf <- "20190SB348_97.pdf"

# AI properties assessed from the text in aiBillData$Y20192020$SB348$text
aiBillData$Y20192020$SB348$aiDisposition <- "Supportive"
aiBillData$Y20192020$SB348$aiType <- "General"
aiBillData$Y20192020$SB348$aiSector <- "Governance"
aiBillData$Y20192020$SB348$aiSubSector <- "Policy and Regulation"
aiBillData$Y20192020$SB348$aiDomain <- "Ethics"
aiBillData$Y20192020$SB348$aiAccountability <- "Moderate"
aiBillData$Y20192020$SB348$aiImpact <- "Moderate"
aiBillData$Y20192020$SB348$aiEthics <- "Moderate"
aiBillData$Y20192020$SB348$aiInnovation <- "Low"
aiBillData$Y20192020$SB348$aiPrivacy <- "Low"
aiBillData$Y20192020$SB348$aiTransparency <- "Moderate"

### SJR-6 ####

# open the url for the bill text in the default web browser
browseURL(aiBillData$Y20192020$SJR6$text)

# Topic from aiBillData$Y20192020$SJR6$status
aiBillData$Y20192020$SJR6$topic <- "SJR-6 Artificial intelligence"

# Title from aiBillData$Y20192020$SJR6$status
aiBillData$Y20192020$SJR6$title <- paste0(aiBillData$Y20192020$SJR6$title, "Relative to artificial intelligence")

# tldr for aiBillData$Y20192020$SJR6$text
aiBillData$Y20192020$SJR6$tldr <- "SJR-6 is a resolution that urges the federal government to establish a national strategy for the development and regulation of artificial intelligence. The resolution emphasizes the importance of ethical considerations, transparency, and accountability in AI technologies. It calls for collaboration between government, industry, and academia to ensure that AI is developed in a manner that benefits society as a whole."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBillData$Y20192020$SJR6$tags <- c("artificial-intelligence", "federal-government", "national-strategy", "development", "regulation", "ethical-considerations", "transparency", "accountability", "collaboration", "benefits-to-society")

# sponsors and cosponsors
aiBillData$Y20192020$SJR6$sponsors <- list(
    ChangS = calMembers$Y20192020$ChangS
)
aiBillData$Y20192020$SJR6$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBillData$Y20192020$SJR6$dateStart <- as.Date("2019-03-11")
aiBillData$Y20192020$SJR6$dateEnd <- as.Date("2020-07-09")
aiBillData$Y20192020$SJR6$dateUpdated <- Sys.Date()

# measures
aiBillData$Y20192020$SJR6$version <- "Chaptered"
aiBillData$Y20192020$SJR6$outcome <- "Chaptered"
aiBillData$Y20192020$SJR6$chaptered <- TRUE
aiBillData$Y20192020$SJR6$chapterNo <- 112
aiBillData$Y20192020$SJR6$active <- FALSE
aiBillData$Y20192020$SJR6$result <- "Chaptered"
aiBillData$Y20192020$SJR6$vote <- "No Vote"
aiBillData$Y20192020$SJR6$appropriation <- FALSE
aiBillData$Y20192020$SJR6$fiscal <- FALSE
aiBillData$Y20192020$SJR6$local <- FALSE
aiBillData$Y20192020$SJR6$urgency <- FALSE
aiBillData$Y20192020$SJR6$tax <- FALSE
aiBillData$Y20192020$SJR6$action <- "Chaptered by Secretary of State. Chapter 112, Statutes of 2019"
aiBillData$Y20192020$SJR6$pdf <- "20190SJR6_97.pdf"

# AI properties assessed from the text in aiBillData$Y20192020$SJR6$text
aiBillData$Y20192020$SJR6$aiDisposition <- "Supportive"
aiBillData$Y20192020$SJR6$aiType <- "General"
aiBillData$Y20192020$SJR6$aiSector <- "Governance"
aiBillData$Y20192020$SJR6$aiSubSector <- "Policy and Regulation"
aiBillData$Y20192020$SJR6$aiDomain <- "Ethics"
aiBillData$Y20192020$SJR6$aiAccountability <- "Moderate"
aiBillData$Y20192020$SJR6$aiImpact <- "Moderate"
aiBillData$Y20192020$SJR6$aiEthics <- "Moderate"
aiBillData$Y20192020$SJR6$aiInnovation <- "Low"
aiBillData$Y20192020$SJR6$aiPrivacy <- "Low"
aiBillData$Y20192020$SJR6$aiTransparency <- "Moderate"

### AB-459 ####

# open the url for the bill text in the default web browser
browseURL(aiBillData$Y20192020$AB459$text)

# Topic from aiBillData$Y20192020$AB459$status
aiBillData$Y20192020$AB459$topic <- "AB-459 State government: Artificial Intelligence in State Government Services Commission: report"

# Title from aiBillData$Y20192020$AB459$status
aiBillData$Y20192020$AB459$title <- paste0(aiBillData$Y20192020$AB459$title, "State government: Artificial Intelligence in State Government Services Commission: report")

# tldr for aiBillData$Y20192020$AB459$text
aiBillData$Y20192020$AB459$tldr <- "AB-459 establishes the Artificial Intelligence in State Government Services Commission to study and report on the use of artificial intelligence in state government services. The commission will assess the impact of AI technologies on public services, including their benefits, risks, and ethical considerations. The bill aims to ensure that AI is used effectively and responsibly in state government operations."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBillData$Y20192020$AB459$tags <- c("artificial-intelligence", "state-government", "state-government-services", "commission", "report", "public-services", "impact-assessment", "benefits-and-risks", "ethical-considerations", "responsible-use")

# sponsors and cosponsors
aiBillData$Y20192020$AB459$sponsors <- list(
    KileyA = calMembers$Y20192020$KileyA
)
aiBillData$Y20192020$AB459$cosponsors <- list(
    ChangS = calMembers$Y20192020$ChangS
)

# dateStart, dateEnd, and dateUpdated
aiBillData$Y20192020$AB459$dateStart <- as.Date("2019-02-11")
aiBillData$Y20192020$AB459$dateEnd <- as.Date("2020-02-03")
aiBillData$Y20192020$AB459$dateUpdated <- Sys.Date()

# measures
aiBillData$Y20192020$AB459$version <- "Amended Assembly"
aiBillData$Y20192020$AB459$outcome <- "Failed"
aiBillData$Y20192020$AB459$chaptered <- FALSE
aiBillData$Y20192020$AB459$chapterNo <- NA
aiBillData$Y20192020$AB459$active <- FALSE
aiBillData$Y20192020$AB459$result <- "Died"
aiBillData$Y20192020$AB459$vote <- "Majority"
aiBillData$Y20192020$AB459$appropriation <- FALSE
aiBillData$Y20192020$AB459$fiscal <- TRUE
aiBillData$Y20192020$AB459$local <- FALSE
aiBillData$Y20192020$AB459$urgency <- FALSE
aiBillData$Y20192020$AB459$tax <- FALSE
aiBillData$Y20192020$AB459$action <- "From committee: Filed with the Chief Clerk pursuant to Joint Rule 56"
aiBillData$Y20192020$AB459$pdf <- "20190AB459_97.pdf"

# AI properties assessed from the text in aiBillData$Y20192020$AB459$text
aiBillData$Y20192020$AB459$aiDisposition <- "Supportive"
aiBillData$Y20192020$AB459$aiType <- "General"
aiBillData$Y20192020$AB459$aiSector <- "Governance"
aiBillData$Y20192020$AB459$aiSubSector <- "Policy and Regulation"
aiBillData$Y20192020$AB459$aiDomain <- "Ethics"
aiBillData$Y20192020$AB459$aiAccountability <- "Moderate"
aiBillData$Y20192020$AB459$aiImpact <- "Moderate"
aiBillData$Y20192020$AB459$aiEthics <- "Moderate"
aiBillData$Y20192020$AB459$aiInnovation <- "Low"
aiBillData$Y20192020$AB459$aiPrivacy <- "Low"
aiBillData$Y20192020$AB459$aiTransparency <- "Moderate"

### AB-1576 ####

# open the url for the bill text in the default web browser
browseURL(aiBillData$Y20192020$AB1576$text)

# Topic from aiBillData$Y20192020$AB1576$status
aiBillData$Y20192020$AB1576$topic <- "AB-1576 Secretary of Government Operations: working group: technology"

# Title from aiBillData$Y20192020$AB1576$status
aiBillData$Y20192020$AB1576$title <- paste0(aiBillData$Y20192020$AB1576$title, "An act to add and repeal Section 11547.5 of the Government Code, relating to technology")

# tldr for aiBillData$Y20192020$AB1576$text
aiBillData$Y20192020$AB1576$tldr <- "AB-1576 establishes a working group within the Office of the Secretary of Government Operations to assess and recommend best practices for the use of technology in state government. The working group will focus on improving efficiency, transparency, and accountability in government operations through the effective use of technology. The bill aims to enhance public services and ensure that technology is used responsibly and ethically."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBillData$Y20192020$AB1576$tags <- c("artificial-intelligence", "state-government", "technology", "working-group", "efficiency", "transparency", "accountability", "public-services", "responsible-use", "ethical-use")

# sponsors and cosponsors
aiBillData$Y20192020$AB1576$sponsors <- list(
    CalderonA = calMembers$Y20192020$CalderonA
)
aiBillData$Y20192020$AB1576$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBillData$Y20192020$AB1576$dateStart <- as.Date("2019-02-22")
aiBillData$Y20192020$AB1576$dateEnd <- as.Date("2020-11-30")
aiBillData$Y20192020$AB1576$dateUpdated <- Sys.Date()

# measures
aiBillData$Y20192020$AB1576$version <- "Amended Senate"
aiBillData$Y20192020$AB1576$outcome <- "Failed"
aiBillData$Y20192020$AB1576$chaptered <- FALSE
aiBillData$Y20192020$AB1576$chapterNo <- NA
aiBillData$Y20192020$AB1576$active <- FALSE
aiBillData$Y20192020$AB1576$result <- "Died"
aiBillData$Y20192020$AB1576$vote <- "Majority"
aiBillData$Y20192020$AB1576$appropriation <- FALSE
aiBillData$Y20192020$AB1576$fiscal <- TRUE
aiBillData$Y20192020$AB1576$local <- FALSE
aiBillData$Y20192020$AB1576$urgency <- FALSE
aiBillData$Y20192020$AB1576$tax <- FALSE
aiBillData$Y20192020$AB1576$action <- "From Senate committee without further action"
aiBillData$Y20192020$AB1576$pdf <- "20190AB1576_95.pdf"

# AI properties assessed from the text in aiBillData$Y20192020$AB1576$text
aiBillData$Y20192020$AB1576$aiDisposition <- "Supportive"
aiBillData$Y20192020$AB1576$aiType <- "General"
aiBillData$Y20192020$AB1576$aiSector <- "Governance"
aiBillData$Y20192020$AB1576$aiSubSector <- "Policy and Regulation"
aiBillData$Y20192020$AB1576$aiDomain <- "Ethics"
aiBillData$Y20192020$AB1576$aiAccountability <- "Moderate"
aiBillData$Y20192020$AB1576$aiImpact <- "Moderate"
aiBillData$Y20192020$AB1576$aiEthics <- "Moderate"
aiBillData$Y20192020$AB1576$aiInnovation <- "Low"
aiBillData$Y20192020$AB1576$aiPrivacy <- "Low"
aiBillData$Y20192020$AB1576$aiTransparency <- "Moderate"

### AB-976 ####

# open the url for the bill text in the default web browser
browseURL(aiBillData$Y20192020$AB976$text)

# Topic from aiBillData$Y20192020$AB976$status
aiBillData$Y20192020$AB976$topic <- "AB-976 Artificial Intelligence in State Government Services Commission"

# Title from aiBillData$Y20192020$AB976$status
aiBillData$Y20192020$AB976$title <- paste0(aiBillData$Y20192020$AB976$title, "An act to add and repeal Chapter 8.3 (commencing with Section 11820.10) to of Part 1 of Division 3 of Title 2 of the Government Code, relating to state government")

# tldr for aiBillData$Y20192020$AB976$text
aiBillData$Y20192020$AB976$tldr <- "AB-976 establishes the Artificial Intelligence in State Government Services Commission to study and report on the use of artificial intelligence in state government services. The commission will assess the impact of AI technologies on public services, including their benefits, risks, and ethical considerations. The bill aims to ensure that AI is used effectively and responsibly in state government operations."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBillData$Y20192020$AB976$tags <- c("artificial-intelligence", "state-government", "state-government-services", "commission", "report", "public-services", "impact-assessment", "benefits-and-risks", "ethical-considerations", "responsible-use")

# sponsors and cosponsors
aiBillData$Y20192020$AB976$sponsors <- list(
    ChauA = calMembers$Y20192020$ChauA,
    KileyA = calMembers$Y20192020$KileyA,
    ObernolteA = calMembers$Y20192020$ObernolteA,
    SalasA = calMembers$Y20192020$SalasA
)
aiBillData$Y20192020$AB976$cosponsors <- list(
    CalderonA = calMembers$Y20192020$CalderonA
)

# dateStart, dateEnd, and dateUpdated
aiBillData$Y20192020$AB976$dateStart <- as.Date("2019-02-21")
aiBillData$Y20192020$AB976$dateEnd <- as.Date("2020-11-30")
aiBillData$Y20192020$AB976$dateUpdated <- Sys.Date()

# measures
aiBillData$Y20192020$AB976$version <- "Amended Senate"
aiBillData$Y20192020$AB976$outcome <- "Failed"
aiBillData$Y20192020$AB976$chaptered <- FALSE
aiBillData$Y20192020$AB976$chapterNo <- NA
aiBillData$Y20192020$AB976$active <- FALSE
aiBillData$Y20192020$AB976$result <- "Died"
aiBillData$Y20192020$AB976$vote <- "Majority"
aiBillData$Y20192020$AB976$appropriation <- FALSE
aiBillData$Y20192020$AB976$fiscal <- TRUE
aiBillData$Y20192020$AB976$local <- FALSE
aiBillData$Y20192020$AB976$urgency <- FALSE
aiBillData$Y20192020$AB976$tax <- FALSE
aiBillData$Y20192020$AB976$action <- "From Senate committee without further action"
aiBillData$Y20192020$AB976$pdf <- "20190AB976_98.pdf"

# AI properties assessed from the text in aiBillData$Y20192020$AB976$text
aiBillData$Y20192020$AB976$aiDisposition <- "Supportive"
aiBillData$Y20192020$AB976$aiType <- "General"
aiBillData$Y20192020$AB976$aiSector <- "Governance"
aiBillData$Y20192020$AB976$aiSubSector <- "Policy and Regulation"
aiBillData$Y20192020$AB976$aiDomain <- "Ethics"
aiBillData$Y20192020$AB976$aiAccountability <- "Moderate"
aiBillData$Y20192020$AB976$aiImpact <- "Moderate"
aiBillData$Y20192020$AB976$aiEthics <- "Moderate"
aiBillData$Y20192020$AB976$aiInnovation <- "Low"
aiBillData$Y20192020$AB976$aiPrivacy <- "Low"
aiBillData$Y20192020$AB976$aiTransparency <- "Moderate"

