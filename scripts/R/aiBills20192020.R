#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# AI POLICY ANALYSIS PROJECT
# Add AI Bills Data for 2019-2020
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
billList <- c("SB-348", "SJR-6", "AB-459", "AB-1576", "AB-976", "AB-594", "SB-444", "SB-730", "AB-156", "AB-3317", "SCR-13", "ACR-125", "SB-752", "AB-2269", "AB-3339", "AB-485")

# Define the list to store the AI bills data for 2019-2020
aiBills20192020 <- list()

# Loop through each year in the AI Bill List and create a template for each bill
for (bill in billList) {
    id <- gsub("-", "", bill)
    # Call the function to add the bill structure
    aiBills20192020[[id]] <- addBillStructure(2019, bill)
}

# Remove unnecessary variables
rm(bill, id)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 4. Populate AI Bill Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### SB-348 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20192020$SB348$text)

# Topic from aiBills20192020$SB348$status
aiBills20192020$SB348$topic <- "SB-348 Department of Technology: artificial intelligence: strategic plans"

# Title from aiBills20192020$SB348$status
aiBills20192020$SB348$title <- paste0(aiBills20192020$SB348$title, "An act to add Chapter 6 (commencing with Section 12897) to Part 2.5 of Division 3 of Title 2 of the Government Code, relating to state government")

# tldr for aiBills20192020$SB348$text
aiBills20192020$SB348$tldr <- "SB-348 requires the Department of Technology to develop and implement a strategic plan for the use of artificial intelligence in state government. The bill aims to ensure that AI technologies are used effectively, ethically, and transparently in public services. It emphasizes the importance of collaboration, accountability, and public engagement in the development and deployment of AI systems."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20192020$SB348$tags <- c("artificial-intelligence", "department-of-technology", "strategic-plans", "state-government", "effective-use", "ethical-use", "transparent-use", "public-services", "collaboration", "accountability")

# sponsors and cosponsors
aiBills20192020$SB348$sponsors <- addSponsors("Y20192020", c("ChangS"))
aiBills20192020$SB348$cosponsors <- addSponsors("Y20192020", c("KileyA"))

# dateStart, dateEnd, and dateUpdated
aiBills20192020$SB348$dateStart <- as.Date("2019-02-19")
aiBills20192020$SB348$dateEnd <- as.Date("2020-11-30")
aiBills20192020$SB348$dateUpdated <- Sys.Date()

# measures
aiBills20192020$SB348$version <- "Amended Assembly"
aiBills20192020$SB348$outcome <- "Failed"
aiBills20192020$SB348$chaptered <- FALSE
aiBills20192020$SB348$chapterNo <- NA
aiBills20192020$SB348$active <- FALSE
aiBills20192020$SB348$result <- "Died"
aiBills20192020$SB348$vote <- "Majority"
aiBills20192020$SB348$appropriation <- FALSE
aiBills20192020$SB348$fiscal <- TRUE
aiBills20192020$SB348$local <- FALSE
aiBills20192020$SB348$urgency <- FALSE
aiBills20192020$SB348$tax <- FALSE
aiBills20192020$SB348$action <- "From Assembly without further action"
aiBills20192020$SB348$pdf <- "20190SB348_97.pdf"

# AI properties assessed from the text in aiBills20192020$SB348$text
aiBills20192020$SB348$aiDisposition <- "Supportive"
aiBills20192020$SB348$aiType <- "General"
aiBills20192020$SB348$aiSector <- "Governance"
aiBills20192020$SB348$aiSubSector <- "Policy and Regulation"
aiBills20192020$SB348$aiDomain <- "Ethics"
aiBills20192020$SB348$aiAccountability <- "Moderate"
aiBills20192020$SB348$aiImpact <- "Moderate"
aiBills20192020$SB348$aiEthics <- "Moderate"
aiBills20192020$SB348$aiInnovation <- "Low"
aiBills20192020$SB348$aiPrivacy <- "Low"
aiBills20192020$SB348$aiTransparency <- "Moderate"

### SJR-6 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20192020$SJR6$text)

# Topic from aiBills20192020$SJR6$status
aiBills20192020$SJR6$topic <- "SJR-6 Artificial intelligence"

# Title from aiBills20192020$SJR6$status
aiBills20192020$SJR6$title <- paste0(aiBills20192020$SJR6$title, "Relative to artificial intelligence")

# tldr for aiBills20192020$SJR6$text
aiBills20192020$SJR6$tldr <- "SJR-6 is a resolution that urges the federal government to establish a national strategy for the development and regulation of artificial intelligence. The resolution emphasizes the importance of ethical considerations, transparency, and accountability in AI technologies. It calls for collaboration between government, industry, and academia to ensure that AI is developed in a manner that benefits society as a whole."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20192020$SJR6$tags <- c("artificial-intelligence", "federal-government", "national-strategy", "development", "regulation", "ethical-considerations", "transparency", "accountability", "collaboration", "benefits-to-society")

# sponsors and cosponsors
aiBills20192020$SJR6$sponsors <- addSponsors("Y20192020", c("ChangS"))
aiBills20192020$SJR6$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20192020$SJR6$dateStart <- as.Date("2019-03-11")
aiBills20192020$SJR6$dateEnd <- as.Date("2020-07-09")
aiBills20192020$SJR6$dateUpdated <- Sys.Date()

# measures
aiBills20192020$SJR6$version <- "Chaptered"
aiBills20192020$SJR6$outcome <- "Chaptered"
aiBills20192020$SJR6$chaptered <- TRUE
aiBills20192020$SJR6$chapterNo <- 112
aiBills20192020$SJR6$active <- FALSE
aiBills20192020$SJR6$result <- "Chaptered"
aiBills20192020$SJR6$vote <- "No Vote"
aiBills20192020$SJR6$appropriation <- FALSE
aiBills20192020$SJR6$fiscal <- FALSE
aiBills20192020$SJR6$local <- FALSE
aiBills20192020$SJR6$urgency <- FALSE
aiBills20192020$SJR6$tax <- FALSE
aiBills20192020$SJR6$action <- "Chaptered by Secretary of State. Chapter 112, Statutes of 2019"
aiBills20192020$SJR6$pdf <- "20190SJR6_97.pdf"

# AI properties assessed from the text in aiBills20192020$SJR6$text
aiBills20192020$SJR6$aiDisposition <- "Supportive"
aiBills20192020$SJR6$aiType <- "General"
aiBills20192020$SJR6$aiSector <- "Governance"
aiBills20192020$SJR6$aiSubSector <- "Policy and Regulation"
aiBills20192020$SJR6$aiDomain <- "Ethics"
aiBills20192020$SJR6$aiAccountability <- "Moderate"
aiBills20192020$SJR6$aiImpact <- "Moderate"
aiBills20192020$SJR6$aiEthics <- "Moderate"
aiBills20192020$SJR6$aiInnovation <- "Low"
aiBills20192020$SJR6$aiPrivacy <- "Low"
aiBills20192020$SJR6$aiTransparency <- "Moderate"

### AB-459 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20192020$AB459$text)

# Topic from aiBills20192020$AB459$status
aiBills20192020$AB459$topic <- "AB-459 State government: Artificial Intelligence in State Government Services Commission: report"

# Title from aiBills20192020$AB459$status
aiBills20192020$AB459$title <- paste0(aiBills20192020$AB459$title, "State government: Artificial Intelligence in State Government Services Commission: report")

# tldr for aiBills20192020$AB459$text
aiBills20192020$AB459$tldr <- "AB-459 establishes the Artificial Intelligence in State Government Services Commission to study and report on the use of artificial intelligence in state government services. The commission will assess the impact of AI technologies on public services, including their benefits, risks, and ethical considerations. The bill aims to ensure that AI is used effectively and responsibly in state government operations."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20192020$AB459$tags <- c("artificial-intelligence", "state-government", "state-government-services", "commission", "report", "public-services", "impact-assessment", "benefits-and-risks", "ethical-considerations", "responsible-use")

# sponsors and cosponsors
aiBills20192020$AB459$sponsors <- addSponsors("Y20192020", c("KileyA"))
aiBills20192020$AB459$cosponsors <- addSponsors("Y20192020", c("ChangS"))

# dateStart, dateEnd, and dateUpdated
aiBills20192020$AB459$dateStart <- as.Date("2019-02-11")
aiBills20192020$AB459$dateEnd <- as.Date("2020-02-03")
aiBills20192020$AB459$dateUpdated <- Sys.Date()

# measures
aiBills20192020$AB459$version <- "Amended Assembly"
aiBills20192020$AB459$outcome <- "Failed"
aiBills20192020$AB459$chaptered <- FALSE
aiBills20192020$AB459$chapterNo <- NA
aiBills20192020$AB459$active <- FALSE
aiBills20192020$AB459$result <- "Died"
aiBills20192020$AB459$vote <- "Majority"
aiBills20192020$AB459$appropriation <- FALSE
aiBills20192020$AB459$fiscal <- TRUE
aiBills20192020$AB459$local <- FALSE
aiBills20192020$AB459$urgency <- FALSE
aiBills20192020$AB459$tax <- FALSE
aiBills20192020$AB459$action <- "From committee: Filed with the Chief Clerk pursuant to Joint Rule 56"
aiBills20192020$AB459$pdf <- "20190AB459_97.pdf"

# AI properties assessed from the text in aiBills20192020$AB459$text
aiBills20192020$AB459$aiDisposition <- "Supportive"
aiBills20192020$AB459$aiType <- "General"
aiBills20192020$AB459$aiSector <- "Governance"
aiBills20192020$AB459$aiSubSector <- "Policy and Regulation"
aiBills20192020$AB459$aiDomain <- "Ethics"
aiBills20192020$AB459$aiAccountability <- "Moderate"
aiBills20192020$AB459$aiImpact <- "Moderate"
aiBills20192020$AB459$aiEthics <- "Moderate"
aiBills20192020$AB459$aiInnovation <- "Low"
aiBills20192020$AB459$aiPrivacy <- "Low"
aiBills20192020$AB459$aiTransparency <- "Moderate"

### AB-1576 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20192020$AB1576$text)

# Topic from aiBills20192020$AB1576$status
aiBills20192020$AB1576$topic <- "AB-1576 Secretary of Government Operations: working group: technology"

# Title from aiBills20192020$AB1576$status
aiBills20192020$AB1576$title <- paste0(aiBills20192020$AB1576$title, "An act to add and repeal Section 11547.5 of the Government Code, relating to technology")

# tldr for aiBills20192020$AB1576$text
aiBills20192020$AB1576$tldr <- "AB-1576 establishes a working group within the Office of the Secretary of Government Operations to assess and recommend best practices for the use of technology in state government. The working group will focus on improving efficiency, transparency, and accountability in government operations through the effective use of technology. The bill aims to enhance public services and ensure that technology is used responsibly and ethically."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20192020$AB1576$tags <- c("artificial-intelligence", "state-government", "technology", "working-group", "efficiency", "transparency", "accountability", "public-services", "responsible-use", "ethical-use")

# sponsors and cosponsors
aiBills20192020$AB1576$sponsors <- addSponsors("Y20192020", c("CalderonA"))
aiBills20192020$AB1576$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20192020$AB1576$dateStart <- as.Date("2019-02-22")
aiBills20192020$AB1576$dateEnd <- as.Date("2020-11-30")
aiBills20192020$AB1576$dateUpdated <- Sys.Date()

# measures
aiBills20192020$AB1576$version <- "Amended Senate"
aiBills20192020$AB1576$outcome <- "Failed"
aiBills20192020$AB1576$chaptered <- FALSE
aiBills20192020$AB1576$chapterNo <- NA
aiBills20192020$AB1576$active <- FALSE
aiBills20192020$AB1576$result <- "Died"
aiBills20192020$AB1576$vote <- "Majority"
aiBills20192020$AB1576$appropriation <- FALSE
aiBills20192020$AB1576$fiscal <- TRUE
aiBills20192020$AB1576$local <- FALSE
aiBills20192020$AB1576$urgency <- FALSE
aiBills20192020$AB1576$tax <- FALSE
aiBills20192020$AB1576$action <- "From Senate committee without further action"
aiBills20192020$AB1576$pdf <- "20190AB1576_95.pdf"

# AI properties assessed from the text in aiBills20192020$AB1576$text
aiBills20192020$AB1576$aiDisposition <- "Supportive"
aiBills20192020$AB1576$aiType <- "General"
aiBills20192020$AB1576$aiSector <- "Governance"
aiBills20192020$AB1576$aiSubSector <- "Policy and Regulation"
aiBills20192020$AB1576$aiDomain <- "Ethics"
aiBills20192020$AB1576$aiAccountability <- "Moderate"
aiBills20192020$AB1576$aiImpact <- "Moderate"
aiBills20192020$AB1576$aiEthics <- "Moderate"
aiBills20192020$AB1576$aiInnovation <- "Low"
aiBills20192020$AB1576$aiPrivacy <- "Low"
aiBills20192020$AB1576$aiTransparency <- "Moderate"

### AB-976 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20192020$AB976$text)

# Topic from aiBills20192020$AB976$status
aiBills20192020$AB976$topic <- "AB-976 Artificial Intelligence in State Government Services Commission"

# Title from aiBills20192020$AB976$status
aiBills20192020$AB976$title <- paste0(aiBills20192020$AB976$title, "An act to add and repeal Chapter 8.3 (commencing with Section 11820.10) to of Part 1 of Division 3 of Title 2 of the Government Code, relating to state government")

# tldr for aiBills20192020$AB976$text
aiBills20192020$AB976$tldr <- "AB-976 establishes the Artificial Intelligence in State Government Services Commission to study and report on the use of artificial intelligence in state government services. The commission will assess the impact of AI technologies on public services, including their benefits, risks, and ethical considerations. The bill aims to ensure that AI is used effectively and responsibly in state government operations."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20192020$AB976$tags <- c("artificial-intelligence", "state-government", "state-government-services", "commission", "report", "public-services", "impact-assessment", "benefits-and-risks", "ethical-considerations", "responsible-use")

# sponsors and cosponsors
aiBills20192020$AB976$sponsors <- addSponsors("Y20192020", c("ChauA", "KileyA", "ObernolteA", "SalasA"))
aiBills20192020$AB976$cosponsors <- addSponsors("Y20192020", c("CalderonA"))

# dateStart, dateEnd, and dateUpdated
aiBills20192020$AB976$dateStart <- as.Date("2019-02-21")
aiBills20192020$AB976$dateEnd <- as.Date("2020-11-30")
aiBills20192020$AB976$dateUpdated <- Sys.Date()

# measures
aiBills20192020$AB976$version <- "Amended Senate"
aiBills20192020$AB976$outcome <- "Failed"
aiBills20192020$AB976$chaptered <- FALSE
aiBills20192020$AB976$chapterNo <- NA
aiBills20192020$AB976$active <- FALSE
aiBills20192020$AB976$result <- "Died"
aiBills20192020$AB976$vote <- "Majority"
aiBills20192020$AB976$appropriation <- FALSE
aiBills20192020$AB976$fiscal <- TRUE
aiBills20192020$AB976$local <- FALSE
aiBills20192020$AB976$urgency <- FALSE
aiBills20192020$AB976$tax <- FALSE
aiBills20192020$AB976$action <- "From Senate committee without further action"
aiBills20192020$AB976$pdf <- "20190AB976_98.pdf"

# AI properties assessed from the text in aiBills20192020$AB976$text
aiBills20192020$AB976$aiDisposition <- "Supportive"
aiBills20192020$AB976$aiType <- "General"
aiBills20192020$AB976$aiSector <- "Governance"
aiBills20192020$AB976$aiSubSector <- "Policy and Regulation"
aiBills20192020$AB976$aiDomain <- "Ethics"
aiBills20192020$AB976$aiAccountability <- "Moderate"
aiBills20192020$AB976$aiImpact <- "Moderate"
aiBills20192020$AB976$aiEthics <- "Moderate"
aiBills20192020$AB976$aiInnovation <- "Low"
aiBills20192020$AB976$aiPrivacy <- "Low"
aiBills20192020$AB976$aiTransparency <- "Moderate"

### AB-594 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20192020$AB594$text)

# Topic from aiBills20192020$AB594$status
aiBills20192020$AB594$topic <- "AB-594 Artificial intelligence"

# Title from aiBills20192020$AB594$status
aiBills20192020$AB594$title <- paste0(aiBills20192020$AB594$title, "An act to add Section 11546.11 to the Government Code, relating to artificial intelligence")

# tldr for aiBills20192020$AB594$text
aiBills20192020$AB594$tldr <- "AB-594 establishes a framework for the responsible use of artificial intelligence in state government. The bill requires state agencies to develop guidelines for the ethical and transparent use of AI technologies. It emphasizes the importance of accountability, privacy, and public engagement in the deployment of AI systems in government operations."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20192020$AB594$tags <- c("artificial-intelligence", "state-government", "responsible-use", "framework", "ethical-use", "transparent-use", "accountability", "privacy", "public-engagement")

# sponsors and cosponsors
aiBills20192020$AB594$sponsors <- addSponsors("Y20192020", c("SalasA"))
aiBills20192020$AB594$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20192020$AB594$dateStart <- as.Date("2019-02-14")
aiBills20192020$AB594$dateEnd <- as.Date("2020-01-21")
aiBills20192020$AB594$dateUpdated <- Sys.Date()

# measures
aiBills20192020$AB594$version <- "Enrolled"
aiBills20192020$AB594$outcome <- "Failed"
aiBills20192020$AB594$chaptered <- FALSE
aiBills20192020$AB594$chapterNo <- NA
aiBills20192020$AB594$active <- FALSE
aiBills20192020$AB594$result <- "Vetoed"
aiBills20192020$AB594$vote <- "Majority"
aiBills20192020$AB594$appropriation <- FALSE
aiBills20192020$AB594$fiscal <- TRUE
aiBills20192020$AB594$local <- FALSE
aiBills20192020$AB594$urgency <- FALSE
aiBills20192020$AB594$tax <- FALSE
aiBills20192020$AB594$action <- "Consideration of Governor's veto stricken from file"
aiBills20192020$AB594$pdf <- "20190AB594_95.pdf"

# AI properties assessed from the text in aiBills20192020$AB594$text
aiBills20192020$AB594$aiDisposition <- "Supportive"
aiBills20192020$AB594$aiType <- "General"
aiBills20192020$AB594$aiSector <- "Governance"
aiBills20192020$AB594$aiSubSector <- "Policy and Regulation"
aiBills20192020$AB594$aiDomain <- "Ethics"
aiBills20192020$AB594$aiAccountability <- "Moderate"
aiBills20192020$AB594$aiImpact <- "Moderate"
aiBills20192020$AB594$aiEthics <- "Moderate"
aiBills20192020$AB594$aiInnovation <- "Low"
aiBills20192020$AB594$aiPrivacy <- "Low"
aiBills20192020$AB594$aiTransparency <- "Moderate"

### SB-730 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20192020$SB730$text)

# Topic from aiBills20192020$SB730$status
aiBills20192020$SB730$topic <- "SB-730 Commission on Tech Equity"

# Title from aiBills20192020$SB730$status
aiBills20192020$SB730$title <- paste0(aiBills20192020$SB730$title, "An act to add and repeal Chapter 3.7 (commencing with Section 8299) of Division 1 of Title 2 of the Government Code, relating to employment development")

# tldr for aiBills20192020$SB730$text
aiBills20192020$SB730$tldr <- "SB-730 establishes the Commission on Tech Equity to address issues of equity and inclusion in the technology sector. The commission will focus on promoting diversity, equity, and access in technology-related fields and industries. It aims to ensure that all Californians have equal opportunities to participate in and benefit from the technology economy."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20192020$SB730$tags <- c("artificial-intelligence", "commission-on-tech-equity", "equity", "inclusion", "technology-sector", "diversity", "access", "technology-related-fields", "technology-economy")

# sponsors and cosponsors
aiBills20192020$SB73$sponsors <- addSponsors("Y20192020", c("SternS"))
aiBills20192020$SB730$cosponsors <- addSponsors("Y20192020", c("PetrieNorrisA", "SkinnerS", "WicksA"))

# dateStart, dateEnd, and dateUpdated
aiBills20192020$SB730$dateStart <- as.Date("2019-02-22")
aiBills20192020$SB730$dateEnd <- as.Date("2020-11-30")
aiBills20192020$SB730$dateUpdated <- Sys.Date()

# measures
aiBills20192020$SB730$version <- "Amended Assembly"
aiBills20192020$SB730$outcome <- "Failed"
aiBills20192020$SB730$chaptered <- FALSE
aiBills20192020$SB730$chapterNo <- NA
aiBills20192020$SB730$active <- FALSE
aiBills20192020$SB730$result <- "Died"
aiBills20192020$SB730$vote <- "Majority"
aiBills20192020$SB730$appropriation <- FALSE
aiBills20192020$SB730$fiscal <- TRUE
aiBills20192020$SB730$local <- FALSE
aiBills20192020$SB730$urgency <- FALSE
aiBills20192020$SB730$tax <- FALSE
aiBills20192020$SB730$action <- "From Assembly without further action"
aiBills20192020$SB730$pdf <- "20190SB730_95.pdf"

# AI properties assessed from the text in aiBills20192020$SB730$text
aiBills20192020$SB730$aiDisposition <- "Supportive"
aiBills20192020$SB730$aiType <- "General"
aiBills20192020$SB730$aiSector <- "Governance"
aiBills20192020$SB730$aiSubSector <- "Policy and Regulation"
aiBills20192020$SB730$aiDomain <- "Technology"
aiBills20192020$SB730$aiAccountability <- "Moderate"
aiBills20192020$SB730$aiImpact <- "Moderate"
aiBills20192020$SB730$aiEthics <- "Moderate"
aiBills20192020$SB730$aiInnovation <- "Low"
aiBills20192020$SB730$aiPrivacy <- "Low"
aiBills20192020$SB730$aiTransparency <- "Moderate"

### SB-444 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20192020$SB444$text)

# Topic from aiBills20192020$SB444$status
aiBills20192020$SB444$topic <- "SB-444 University of California: Berkeley and Irvine law schools: Pro Se Indigent Litigant Research Program"

# Title from aiBills20192020$SB444$status
aiBills20192020$SB444$title <- paste0(aiBills20192020$SB444$title, "An act to add Article 7.9 (commencing with Section 92685) to Chapter 6 of Part 57 of Division 9 of Title 3 of the Education Code, relating to the University of California")

# tldr for aiBills20192020$SB444$text
aiBills20192020$SB444$tldr <- "SB-444 establishes a Pro Se Indigent Litigant Research Program at the University of California, Berkeley and Irvine law schools. The program aims to provide legal assistance and resources to self-represented indigent litigants. It focuses on improving access to justice for low-income individuals and enhancing their understanding of the legal system."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20192020$SB444$tags <- c("artificial-intelligence", "university-of-california", "berkeley", "irvine", "law-schools", "pro-se-indigent-litigant-research-program", "legal-assistance", "self-represented-litigants", "access-to-justice", "low-income-individuals")

# sponsors and cosponsors
aiBills20192020$SB444$sponsors <- addSponsors("Y20192020", c("UmbergS"))
aiBills20192020$SB444$cosponsors <- addSponsors("Y20192020", c("SternS"))

# dateStart, dateEnd, and dateUpdated
aiBills20192020$SB444$dateStart <- as.Date("2019-02-21")
aiBills20192020$SB444$dateEnd <- as.Date("2020-11-30")
aiBills20192020$SB444$dateUpdated <- Sys.Date()

# measures
aiBills20192020$SB444$version <- "Amended Assembly"
aiBills20192020$SB444$outcome <- "Failed"
aiBills20192020$SB444$chaptered <- FALSE
aiBills20192020$SB444$chapterNo <- NA
aiBills20192020$SB444$active <- FALSE
aiBills20192020$SB444$result <- "Died"
aiBills20192020$SB444$vote <- "Majority"
aiBills20192020$SB444$appropriation <- FALSE
aiBills20192020$SB444$fiscal <- TRUE
aiBills20192020$SB444$local <- FALSE
aiBills20192020$SB444$urgency <- FALSE
aiBills20192020$SB444$tax <- FALSE
aiBills20192020$SB444$action <- "From Assembly without further action"
aiBills20192020$SB444$pdf <- "20190SB444_94.pdf"

# AI properties assessed from the text in aiBills20192020$SB444$text
aiBills20192020$SB444$aiDisposition <- "Supportive"
aiBills20192020$SB444$aiType <- "General"
aiBills20192020$SB444$aiSector <- "Education"
aiBills20192020$SB444$aiSubSector <- "Law and Policy"
aiBills20192020$SB444$aiDomain <- "Legal"
aiBills20192020$SB444$aiAccountability <- "Moderate"
aiBills20192020$SB444$aiImpact <- "Moderate"
aiBills20192020$SB444$aiEthics <- "Moderate"
aiBills20192020$SB444$aiInnovation <- "Low"
aiBills20192020$SB444$aiPrivacy <- "Low"
aiBills20192020$SB444$aiTransparency <- "Moderate"

### AB-156 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20192020$AB156$text)

# Topic from aiBills20192020$AB156$status
aiBills20192020$AB156$topic <- "AB-156 Optometrists: endorsement fee"

# Title from aiBills20192020$AB156$status
aiBills20192020$AB156$title <- paste0(aiBills20192020$AB156$title, "An act to amend Section 3152 of the Business and Professions Code, relating to healing arts")

# tldr for aiBills20192020$AB156$text
aiBills20192020$AB156$tldr <- "AB-156 amends the Business and Professions Code to modify the endorsement fee for optometrists. The bill aims to streamline the process for optometrists seeking endorsement and reduce financial barriers to practice. It focuses on improving access to eye care services and ensuring that optometrists can provide quality care to patients."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20192020$AB156$tags <- c("artificial-intelligence", "optometrists", "endorsement-fee", "business-and-professions-code", "healing-arts", "access-to-eye-care", "quality-care")

# sponsors and cosponsors
aiBills20192020$AB156$sponsors <- addSponsors("Y20192020", c("VoepelA"))
aiBills20192020$AB156$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20192020$AB156$dateStart <- as.Date("2019-01-07")
aiBills20192020$AB156$dateEnd <- as.Date("2020-02-03")
aiBills20192020$AB156$dateUpdated <- Sys.Date()

# measures
aiBills20192020$AB156$version <- "Amended Assembly"
aiBills20192020$AB156$outcome <- "Failed"
aiBills20192020$AB156$chaptered <- FALSE
aiBills20192020$AB156$chapterNo <- NA
aiBills20192020$AB156$active <- FALSE
aiBills20192020$AB156$result <- "Died"
aiBills20192020$AB156$vote <- "Majority"
aiBills20192020$AB156$appropriation <- FALSE
aiBills20192020$AB156$fiscal <- TRUE
aiBills20192020$AB156$local <- FALSE
aiBills20192020$AB156$urgency <- FALSE
aiBills20192020$AB156$tax <- FALSE
aiBills20192020$AB156$action <- "From committee: Filed with the Chief Clerk pursuant to Joint Rule 56"
aiBills20192020$AB156$pdf <- "20190AB156_98.pdf"

# AI properties assessed from the text in aiBills20192020$AB156$text
aiBills20192020$AB156$aiDisposition <- "Neutral"
aiBills20192020$AB156$aiType <- "General"
aiBills20192020$AB156$aiSector <- "Healthcare"
aiBills20192020$AB156$aiSubSector <- "Optometry"
aiBills20192020$AB156$aiDomain <- "Healthcare"
aiBills20192020$AB156$aiAccountability <- "Low"
aiBills20192020$AB156$aiImpact <- "Low"
aiBills20192020$AB156$aiEthics <- "Low"
aiBills20192020$AB156$aiInnovation <- "Low"
aiBills20192020$AB156$aiPrivacy <- "Low"
aiBills20192020$AB156$aiTransparency <- "Low"

### AB-3317 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20192020$AB3317$text)

# Topic from aiBills20192020$AB3317$status
aiBills20192020$AB3317$topic <- "AB-3317 Unfair and deceptive practices"

# Title from aiBills20192020$AB3317$status
aiBills20192020$AB3317$title <- paste0(aiBills20192020$AB3317$title, "An act to amend Section 1770 of the Civil Code, relating to unfair business practices")

# tldr for aiBills20192020$AB3317$text
aiBills20192020$AB3317$tldr <- "AB-3317 amends the Civil Code to address unfair and deceptive practices in business. The bill aims to protect consumers from misleading advertising and fraudulent practices. It focuses on enhancing consumer rights and ensuring fair business practices in California."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20192020$AB3317$tags <- c("artificial-intelligence", "unfair-business-practices", "deceptive-practices", "civil-code", "consumer-protection", "misleading-advertising", "fraudulent-practices", "consumer-rights", "fair-business-practices")

# sponsors and cosponsors
aiBills20192020$AB3317$sponsors <- addSponsors("Y20192020", c("WicksA"))
aiBills20192020$AB3317$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20192020$AB3317$dateStart <- as.Date("2019-02-21")
aiBills20192020$AB3317$dateEnd <- as.Date("2020-11-30")
aiBills20192020$AB3317$dateUpdated <- Sys.Date()

# measures
aiBills20192020$AB3317$version <- "Amended Assembly"
aiBills20192020$AB3317$outcome <- "Failed"
aiBills20192020$AB3317$chaptered <- FALSE
aiBills20192020$AB3317$chapterNo <- NA
aiBills20192020$AB3317$active <- FALSE
aiBills20192020$AB3317$result <- "Died"
aiBills20192020$AB3317$vote <- "Majority"
aiBills20192020$AB3317$appropriation <- FALSE
aiBills20192020$AB3317$fiscal <- TRUE
aiBills20192020$AB3317$local <- FALSE
aiBills20192020$AB3317$urgency <- FALSE
aiBills20192020$AB3317$tax <- FALSE
aiBills20192020$AB3317$action <- "From committee without further action"
aiBills20192020$AB3317$pdf <- "20190AB3317_98.pdf"

# AI properties assessed from the text in aiBills20192020$AB3317$text
aiBills20192020$AB3317$aiDisposition <- "Restrictive"
aiBills20192020$AB3317$aiType <- "General"
aiBills20192020$AB3317$aiSector <- "Business"
aiBills20192020$AB3317$aiSubSector <- "Consumer Protection"
aiBills20192020$AB3317$aiDomain <- "Commerce"
aiBills20192020$AB3317$aiAccountability <- "Moderate"
aiBills20192020$AB3317$aiImpact <- "Moderate"
aiBills20192020$AB3317$aiEthics <- "Moderate"
aiBills20192020$AB3317$aiInnovation <- "Low"
aiBills20192020$AB3317$aiPrivacy <- "Moderate"
aiBills20192020$AB3317$aiTransparency <- "Moderate"

### ACR-125 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20192020$ACR125$text)

# Topic from aiBills20192020$ACR125$status
aiBills20192020$ACR125$topic <- "ACR-125 Bias and discrimination in hiring reduction through new technology"

# Title from aiBills20192020$ACR125$status
aiBills20192020$ACR125$title <- paste0(aiBills20192020$ACR125$title, "Relative to employment")

# tldr for aiBills20192020$ACR125$text
aiBills20192020$ACR125$tldr <- "ACR-125 is a resolution that addresses bias and discrimination in hiring practices through the use of new technology. It emphasizes the importance of ensuring that technology used in hiring processes is fair, transparent, and does not perpetuate existing biases. The resolution calls for the development of guidelines and best practices to mitigate bias in hiring algorithms and promote equitable employment opportunities."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20192020$ACR125$tags <- c("artificial-intelligence", "bias", "discrimination", "hiring-reduction", "new-technology", "employment", "guidelines", "best-practices", "equitable-employment-opportunities")

# sponsors and cosponsors
aiBills20192020$ACR125$sponsors <- addSponsors("Y20192020", c("JonesSawyerA", "HoldenA"))
aiBills20192020$ACR125$cosponsors <- addSponsors("Y20192020", c("GonzalezS", "KamlagerA", "LowA"))

# dateStart, dateEnd, and dateUpdated
aiBills20192020$ACR125$dateStart <- as.Date("2019-08-14")
aiBills20192020$ACR125$dateEnd <- as.Date("2020-11-30")
aiBills20192020$ACR125$dateUpdated <- Sys.Date()

# measures
aiBills20192020$ACR125$version <- "Amended Assembly"
aiBills20192020$ACR125$outcome <- "Failed"
aiBills20192020$ACR125$chaptered <- FALSE
aiBills20192020$ACR125$chapterNo <- NA
aiBills20192020$ACR125$active <- FALSE
aiBills20192020$ACR125$result <- "Died"
aiBills20192020$ACR125$vote <- "No Vote"
aiBills20192020$ACR125$appropriation <- FALSE
aiBills20192020$ACR125$fiscal <- FALSE
aiBills20192020$ACR125$local <- FALSE
aiBills20192020$ACR125$urgency <- FALSE
aiBills20192020$ACR125$tax <- FALSE
aiBills20192020$ACR125$action <- "From Senate committee without further action"
aiBills20192020$ACR125$pdf <- "20190ACR125_98.pdf"

# AI properties assessed from the text in aiBills20192020$ACR125$text
aiBills20192020$ACR125$aiDisposition <- "Supportive"
aiBills20192020$ACR125$aiType <- "General"
aiBills20192020$ACR125$aiSector <- "Employment"
aiBills20192020$ACR125$aiSubSector <- "Hiring Practices"
aiBills20192020$ACR125$aiDomain <- "Employment"
aiBills20192020$ACR125$aiAccountability <- "Moderate"
aiBills20192020$ACR125$aiImpact <- "Moderate"
aiBills20192020$ACR125$aiEthics <- "Moderate"
aiBills20192020$ACR125$aiInnovation <- "Low"
aiBills20192020$ACR125$aiPrivacy <- "High"
aiBills20192020$ACR125$aiTransparency <- "Moderate"

### SCR-13 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20192020$SCR13$text)

# Topic from aiBills20192020$SCR13$status
aiBills20192020$SCR13$topic <- "SCR-13 International Women’s Day"

# Title from aiBills20192020$SCR13$status
aiBills20192020$SCR13$title <- paste0(aiBills20192020$SCR13$title, "Relative to International Women’s Day")

# tldr for aiBills20192020$SCR13$text
aiBills20192020$SCR13$tldr <- "SCR-13 designates March 8, 2019, as International Women’s Day in California, recognizing its historical roots in labor movements and activism for women’s rights. It highlights progress in gender equality, ongoing challenges like the gender digital divide, and the importance of innovation and technology in empowering women. The resolution calls for reflection, celebration, and continued efforts toward achieving gender equality."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20192020$SCR13$tags <- c("artificial-intelligence", "international-womens-day", "labor-movements", "activism", "gender-equality", "digital-divide", "innovation", "technology", "empowering-women", "reflection", "celebration", "continued-efforts")

# sponsors and cosponsors
aiBills20192020$SCR13$sponsors <- addSponsors("Y20192020", c("JacksonS"))
aiBills20192020$SCR13$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20192020$SCR13$dateStart <- as.Date("2019-02-14")
aiBills20192020$SCR13$dateEnd <- as.Date("2020-03-27")
aiBills20192020$SCR13$dateUpdated <- Sys.Date()

# measures
aiBills20192020$SCR13$version <- "Chaptered"
aiBills20192020$SCR13$outcome <- "Chaptered"
aiBills20192020$SCR13$chaptered <- TRUE
aiBills20192020$SCR13$chapterNo <- 22
aiBills20192020$SCR13$active <- FALSE
aiBills20192020$SCR13$result <- "Chaptered"
aiBills20192020$SCR13$vote <- "No Vote"
aiBills20192020$SCR13$appropriation <- FALSE
aiBills20192020$SCR13$fiscal <- FALSE
aiBills20192020$SCR13$local <- FALSE
aiBills20192020$SCR13$urgency <- FALSE
aiBills20192020$SCR13$tax <- FALSE
aiBills20192020$SCR13$action <- "Chaptered by Secretary of State - Res. Chapter 22, Statutes of 2019"
aiBills20192020$SCR13$pdf <- "20190SCR13_97.pdf"

# AI properties assessed from the text in aiBills20192020$SCR13$text
aiBills20192020$SCR13$aiDisposition <- "Supportive"
aiBills20192020$SCR13$aiType <- "General"
aiBills20192020$SCR13$aiSector <- "Social Justice"
aiBills20192020$SCR13$aiSubSector <- "Gender Equality"
aiBills20192020$SCR13$aiDomain <- "Social Justice"
aiBills20192020$SCR13$aiAccountability <- "Low"
aiBills20192020$SCR13$aiImpact <- "Low"
aiBills20192020$SCR13$aiEthics <- "Low"
aiBills20192020$SCR13$aiInnovation <- "Low"
aiBills20192020$SCR13$aiPrivacy <- "Low"
aiBills20192020$SCR13$aiTransparency <- "Low"

### SB-752 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20192020$SB752$text)

# Topic from aiBills20192020$SB752$status
aiBills20192020$SB752$topic <- "SB-752 The California Master Plan on Tech Equity"

# Title from aiBills20192020$SB752$status
aiBills20192020$SB752$title <- paste0(aiBills20192020$SB752$title, "An act to add and repeal Chapter 3.7 (commencing with Section 8299) to of Division 1 of Title 2 of the Government Code, relating to state government")

# tldr for aiBills20192020$SB752$text
aiBills20192020$SB752$tldr <- "SB-752 establishes the California Master Plan on Tech Equity to address issues of equity and inclusion in the technology sector. The plan aims to promote diversity, equity, and access in technology-related fields and industries. It focuses on ensuring that all Californians have equal opportunities to participate in and benefit from the technology economy."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20192020$SB752$tags <- c("artificial-intelligence", "california-master-plan", "tech-equity", "equity", "inclusion", "technology-sector", "diversity", "access", "technology-related-fields", "technology-economy")

# sponsors and cosponsors
aiBills20192020$SB752$sponsors <- addSponsors("Y20192020", c("SternS"))
aiBills20192020$SB752$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20192020$SB752$dateStart <- as.Date("2019-02-22")
aiBills20192020$SB752$dateEnd <- as.Date("2020-02-03")
aiBills20192020$SB752$dateUpdated <- Sys.Date()

# measures
aiBills20192020$SB752$version <- "Amended Senate"
aiBills20192020$SB752$outcome <- "Failed"
aiBills20192020$SB752$chaptered <- FALSE
aiBills20192020$SB752$chapterNo <- NA
aiBills20192020$SB752$active <- FALSE
aiBills20192020$SB752$result <- "Died"
aiBills20192020$SB752$vote <- "Majority"
aiBills20192020$SB752$appropriation <- FALSE
aiBills20192020$SB752$fiscal <- TRUE
aiBills20192020$SB752$local <- FALSE
aiBills20192020$SB752$urgency <- FALSE
aiBills20192020$SB752$tax <- FALSE
aiBills20192020$SB752$action <- "Returned to Secretary of Senate pursuant to Joint Rule 56"
aiBills20192020$SB752$pdf <- "20190SB752_97.pdf"

# AI properties assessed from the text in aiBills20192020$SB752$text
aiBills20192020$SB752$aiDisposition <- "Supportive"
aiBills20192020$SB752$aiType <- "General"
aiBills20192020$SB752$aiSector <- "Governance"
aiBills20192020$SB752$aiSubSector <- "Policy and Regulation"
aiBills20192020$SB752$aiDomain <- "Technology"
aiBills20192020$SB752$aiAccountability <- "Moderate"
aiBills20192020$SB752$aiImpact <- "Moderate"
aiBills20192020$SB752$aiEthics <- "Moderate"
aiBills20192020$SB752$aiInnovation <- "Low"
aiBills20192020$SB752$aiPrivacy <- "Low"
aiBills20192020$SB752$aiTransparency <- "Moderate"

### AB-2269 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20192020$AB2269$text)

# Topic from aiBills20192020$AB2269$status
aiBills20192020$AB2269$topic <- "AB-2269 Personal rights: automated decision systems"

# Title from aiBills20192020$AB2269$status
aiBills20192020$AB2269$title <- paste0(aiBills20192020$AB2269$title, "An act to add Title 1.81.8 (commencing with Section 1798.400) to Part 4 of Division 3 of the Civil Code, relating to automatic decision systems")

# tldr for aiBills20192020$AB2269$text
aiBills20192020$AB2269$tldr <- "AB-2269 establishes regulations for automated decision systems to protect personal rights. It aims to ensure transparency, accountability, and fairness in the use of such systems. The bill focuses on preventing discrimination and bias in automated decision-making processes, promoting ethical practices in technology."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20192020$AB2269$tags <- c("artificial-intelligence", "personal-rights", "automated-decision-systems", "civil-code", "transparency", "accountability", "fairness", "discrimination", "bias", "ethical-practices")

# sponsors and cosponsors
aiBills20192020$AB2269$sponsors <- addSponsors("Y20192020", c("ChauA"))
aiBills20192020$AB2269$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20192020$AB2269$dateStart <- as.Date("2019-02-14")
aiBills20192020$AB2269$dateEnd <- as.Date("2020-11-30")
aiBills20192020$AB2269$dateUpdated <- Sys.Date()

# measures
aiBills20192020$AB2269$version <- "Introduced"
aiBills20192020$AB2269$outcome <- "Failed"
aiBills20192020$AB2269$chaptered <- FALSE
aiBills20192020$AB2269$chapterNo <- NA
aiBills20192020$AB2269$active <- FALSE
aiBills20192020$AB2269$result <- "Died"
aiBills20192020$AB2269$vote <- "Majority"
aiBills20192020$AB2269$appropriation <- FALSE
aiBills20192020$AB2269$fiscal <- TRUE
aiBills20192020$AB2269$local <- FALSE
aiBills20192020$AB2269$urgency <- FALSE
aiBills20192020$AB2269$tax <- FALSE
aiBills20192020$AB2269$action <- "From committee without further action"
aiBills20192020$AB2269$pdf <- "20190AB2269_99.pdf"

# AI properties assessed from the text in aiBills20192020$AB2269$text
aiBills20192020$AB2269$aiDisposition <- "Restrictive"
aiBills20192020$AB2269$aiType <- "Decision Systems"
aiBills20192020$AB2269$aiSector <- "Business"
aiBills20192020$AB2269$aiSubSector <- "Automated Decision Systems"
aiBills20192020$AB2269$aiDomain <- "Commerce"
aiBills20192020$AB2269$aiAccountability <- "High"
aiBills20192020$AB2269$aiImpact <- "High"
aiBills20192020$AB2269$aiEthics <- "High"
aiBills20192020$AB2269$aiInnovation <- "Low"
aiBills20192020$AB2269$aiPrivacy <- "High"
aiBills20192020$AB2269$aiTransparency <- "High"

### AB-485 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20192020$AB485$text)

# Topic from aiBills20192020$AB485$status
aiBills20192020$AB485$topic <- "AB-485 Local government: economic development subsidies"

# Title from aiBills20192020$AB485$status
aiBills20192020$AB485$title <- paste0(aiBills20192020$AB485$title, "An act to add Section 53083.1 to the Government Code, relating to local government")

# tldr for aiBills20192020$AB485$text
aiBills20192020$AB485$tldr <- "AB-485 establishes regulations for local government economic development subsidies. It aims to ensure transparency and accountability in the use of public funds for economic development purposes. The bill focuses on preventing misuse of subsidies and promoting fair competition among businesses."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20192020$AB485$tags <- c("artificial-intelligence", "local-government", "economic-development-subsidies", "government-code", "transparency", "accountability", "public-funds", "fair-competition")

# sponsors and cosponsors
aiBills20192020$AB485$sponsors <- addSponsors("Y20192020", c("MedinaA"))
aiBills20192020$AB485$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20192020$AB485$dateStart <- as.Date("2019-02-12")
aiBills20192020$AB485$dateEnd <- as.Date("2020-10-12")
aiBills20192020$AB485$dateUpdated <- Sys.Date()

# measures
aiBills20192020$AB485$version <- "Chaptered"
aiBills20192020$AB485$outcome <- "Chaptered"
aiBills20192020$AB485$chaptered <- TRUE
aiBills20192020$AB485$chapterNo <- 803
aiBills20192020$AB485$active <- FALSE
aiBills20192020$AB485$result <- "Chaptered"
aiBills20192020$AB485$vote <- "Majority"
aiBills20192020$AB485$appropriation <- FALSE
aiBills20192020$AB485$fiscal <- TRUE
aiBills20192020$AB485$local <- FALSE
aiBills20192020$AB485$urgency <- FALSE
aiBills20192020$AB485$tax <- FALSE
aiBills20192020$AB485$action <- "Chaptered by Secretary of State - Chapter 803, Statutes of 2020"
aiBills20192020$AB485$pdf <- "20190AB485_95.pdf"

# AI properties assessed from the text in aiBills20192020$AB485$text
aiBills20192020$AB485$aiDisposition <- "Restrictive"
aiBills20192020$AB485$aiType <- "General"
aiBills20192020$AB485$aiSector <- "Local Government"
aiBills20192020$AB485$aiSubSector <- "Economic Development"
aiBills20192020$AB485$aiDomain <- "Governance"
aiBills20192020$AB485$aiAccountability <- "High"
aiBills20192020$AB485$aiImpact <- "Moderate"
aiBills20192020$AB485$aiEthics <- "High"
aiBills20192020$AB485$aiInnovation <- "Low"
aiBills20192020$AB485$aiPrivacy <- "High"
aiBills20192020$AB485$aiTransparency <- "High"

### AB-3339 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20192020$AB3339$text)

# Topic from aiBills20192020$AB3339$status
aiBills20192020$AB3339$topic <- "AB-3339 Kids Internet Design and Safety Act"

# Title from aiBills20192020$AB3339$status
aiBills20192020$AB3339$title <- paste0(aiBills20192020$AB3339$title, "An act to add Title 1.81.7 (commencing with Section 1798.300) to Part 4 of Division 3 of the Civil Code, relating to business")

# tldr for aiBills20192020$AB3339$text
aiBills20192020$AB3339$tldr <- "AB-3339 establishes the Kids Internet Design and Safety Act to protect children online. It aims to ensure that online platforms prioritize the safety and privacy of minors. The bill focuses on implementing design features that promote safe online experiences for children, including data protection and age-appropriate content."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20192020$AB3339$tags <- c("artificial-intelligence", "kids-internet-design", "safety-act", "business", "online-safety", "privacy", "minors", "data-protection", "age-appropriate-content")

# sponsors and cosponsors
aiBills20192020$AB3339$sponsors <- addSponsors("Y20192020", c("WicksA"))
aiBills20192020$AB3339$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20192020$AB3339$dateStart <- as.Date("2019-02-21")
aiBills20192020$AB3339$dateEnd <- as.Date("2020-11-30")
aiBills20192020$AB3339$dateUpdated <- Sys.Date()

# measures
aiBills20192020$AB3339$version <- "Amended Assembly"
aiBills20192020$AB3339$outcome <- "Failed"
aiBills20192020$AB3339$chaptered <- FALSE
aiBills20192020$AB3339$chapterNo <- NA
aiBills20192020$AB3339$active <- FALSE
aiBills20192020$AB3339$result <- "Died"
aiBills20192020$AB3339$vote <- "Majority"
aiBills20192020$AB3339$appropriation <- FALSE
aiBills20192020$AB3339$fiscal <- TRUE
aiBills20192020$AB3339$local <- FALSE
aiBills20192020$AB3339$urgency <- FALSE
aiBills20192020$AB3339$tax <- FALSE
aiBills20192020$AB3339$action <- "From committee without further action"
aiBills20192020$AB3339$pdf <- "20190AB3339_98.pdf"

# AI properties assessed from the text in aiBills20192020$AB3339$text
aiBills20192020$AB3339$aiDisposition <- "Restrictive"
aiBills20192020$AB3339$aiType <- "Safety and Privacy"
aiBills20192020$AB3339$aiSector <- "Children's Safety"
aiBills20192020$AB3339$aiSubSector <- "Online Safety"
aiBills20192020$AB3339$aiDomain <- "Safety and Privacy"
aiBills20192020$AB3339$aiAccountability <- "High"
aiBills20192020$AB3339$aiImpact <- "High"
aiBills20192020$AB3339$aiEthics <- "High"
aiBills20192020$AB3339$aiInnovation <- "Low"
aiBills20192020$AB3339$aiPrivacy <- "High"
aiBills20192020$AB3339$aiTransparency <- "High"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 5. Export and Save Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Remove unnecessary variables
rm(billList)

# Export the dfCalMembers data frame to the data directory as an RData file
save(aiBills20192020, file = file.path(prjDirs$pathData, "aiBills20192020.RData"))

# Export the calMembers list to the data directory as an RData file
save(calMembers, file = file.path(prjDirs$pathData, "calMembers.RData"))

#~~~~~~~~~~~~~~~~~~~
# End of Script ####
#~~~~~~~~~~~~~~~~~~~
