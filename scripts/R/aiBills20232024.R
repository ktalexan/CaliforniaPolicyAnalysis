#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# AI POLICY ANALYSIS PROJECT
# Add AI Bills Data for 2023-2024
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
billList <- c("AB-2652", "SB-1288", "AB-2013", "AB-2811", "SB-893", "SB-1235", "SB-896", "SB-313", "SB-970", "AB-3030", "SB-1229", "SB-1120", "SB-398", "AB-3058", "SB-1047", "AB-3204", "AB-2876", "AB-2885", "AB-3095", "AB-1831", "SB-942", "ACR-96", "SB-933", "SB-892", "AB-2355", "SB-1381", "AJR-6", "AB-1873", "SCR-17", "AB-2905", "AB-3050", "AB-3211", "AB-2877", "AB-331", "SB-1220", "AB-2512", "ACR-227", "AB-2930", "AB-1027", "AB-302", "SCR-121", "AB-2412", "AB-2839", "ACR-219", "SB-1446", "SCR-162", "SB-1154", "AB-2655", "AB-1008", "AB-1526", "AB-2200", "SB-1223", "AB-108", "AB-103", "AB-2928", "AB-100", "SB-100", "SB-103", "AB-106", "SB-158", "SB-106", "AB-158", "AB-104", "SB-104", "SB-107", "AB-107", "AB-1754")

# Define the list to store the AI bills data for 2023-2024
aiBills20232024 <- list()

# Loop through each year in the AI Bill List and create a template for each bill
for (bill in billList) {
    id <- gsub("-", "", bill)
    # Call the function to add the bill structure
    aiBills20232024[[id]] <- addBillStructure(2023, bill)
}

# Remove unnecessary variables
rm(bill, id)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 4. Populate AI Bill Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### AB-2652 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB2652$text)

# Topic from aiBills20232024$AB2652$status
aiBills20232024$AB2652$topic <- "AB-2652 State Department of Education: artificial intelligence working group"

# Title from aiBills20232024$AB2652$status
aiBills20232024$AB2652$title <- paste0(aiBills20232024$AB2652$title, "An act to add Section 33328.5 to the Education Code, relating to the State Department of Education")

# tldr for aiBills20232024$AB2652$text
aiBills20232024$AB2652$tldr <- "AB-2652 establishes an artificial intelligence working group within the State Department of Education to evaluate the impact of AI on education. The group will assess AI's potential benefits and challenges, develop guidelines for its responsible use, and recommend policies to ensure equitable access to AI resources in schools."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB2652$tags <- c("artificial-intelligence", "education", "working-group", "state-department", "guidelines", "equitable-access", "responsible-use")

# sponsors and cosponsors
aiBills20232024$AB2652$sponsors <- addSponsors("Y20232024", c("MuratsuchiA"))
aiBills20232024$AB2652$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB2652$dateStart <- as.Date("2024-02-14")
aiBills20232024$AB2652$dateEnd <- as.Date("2024-11-30")
aiBills20232024$AB2652$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB2652$version <- "Amended Assembly"
aiBills20232024$AB2652$outcome <- "Failed"
aiBills20232024$AB2652$chaptered <- FALSE
aiBills20232024$AB2652$chapterNo <- NA
aiBills20232024$AB2652$active <- FALSE
aiBills20232024$AB2652$result <- "Died"
aiBills20232024$AB2652$vote <- "Majority"
aiBills20232024$AB2652$appropriation <- FALSE
aiBills20232024$AB2652$fiscal <- TRUE
aiBills20232024$AB2652$local <- FALSE
aiBills20232024$AB2652$urgency <- FALSE
aiBills20232024$AB2652$tax <- FALSE
aiBills20232024$AB2652$action <- "From committee without further action"
aiBills20232024$AB2652$pdf <- "2023AB2652_97.pdf"

# AI properties assessed from the text in aiBills20232024$AB2652$text
aiBills20232024$AB2652$aiDisposition <- "Restrictive"
aiBills20232024$AB2652$aiType <- "General"
aiBills20232024$AB2652$aiSector <- "Education"
aiBills20232024$AB2652$aiSubSector <- "K-12 Education"
aiBills20232024$AB2652$aiDomain <- "Education Management"
aiBills20232024$AB2652$aiAccountability <- "High"
aiBills20232024$AB2652$aiImpact <- "High"
aiBills20232024$AB2652$aiEthics <- "High"
aiBills20232024$AB2652$aiInnovation <- "Low"
aiBills20232024$AB2652$aiPrivacy <- "High"
aiBills20232024$AB2652$aiTransparency <- "High"

### SB-1288 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$SB1288$text)

# Topic from aiBills20232024$SB1288$status
aiBills20232024$SB1288$topic <- "SB-1288 Public schools: artificial intelligence working group"

# Title from aiBills20232024$SB1288$status
aiBills20232024$SB1288$title <- paste0(aiBills20232024$SB1288$title, "An act to add and repeal Section 33328.5 of the Education Code, relating to public schools")

# tldr for aiBills20232024$SB1288$text
aiBills20232024$SB1288$tldr <- "SB-1288 establishes an artificial intelligence working group within the State Department of Education to evaluate the impact of AI on education. The group will assess AI's potential benefits and challenges, develop guidelines for its responsible use, and recommend policies to ensure equitable access to AI resources in schools."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$SB1288$tags <- c("artificial-intelligence", "education", "working-group", "state-department", "guidelines", "equitable-access", "responsible-use")

# sponsors and cosponsors
aiBills20232024$SB1288$sponsors <- addSponsors("Y20232024", c("BeckerS"))
aiBills20232024$SB1288$cosponsors <- addSponsors("Y20232024", c("MuratsuchiA", "BermanA", "DoddS"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$SB1288$dateStart <- as.Date("2024-02-15")
aiBills20232024$SB1288$dateEnd <- as.Date("2024-09-28")
aiBills20232024$SB1288$dateUpdated <- Sys.Date()

# measures
aiBills20232024$SB1288$version <- "Chaptered"
aiBills20232024$SB1288$outcome <- "Chaptered"
aiBills20232024$SB1288$chaptered <- TRUE
aiBills20232024$SB1288$chapterNo <- 893
aiBills20232024$SB1288$active <- FALSE
aiBills20232024$SB1288$result <- "Chaptered"
aiBills20232024$SB1288$vote <- "Majority"
aiBills20232024$SB1288$appropriation <- FALSE
aiBills20232024$SB1288$fiscal <- TRUE
aiBills20232024$SB1288$local <- FALSE
aiBills20232024$SB1288$urgency <- FALSE
aiBills20232024$SB1288$tax <- FALSE
aiBills20232024$SB1288$action <- "Chaptered by Secretary of State - Chapter 893, Statutes of 2024"
aiBills20232024$SB1288$pdf <- "20230SB1288_92.pdf"

# AI properties assessed from the text in aiBills20232024$SB1288$text
aiBills20232024$SB1288$aiDisposition <- "Restrictive"
aiBills20232024$SB1288$aiType <- "General"
aiBills20232024$SB1288$aiSector <- "Education"
aiBills20232024$SB1288$aiSubSector <- "K-12 Education"
aiBills20232024$SB1288$aiDomain <- "Education Management"
aiBills20232024$SB1288$aiAccountability <- "High"
aiBills20232024$SB1288$aiImpact <- "High"
aiBills20232024$SB1288$aiEthics <- "High"
aiBills20232024$SB1288$aiInnovation <- "Low"
aiBills20232024$SB1288$aiPrivacy <- "High"
aiBills20232024$SB1288$aiTransparency <- "High"

### AB-2013 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB2013$text)

# Topic from aiBills20232024$AB2013$status
aiBills20232024$AB2013$topic <- "AB-2013 Generative artificial intelligence: training data transparency"

# Title from aiBills20232024$AB2013$status
aiBills20232024$AB2013$title <- paste0(aiBills20232024$AB2013$title, "An act to add Title 15.2 (commencing with Section 3110) to Part 4 of Division 3 of the Civil Code, relating to artificial intelligence")

# tldr for aiBills20232024$AB2013$text
aiBills20232024$AB2013$tldr <- "AB-2013 mandates transparency in the training data used for generative artificial intelligence systems. It requires companies to disclose the sources and types of data utilized in training their AI models, ensuring accountability and ethical practices in AI development."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB2013$tags <- c("artificial-intelligence", "generative-ai", "training-data", "transparency", "accountability", "ethical-practices", "data-sources")

# sponsors and cosponsors
aiBills20232024$AB2013$sponsors <- addSponsors("Y20232024", c("IrwinA"))
aiBills20232024$AB2013$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB2013$dateStart <- as.Date("2024-01-31")
aiBills20232024$AB2013$dateEnd <- as.Date("2024-09-28")
aiBills20232024$AB2013$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB2013$version <- "Chaptered"
aiBills20232024$AB2013$outcome <- "Chaptered"
aiBills20232024$AB2013$chaptered <- TRUE
aiBills20232024$AB2013$chapterNo <- 817
aiBills20232024$AB2013$active <- FALSE
aiBills20232024$AB2013$result <- "Chaptered"
aiBills20232024$AB2013$vote <- "Majority"
aiBills20232024$AB2013$appropriation <- FALSE
aiBills20232024$AB2013$fiscal <- FALSE
aiBills20232024$AB2013$local <- FALSE
aiBills20232024$AB2013$urgency <- FALSE
aiBills20232024$AB2013$tax <- FALSE
aiBills20232024$AB2013$action <- "Chaptered by Secretary of State - Chapter 817, Statutes of 2024"
aiBills20232024$AB2013$pdf <- "20230AB2013_93.pdf"

# AI properties assessed from the text in aiBills20232024$AB2013$text
aiBills20232024$AB2013$aiDisposition <- "Restrictive"
aiBills20232024$AB2013$aiType <- "Generative"
aiBills20232024$AB2013$aiSector <- "General"
aiBills20232024$AB2013$aiSubSector <- "Generative AI"
aiBills20232024$AB2013$aiDomain <- "Generative AI Management"
aiBills20232024$AB2013$aiAccountability <- "High"
aiBills20232024$AB2013$aiImpact <- "High"
aiBills20232024$AB2013$aiEthics <- "High"
aiBills20232024$AB2013$aiInnovation <- "Low"
aiBills20232024$AB2013$aiPrivacy <- "High"
aiBills20232024$AB2013$aiTransparency <- "High"

### AB-2811 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB2811$text)

# Topic from aiBills20232024$AB2811$status
aiBills20232024$AB2811$topic <- "AB-2811 Attorneys: court filings: artificial intelligence"

# Title from aiBills20232024$AB2811$status
aiBills20232024$AB2811$title <- paste0(aiBills20232024$AB2811$title, "An act to add Section 6068.1 to the Business and Professions Code, relating to artificial intelligence")

# tldr for aiBills20232024$AB2811$text
aiBills20232024$AB2811$tldr <- "AB-2811 requires attorneys to disclose the use of artificial intelligence in court filings. It mandates that lawyers inform the court and opposing parties if AI tools were utilized in drafting legal documents, ensuring transparency and accountability in legal proceedings."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB2811$tags <- c("artificial-intelligence", "attorneys", "court-filings", "disclosure", "transparency", "accountability", "legal-proceedings")

# sponsors and cosponsors
aiBills20232024$AB2811$sponsors <- addSponsors("Y20232024", c("LowenthalA"))
aiBills20232024$AB2811$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB2811$dateStart <- as.Date("2024-02-15")
aiBills20232024$AB2811$dateEnd <- as.Date("2024-11-30")
aiBills20232024$AB2811$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB2811$version <- "Amended Assembly"
aiBills20232024$AB2811$outcome <- "Failed"
aiBills20232024$AB2811$chaptered <- FALSE
aiBills20232024$AB2811$chapterNo <- NA
aiBills20232024$AB2811$active <- FALSE
aiBills20232024$AB2811$result <- "Died"
aiBills20232024$AB2811$vote <- "Majority"
aiBills20232024$AB2811$appropriation <- FALSE
aiBills20232024$AB2811$fiscal <- TRUE
aiBills20232024$AB2811$local <- FALSE
aiBills20232024$AB2811$urgency <- FALSE
aiBills20232024$AB2811$tax <- FALSE
aiBills20232024$AB2811$action <- "From committee without further action"
aiBills20232024$AB2811$pdf <- "2023AB2811_98.pdf"

# AI properties assessed from the text in aiBills20232024$AB2811$text
aiBills20232024$AB2811$aiDisposition <- "Restrictive"
aiBills20232024$AB2811$aiType <- "Generative"
aiBills20232024$AB2811$aiSector <- "Legal"
aiBills20232024$AB2811$aiSubSector <- "Legal AI"
aiBills20232024$AB2811$aiDomain <- "Legal AI Management"
aiBills20232024$AB2811$aiAccountability <- "High"
aiBills20232024$AB2811$aiImpact <- "High"
aiBills20232024$AB2811$aiEthics <- "High"
aiBills20232024$AB2811$aiInnovation <- "Low"
aiBills20232024$AB2811$aiPrivacy <- "High"
aiBills20232024$AB2811$aiTransparency <- "High"

### SB-893 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$SB893$text)

# Topic from aiBills20232024$SB893$status
aiBills20232024$SB893$topic <- "SB-893 California Artificial Intelligence Research Hub"

# Title from aiBills20232024$SB893$status
aiBills20232024$SB893$title <- paste0(aiBills20232024$SB893$title, "An act to add Chapter 5.1 (commencing with Section 11530) to Part 1 of Division 3 of Title 2 of the Government Code, relating to artificial intelligence")

# tldr for aiBills20232024$SB893$text
aiBills20232024$SB893$tldr <- "SB-893 establishes the California Artificial Intelligence Research Hub to promote AI research and development. The hub will facilitate collaboration among researchers, industry, and government agencies to advance AI technologies and ensure their responsible use in California."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$SB893$tags <- c("artificial-intelligence", "research-hub", "collaboration", "responsible-use", "AI-technologies", "development", "government-agencies")

# sponsors and cosponsors
aiBills20232024$SB893$sponsors <- addSponsors("Y20232024", c("PadillaS"))
aiBills20232024$SB893$cosponsors <- addSponsors("Y20232024", c("DoddS", "RubioS"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$SB893$dateStart <- as.Date("2024-01-03")
aiBills20232024$SB893$dateEnd <- as.Date("2024-11-30")
aiBills20232024$SB893$dateUpdated <- Sys.Date()

# measures
aiBills20232024$SB893$version <- "Amended Assembly"
aiBills20232024$SB893$outcome <- "Failed"
aiBills20232024$SB893$chaptered <- FALSE
aiBills20232024$SB893$chapterNo <- NA
aiBills20232024$SB893$active <- FALSE
aiBills20232024$SB893$result <- "Died"
aiBills20232024$SB893$vote <- "Majority"
aiBills20232024$SB893$appropriation <- FALSE
aiBills20232024$SB893$fiscal <- TRUE
aiBills20232024$SB893$local <- FALSE
aiBills20232024$SB893$urgency <- FALSE
aiBills20232024$SB893$tax <- FALSE
aiBills20232024$SB893$action <- "From Assembly without further action"
aiBills20232024$SB893$pdf <- "2023SB893_96.pdf"

# AI properties assessed from the text in aiBills20232024$SB893$text
aiBills20232024$SB893$aiDisposition <- "Restrictive"
aiBills20232024$SB893$aiType <- "General"
aiBills20232024$SB893$aiSector <- "Research"
aiBills20232024$SB893$aiSubSector <- "AI Research"
aiBills20232024$SB893$aiDomain <- "AI Research Management"
aiBills20232024$SB893$aiAccountability <- "High"
aiBills20232024$SB893$aiImpact <- "High"
aiBills20232024$SB893$aiEthics <- "High"
aiBills20232024$SB893$aiInnovation <- "Low"
aiBills20232024$SB893$aiPrivacy <- "High"
aiBills20232024$SB893$aiTransparency <- "High"

### SB-1235 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$SB1235$text)

# Topic from aiBills20232024$SB1235$status
aiBills20232024$SB1235$topic <- "SB-1235 Public postsecondary education: Artificial Intelligence and Deepfake Working Group"

# Title from aiBills20232024$SB1235$status
aiBills20232024$SB1235$title <- paste0(aiBills20232024$SB1235$title, "An act to add Chapter 8 (commencing with Section 99500) to Part 65 of Division 14 of Title 3 of the Education Code, relating to public postsecondary education")

# tldr for aiBills20232024$SB1235$text
aiBills20232024$SB1235$tldr <- "SB-1235 establishes an Artificial Intelligence and Deepfake Working Group within the California Community Colleges to address the impact of AI and deepfake technologies on education. The group will develop guidelines for responsible use and recommend policies to ensure ethical practices in educational settings."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$SB1235$tags <- c("artificial-intelligence", "deepfake", "working-group", "education", "guidelines", "ethical-practices", "responsible-use")

# sponsors and cosponsors
aiBills20232024$SB1235$sponsors <- addSponsors("Y20232024", c("GonzalezS"))
aiBills20232024$SB1235$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$SB1235$dateStart <- as.Date("2024-02-15")
aiBills20232024$SB1235$dateEnd <- as.Date("2024-11-30")
aiBills20232024$SB1235$dateUpdated <- Sys.Date()

# measures
aiBills20232024$SB1235$version <- "Amended Senate"
aiBills20232024$SB1235$outcome <- "Failed"
aiBills20232024$SB1235$chaptered <- FALSE
aiBills20232024$SB1235$chapterNo <- NA
aiBills20232024$SB1235$active <- FALSE
aiBills20232024$SB1235$result <- "Died"
aiBills20232024$SB1235$vote <- "Majority"
aiBills20232024$SB1235$appropriation <- FALSE
aiBills20232024$SB1235$fiscal <- TRUE
aiBills20232024$SB1235$local <- FALSE
aiBills20232024$SB1235$urgency <- FALSE
aiBills20232024$SB1235$tax <- FALSE
aiBills20232024$SB1235$action <- "From committee without further action"
aiBills20232024$SB1235$pdf <- "20230SB1235_98.pdf"

# AI properties assessed from the text in aiBills20232024$SB1235$text
aiBills20232024$SB1235$aiDisposition <- "Restrictive"
aiBills20232024$SB1235$aiType <- "General"
aiBills20232024$SB1235$aiSector <- "Education"
aiBills20232024$SB1235$aiSubSector <- "Postsecondary Education"
aiBills20232024$SB1235$aiDomain <- "Education Management"
aiBills20232024$SB1235$aiAccountability <- "High"
aiBills20232024$SB1235$aiImpact <- "High"
aiBills20232024$SB1235$aiEthics <- "High"
aiBills20232024$SB1235$aiInnovation <- "Low"
aiBills20232024$SB1235$aiPrivacy <- "High"
aiBills20232024$SB1235$aiTransparency <- "High"

### SB-896 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$SB896$text)

# Topic from aiBills20232024$SB896$status
aiBills20232024$SB896$topic <- "SB-896 Generative Artificial Intelligence Accountability Act"

# Title from aiBills20232024$SB896$status
aiBills20232024$SB896$title <- paste0(aiBills20232024$SB896$title, "An act to add Chapter 5.9 (commencing with Section 11549.63) to Part 1 of Division 3 of Title 2 of the Government Code, relating to artificial intelligence")

# tldr for aiBills20232024$SB896$text
aiBills20232024$SB896$tldr <- "SB-896 establishes the Generative Artificial Intelligence Accountability Act, requiring companies to disclose the use of generative AI in their products. It mandates transparency in AI-generated content and ensures accountability for the ethical use of AI technologies."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$SB896$tags <- c("artificial-intelligence", "generative-ai", "accountability", "transparency", "ethical-use", "AI-generated-content", "disclosure", "responsible-use")

# sponsors and cosponsors
aiBills20232024$SB896$sponsors <- addSponsors("Y20232024", c("DoddS"))
aiBills20232024$SB896$cosponsors <- addSponsors("Y20232024", c("LowA", "MathisA", "RubioS", "WeberA"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$SB896$dateStart <- as.Date("2024-01-03")
aiBills20232024$SB896$dateEnd <- as.Date("2024-09-29")
aiBills20232024$SB896$dateUpdated <- Sys.Date()

# measures
aiBills20232024$SB896$version <- "Chaptered"
aiBills20232024$SB896$outcome <- "Chaptered"
aiBills20232024$SB896$chaptered <- TRUE
aiBills20232024$SB896$chapterNo <- 928
aiBills20232024$SB896$active <- FALSE
aiBills20232024$SB896$result <- "Chaptered"
aiBills20232024$SB896$vote <- "Majority"
aiBills20232024$SB896$appropriation <- FALSE
aiBills20232024$SB896$fiscal <- TRUE
aiBills20232024$SB896$local <- FALSE
aiBills20232024$SB896$urgency <- FALSE
aiBills20232024$SB896$tax <- FALSE
aiBills20232024$SB896$action <- "Chaptered by Secretary of State - Chapter 928, Statutes of 2024"
aiBills20232024$SB896$pdf <- "20230SB896_92.pdf"

# AI properties assessed from the text in aiBills20232024$SB896$text
aiBills20232024$SB896$aiDisposition <- "Restrictive"
aiBills20232024$SB896$aiType <- "Generative"
aiBills20232024$SB896$aiSector <- "General"
aiBills20232024$SB896$aiSubSector <- "Generative AI"
aiBills20232024$SB896$aiDomain <- "Generative AI Management"
aiBills20232024$SB896$aiAccountability <- "High"
aiBills20232024$SB896$aiImpact <- "High"
aiBills20232024$SB896$aiEthics <- "High"
aiBills20232024$SB896$aiInnovation <- "Low"
aiBills20232024$SB896$aiPrivacy <- "High"
aiBills20232024$SB896$aiTransparency <- "High"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 5. Export and Save Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Remove unnecessary variables
rm(billList)

# Export the dfCalMembers data frame to the data directory as an RData file
save(aiBills20232024, file = file.path(prjDirs$pathData, "aiBills20232024.RData"))

# Export the calMembers list to the data directory as an RData file
save(calMembers, file = file.path(prjDirs$pathData, "calMembers.RData"))

#~~~~~~~~~~~~~~~~~~~
# End of Script ####
#~~~~~~~~~~~~~~~~~~~
