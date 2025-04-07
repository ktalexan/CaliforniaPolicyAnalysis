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

## AB-2652 ####

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

## SB-1288 ####

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

## AB-2013 ####

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

## AB-2811 ####

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

## SB-893 ####

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

## SB-1235 ####

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

## SB-896 ####

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

## SB-313 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$SB313$text)

# Topic from aiBills20232024$SB313$status
aiBills20232024$SB313$topic <- "SB-313 Department of Technology: Office of Artificial Intelligence: state agency public interface: use of AI"

# Title from aiBills20232024$SB313$status
aiBills20232024$SB313$title <- paste0(aiBills20232024$SB313$title, "An act to add Chapter 5.9 (commencing with Section 11549.80) to Part 1 of Division 3 of Title 2 of, the Government Code, relating to state government")

# tldr for aiBills20232024$SB313$text
aiBills20232024$SB313$tldr <- "SB-313 establishes the Office of Artificial Intelligence within the Department of Technology to oversee the use of AI in state agencies. It mandates guidelines for the responsible use of AI technologies in public interfaces, ensuring transparency and accountability in government operations."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$SB313$tags <- c("artificial-intelligence", "state-agency", "public-interface", "responsible-use", "guidelines", "transparency", "accountability")

# sponsors and cosponsors
aiBills20232024$SB313$sponsors <- addSponsors("Y20232024", c("DoddS"))
aiBills20232024$SB313$cosponsors <- addSponsors("Y20232024", c("HurtadoS"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$SB313$dateStart <- as.Date("2023-02-06")
aiBills20232024$SB313$dateEnd <- as.Date("2024-02-01")
aiBills20232024$SB313$dateUpdated <- Sys.Date()

# measures
aiBills20232024$SB313$version <- "Amended Senate"
aiBills20232024$SB313$outcome <- "Failed"
aiBills20232024$SB313$chaptered <- FALSE
aiBills20232024$SB313$chapterNo <- NA
aiBills20232024$SB313$active <- FALSE
aiBills20232024$SB313$result <- "Died"
aiBills20232024$SB313$vote <- "Majority"
aiBills20232024$SB313$appropriation <- FALSE
aiBills20232024$SB313$fiscal <- TRUE
aiBills20232024$SB313$local <- FALSE
aiBills20232024$SB313$urgency <- FALSE
aiBills20232024$SB313$tax <- FALSE
aiBills20232024$SB313$action <- "Returned to Secretary of Senate pursuant to Joint Rule 56"
aiBills20232024$SB313$pdf <- "2023SB313_98.pdf"

# AI properties assessed from the text in aiBills20232024$SB313$text
aiBills20232024$SB313$aiDisposition <- "Restrictive"
aiBills20232024$SB313$aiType <- "Generative"
aiBills20232024$SB313$aiSector <- "Generative AI"
aiBills20232024$SB313$aiSubSector <- "General"
aiBills20232024$SB313$aiDomain <- "Generative AI Management"
aiBills20232024$SB313$aiAccountability <- "High"
aiBills20232024$SB313$aiImpact <- "High"
aiBills20232024$SB313$aiEthics <- "High"
aiBills20232024$SB313$aiInnovation <- "Low"
aiBills20232024$SB313$aiPrivacy <- "High"
aiBills20232024$SB313$aiTransparency <- "High"

## SB-970 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$SB970$text)

# Topic from aiBills20232024$SB970$status
aiBills20232024$SB970$topic <- "SB-970 Artificial intelligence technology"

# Title from aiBills20232024$SB970$status
aiBills20232024$SB970$title <- paste0(aiBills20232024$SB970$title, "An act to add Chapter 22.7 (commencing with Section 22650) to Division 8 of the Business and Professions Code, to amend Section 3344 of the Civil Code, to add Article 2.5 (commencing with Section 1425) to Chapter 1 of Division 11 of the Evidence Code, and to add Chapter 9 (commencing with Section 540) to Title 13 of Part 1 of the Penal Code, relating to artificial intelligence technology")

# tldr for aiBills20232024$SB970$text
aiBills20232024$SB970$tldr <- "SB-970 establishes regulations for the use of artificial intelligence technology in various sectors. It mandates transparency in AI algorithms, ensures accountability for AI-generated content, and sets guidelines for ethical AI practices to protect consumer rights and privacy."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$SB970$tags <- c("artificial-intelligence", "technology", "regulations", "transparency", "accountability", "ethical-practices", "consumer-rights", "privacy")

# sponsors and cosponsors
aiBills20232024$SB970$sponsors <- addSponsors("Y20232024", c("AshbyS"))
aiBills20232024$SB970$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$SB970$dateStart <- as.Date("2024-01-25")
aiBills20232024$SB970$dateEnd <- as.Date("2024-11-30")
aiBills20232024$SB970$dateUpdated <- Sys.Date()

# measures
aiBills20232024$SB970$version <- "Amended Senate"
aiBills20232024$SB970$outcome <- "Failed"
aiBills20232024$SB970$chaptered <- FALSE
aiBills20232024$SB970$chapterNo <- NA
aiBills20232024$SB970$active <- FALSE
aiBills20232024$SB970$result <- "Died"
aiBills20232024$SB970$vote <- "Majority"
aiBills20232024$SB970$appropriation <- FALSE
aiBills20232024$SB970$fiscal <- TRUE
aiBills20232024$SB970$local <- FALSE
aiBills20232024$SB970$urgency <- FALSE
aiBills20232024$SB970$tax <- FALSE
aiBills20232024$SB970$action <- "From committee without further action"
aiBills20232024$SB970$pdf <- "2023SB970_98.pdf"

# AI properties assessed from the text in aiBills20232024$SB970$text
aiBills20232024$SB970$aiDisposition <- "Restrictive"
aiBills20232024$SB970$aiType <- "Generative"
aiBills20232024$SB970$aiSector <- "Generative AI"
aiBills20232024$SB970$aiSubSector <- "General"
aiBills20232024$SB970$aiDomain <- "Generative AI Management"
aiBills20232024$SB970$aiAccountability <- "High"
aiBills20232024$SB970$aiImpact <- "High"
aiBills20232024$SB970$aiEthics <- "High"
aiBills20232024$SB970$aiInnovation <- "Low"
aiBills20232024$SB970$aiPrivacy <- "High"
aiBills20232024$SB970$aiTransparency <- "High"

## AB-3030 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB3030$text)

# Topic from aiBills20232024$AB3030$status
aiBills20232024$AB3030$topic <- "AB-3030 Health care services: artificial intelligence"

# Title from aiBills20232024$AB3030$status
aiBills20232024$AB3030$title <- paste0(aiBills20232024$AB3030$title, "An act to add Chapter 2.13 (commencing with Section 1339.75) to Division 2 of the Health and Safety Code, relating to health care services")

# tldr for aiBills20232024$AB3030$text
aiBills20232024$AB3030$tldr <- "AB-3030 establishes regulations for the use of artificial intelligence in health care services. It mandates transparency in AI algorithms, ensures accountability for AI-generated medical decisions, and sets guidelines for ethical AI practices to protect patient rights and privacy."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB3030$tags <- c("artificial-intelligence", "health-care", "regulations", "transparency", "accountability", "ethical-practices", "patient-rights", "privacy")

# sponsors and cosponsors
aiBills20232024$AB3030$sponsors <- addSponsors("Y20232024", c("CalderonA"))
aiBills20232024$AB3030$cosponsors <- addSponsors("Y20232024", c("RubioS"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB3030$dateStart <- as.Date("2024-02-16")
aiBills20232024$AB3030$dateEnd <- as.Date("2024-09-28")
aiBills20232024$AB3030$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB3030$version <- "Chaptered"
aiBills20232024$AB3030$outcome <- "Chaptered"
aiBills20232024$AB3030$chaptered <- TRUE
aiBills20232024$AB3030$chapterNo <- 848
aiBills20232024$AB3030$active <- FALSE
aiBills20232024$AB3030$result <- "Chaptered"
aiBills20232024$AB3030$vote <- "Majority"
aiBills20232024$AB3030$appropriation <- FALSE
aiBills20232024$AB3030$fiscal <- TRUE
aiBills20232024$AB3030$local <- FALSE
aiBills20232024$AB3030$urgency <- FALSE
aiBills20232024$AB3030$tax <- FALSE
aiBills20232024$AB3030$action <- "Chaptered by Secretary of State - Chapter 848, Statutes of 2024"
aiBills20232024$AB3030$pdf <- "20230AB3030_91.pdf"

# AI properties assessed from the text in aiBills20232024$AB3030$text
aiBills20232024$AB3030$aiDisposition <- "Restrictive"
aiBills20232024$AB3030$aiType <- "Generative"
aiBills20232024$AB3030$aiSector <- "Health Care"
aiBills20232024$AB3030$aiSubSector <- "General"
aiBills20232024$AB3030$aiDomain <- "Health Care Management"
aiBills20232024$AB3030$aiAccountability <- "High"
aiBills20232024$AB3030$aiImpact <- "High"
aiBills20232024$AB3030$aiEthics <- "High"
aiBills20232024$AB3030$aiInnovation <- "Low"
aiBills20232024$AB3030$aiPrivacy <- "High"
aiBills20232024$AB3030$aiTransparency <- "High"

## SB-1229 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$SB1229$text)

# Topic from aiBills20232024$SB1229$status
aiBills20232024$SB1229$topic <- "SB-1229 Insurance disclosures"

# Title from aiBills20232024$SB1229$status
aiBills20232024$SB1229$title <- paste0(aiBills20232024$SB1229$title, "An act to add and repeal Chapter 4 (commencing with Section 12130) to of Part 4 of Division 2 of the Insurance Code, relating to insurance, and declaring the urgency thereof, to take effect immediately")

# tldr for aiBills20232024$SB1229$text
aiBills20232024$SB1229$tldr <- "SB-1229 establishes the requirement for insurance companies to disclose the use of artificial intelligence in their underwriting and claims processes. It mandates transparency in AI algorithms and ensures accountability for AI-generated decisions, protecting consumer rights and privacy."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$SB1229$tags <- c("artificial-intelligence", "insurance", "disclosures", "transparency", "accountability", "consumer-rights", "privacy")

# sponsors and cosponsors
aiBills20232024$SB1229$sponsors <- addSponsors("Y20232024", c("NguyenS"))
aiBills20232024$SB1229$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$SB1229$dateStart <- as.Date("2024-02-15")
aiBills20232024$SB1229$dateEnd <- as.Date("2024-11-30")
aiBills20232024$SB1229$dateUpdated <- Sys.Date()

# measures
aiBills20232024$SB1229$version <- "Amended Senate"
aiBills20232024$SB1229$outcome <- "Failed"
aiBills20232024$SB1229$chaptered <- FALSE
aiBills20232024$SB1229$chapterNo <- NA
aiBills20232024$SB1229$active <- FALSE
aiBills20232024$SB1229$result <- "Died"
aiBills20232024$SB1229$vote <- "Two Thirds"
aiBills20232024$SB1229$appropriation <- FALSE
aiBills20232024$SB1229$fiscal <- TRUE
aiBills20232024$SB1229$local <- FALSE
aiBills20232024$SB1229$urgency <- TRUE
aiBills20232024$SB1229$tax <- FALSE
aiBills20232024$SB1229$action <- "Returned to Secretary of Senate pursuant to Joint Rule 62(a)"
aiBills20232024$SB1229$pdf <- "2023SB1229_98.pdf"

# AI properties assessed from the text in aiBills20232024$SB1229$text
aiBills20232024$SB1229$aiDisposition <- "Restrictive"
aiBills20232024$SB1229$aiType <- "Generative"
aiBills20232024$SB1229$aiSector <- "Insurance"
aiBills20232024$SB1229$aiSubSector <- "General"
aiBills20232024$SB1229$aiDomain <- "Insurance Management"
aiBills20232024$SB1229$aiAccountability <- "High"
aiBills20232024$SB1229$aiImpact <- "High"
aiBills20232024$SB1229$aiEthics <- "High"
aiBills20232024$SB1229$aiInnovation <- "Low"
aiBills20232024$SB1229$aiPrivacy <- "High"
aiBills20232024$SB1229$aiTransparency <- "High"

## SB-1120 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$SB1120$text)

# Topic from aiBills20232024$SB1120$status
aiBills20232024$SB1120$topic <- "SB-1120 Health care coverage: utilization review"

# Title from aiBills20232024$SB1120$status
aiBills20232024$SB1120$title <- paste0(aiBills20232024$SB1120$title, "An act to amend Section 1367.01 of the Health and Safety Code, and to amend Section 10123.135 of the Insurance Code, relating to health care coverage")

# tldr for aiBills20232024$SB1120$text
aiBills20232024$SB1120$tldr <- "SB-1120 establishes the Health Care Coverage Utilization Review Act, regulating the use of artificial intelligence in health care coverage decisions. It mandates transparency in AI algorithms, ensures accountability for AI-generated medical decisions, and sets guidelines for ethical AI practices to protect patient rights and privacy."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$SB1120$tags <- c("artificial-intelligence", "health-care", "coverage", "regulations", "transparency", "accountability", "ethical-practices", "patient-rights", "privacy")

# sponsors and cosponsors
aiBills20232024$SB1120$sponsors <- addSponsors("Y20232024", c("BeckerS"))
aiBills20232024$SB1120$cosponsors <- addSponsors("Y20232024", c("RubioS"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$SB1120$dateStart <- as.Date("2024-02-13")
aiBills20232024$SB1120$dateEnd <- as.Date("2024-09-28")
aiBills20232024$SB1120$dateUpdated <- Sys.Date()

# measures
aiBills20232024$SB1120$version <- "Chaptered"
aiBills20232024$SB1120$outcome <- "Chaptered"
aiBills20232024$SB1120$chaptered <- TRUE
aiBills20232024$SB1120$chapterNo <- 879
aiBills20232024$SB1120$active <- FALSE
aiBills20232024$SB1120$result <- "Chaptered"
aiBills20232024$SB1120$vote <- "Majority"
aiBills20232024$SB1120$appropriation <- FALSE
aiBills20232024$SB1120$fiscal <- TRUE
aiBills20232024$SB1120$local <- TRUE
aiBills20232024$SB1120$urgency <- FALSE
aiBills20232024$SB1120$tax <- FALSE
aiBills20232024$SB1120$action <- "Chaptered by Secretary of State - Chapter 879, Statutes of 2024"
aiBills20232024$SB1120$pdf <- "20230SB1120_90.pdf"

# AI properties assessed from the text in aiBills20232024$SB1120$text
aiBills20232024$SB1120$aiDisposition <- "Restrictive"
aiBills20232024$SB1120$aiType <- "Generative"
aiBills20232024$SB1120$aiSector <- "Health Care"
aiBills20232024$SB1120$aiSubSector <- "General"
aiBills20232024$SB1120$aiDomain <- "Health Care Management"
aiBills20232024$SB1120$aiAccountability <- "High"
aiBills20232024$SB1120$aiImpact <- "High"
aiBills20232024$SB1120$aiEthics <- "High"
aiBills20232024$SB1120$aiInnovation <- "Low"
aiBills20232024$SB1120$aiPrivacy <- "High"
aiBills20232024$SB1120$aiTransparency <- "High"

## SB-398 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$SB398$text)

# Topic from aiBills20232024$SB398$status
aiBills20232024$SB398$topic <- "SB-398 Department of Technology: advanced technology: research"

# Title from aiBills20232024$SB398$status
aiBills20232024$SB398$title <- paste0(aiBills20232024$SB398$title, "An act to add and repeal Section 11549.7 of the Government Code, relating to advanced technology")

# tldr for aiBills20232024$SB398$text
aiBills20232024$SB398$tldr <- "SB-398 establishes the Department of Technology's Advanced Technology Research Program to promote research and development in advanced technologies, including artificial intelligence. It aims to enhance California's technological capabilities and ensure responsible use of AI in government operations."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$SB398$tags <- c("artificial-intelligence", "advanced-technology", "research", "development", "responsible-use", "government-operations")

# sponsors and cosponsors
aiBills20232024$SB398$sponsors <- addSponsors("Y20232024", c("WahabS"))
aiBills20232024$SB398$cosponsors <- addSponsors("Y20232024", c("LimonS"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$SB398$dateStart <- as.Date("2023-02-09")
aiBills20232024$SB398$dateEnd <- as.Date("2024-02-01")
aiBills20232024$SB398$dateUpdated <- Sys.Date()

# measures
aiBills20232024$SB398$version <- "Amended Senate"
aiBills20232024$SB398$outcome <- "Failed"
aiBills20232024$SB398$chaptered <- FALSE
aiBills20232024$SB398$chapterNo <- NA
aiBills20232024$SB398$active <- FALSE
aiBills20232024$SB398$result <- "Died"
aiBills20232024$SB398$vote <- "Majority"
aiBills20232024$SB398$appropriation <- FALSE
aiBills20232024$SB398$fiscal <- TRUE
aiBills20232024$SB398$local <- FALSE
aiBills20232024$SB398$urgency <- FALSE
aiBills20232024$SB398$tax <- FALSE
aiBills20232024$SB398$action <- "Returned to Secretary of Senate pursuant to Joint Rule 56"
aiBills20232024$SB398$pdf <- "2023SB398_97.pdf"

# AI properties assessed from the text in aiBills20232024$SB398$text
aiBills20232024$SB398$aiDisposition <- "Restrictive"
aiBills20232024$SB398$aiType <- "Generative"
aiBills20232024$SB398$aiSector <- "Generative AI"
aiBills20232024$SB398$aiSubSector <- "General"
aiBills20232024$SB398$aiDomain <- "Generative AI Management"
aiBills20232024$SB398$aiAccountability <- "High"
aiBills20232024$SB398$aiImpact <- "High"
aiBills20232024$SB398$aiEthics <- "High"
aiBills20232024$SB398$aiInnovation <- "Low"
aiBills20232024$SB398$aiPrivacy <- "High"
aiBills20232024$SB398$aiTransparency <- "High"

## AB-3058 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB3058$text)

# Topic from aiBills20232024$AB3058$status
aiBills20232024$AB3058$topic <- "AB-3058 California Unconditional Benefit Program: employment replaced by automation or artificial intelligence: pilot program"

# Title from aiBills20232024$AB3058$status
aiBills20232024$AB3058$title <- paste0(aiBills20232024$AB3058$title, "An act to add and repeal Part 5 (commencing with Section 4800) of Division 1 of the Unemployment Insurance Code, relating to benefits")

# tldr for aiBills20232024$AB3058$text
aiBills20232024$AB3058$tldr <- "AB-3058 establishes the California Unconditional Benefit Program to provide support for individuals whose employment is replaced by automation or artificial intelligence. It aims to address the economic impact of AI on the workforce and ensure a safety net for affected workers."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB3058$tags <- c("artificial-intelligence", "unconditional-benefit", "employment", "automation", "pilot-program", "workforce-support", "economic-impact")

# sponsors and cosponsors
aiBills20232024$AB3058$sponsors <- addSponsors("Y20232024", c("LowA"))
aiBills20232024$AB3058$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB3058$dateStart <- as.Date("2024-02-16")
aiBills20232024$AB3058$dateEnd <- as.Date("2024-11-30")
aiBills20232024$AB3058$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB3058$version <- "Amended Assembly"
aiBills20232024$AB3058$outcome <- "Failed"
aiBills20232024$AB3058$chaptered <- FALSE
aiBills20232024$AB3058$chapterNo <- NA
aiBills20232024$AB3058$active <- FALSE
aiBills20232024$AB3058$result <- "Died"
aiBills20232024$AB3058$vote <- "Majority"
aiBills20232024$AB3058$appropriation <- FALSE
aiBills20232024$AB3058$fiscal <- TRUE
aiBills20232024$AB3058$local <- FALSE
aiBills20232024$AB3058$urgency <- FALSE
aiBills20232024$AB3058$tax <- FALSE
aiBills20232024$AB3058$action <- "From committee without further action"
aiBills20232024$AB3058$pdf <- "20230AB3058_98.pdf"

# AI properties assessed from the text in aiBills20232024$AB3058$text
aiBills20232024$AB3058$aiDisposition <- "Neutral"
aiBills20232024$AB3058$aiType <- "Generative"
aiBills20232024$AB3058$aiSector <- "Automation"
aiBills20232024$AB3058$aiSubSector <- "General"
aiBills20232024$AB3058$aiDomain <- "Automation Management"
aiBills20232024$AB3058$aiAccountability <- "Low"
aiBills20232024$AB3058$aiImpact <- "Low"
aiBills20232024$AB3058$aiEthics <- "Low"
aiBills20232024$AB3058$aiInnovation <- "High"
aiBills20232024$AB3058$aiPrivacy <- "Low"
aiBills20232024$AB3058$aiTransparency <- "Low"

## SB-1047 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$SB1047$text)

# Topic from aiBills20232024$SB1047$status
aiBills20232024$SB1047$topic <- "SB-1047 Safe and Secure Innovation for Frontier Artificial Intelligence Models Act"

# Title from aiBills20232024$SB1047$status
aiBills20232024$SB1047$title <- paste0(aiBills20232024$SB1047$title, "An act to add Chapter 22.6 (commencing with Section 22602) to Division 8 of the Business and Professions Code, and to add Sections 11547.6 and 11547.6.1 to the Government Code, relating to artificial intelligence")

# tldr for aiBills20232024$SB1047$text
aiBills20232024$SB1047$tldr <- "SB-1047 establishes the Safe and Secure Innovation for Frontier Artificial Intelligence Models Act, regulating the development and deployment of frontier AI models. It mandates safety assessments, transparency in AI algorithms, and accountability for AI-generated content to ensure responsible use of advanced AI technologies."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$SB1047$tags <- c("artificial-intelligence", "frontier-ai", "regulations", "safety-assessments", "transparency", "accountability", "advanced-ai", "responsible-use")

# sponsors and cosponsors
aiBills20232024$SB1047$sponsors <- addSponsors("Y20232024", c("WienerS"))
aiBills20232024$SB1047$cosponsors <- addSponsors("Y20232024", c("RothS", "RubioS", "SternS"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$SB1047$dateStart <- as.Date("2024-02-07")
aiBills20232024$SB1047$dateEnd <- as.Date("2024-11-30")
aiBills20232024$SB1047$dateUpdated <- Sys.Date()

# measures
aiBills20232024$SB1047$version <- "Enrolled"
aiBills20232024$SB1047$outcome <- "Failed"
aiBills20232024$SB1047$chaptered <- FALSE
aiBills20232024$SB1047$chapterNo <- NA
aiBills20232024$SB1047$active <- TRUE
aiBills20232024$SB1047$result <- "In Floor Process"
aiBills20232024$SB1047$vote <- "Majority"
aiBills20232024$SB1047$appropriation <- FALSE
aiBills20232024$SB1047$fiscal <- TRUE
aiBills20232024$SB1047$local <- FALSE
aiBills20232024$SB1047$urgency <- FALSE
aiBills20232024$SB1047$tax <- FALSE
aiBills20232024$SB1047$action <- "Last day to consider Governor's veto pursuant to Joint Rule 58.5"
aiBills20232024$SB1047$pdf <- "20230SB1047_88.pdf"

# AI properties assessed from the text in aiBills20232024$SB1047$text
aiBills20232024$SB1047$aiDisposition <- "Restrictive"
aiBills20232024$SB1047$aiType <- "Generative"
aiBills20232024$SB1047$aiSector <- "Safety and Security"
aiBills20232024$SB1047$aiSubSector <- "Algorithm Safety"
aiBills20232024$SB1047$aiDomain <- "Safety and Security Management"
aiBills20232024$SB1047$aiAccountability <- "High"
aiBills20232024$SB1047$aiImpact <- "High"
aiBills20232024$SB1047$aiEthics <- "High"
aiBills20232024$SB1047$aiInnovation <- "Low"
aiBills20232024$SB1047$aiPrivacy <- "High"
aiBills20232024$SB1047$aiTransparency <- "High"

## AB-3204 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB3204$text)

# Topic from aiBills20232024$AB3204$status
aiBills20232024$AB3204$topic <- "AB-3204 Data Digesters Registration Act"

# Title from aiBills20232024$AB3204$status
aiBills20232024$AB3204$title <- paste0(aiBills20232024$AB3204$title, "An act to add Title 1.81.8 (commencing with Section 1798.321) to Part 4 of Division 3 of the Civil Code, relating to data digesters")

# tldr for aiBills20232024$AB3204$text
aiBills20232024$AB3204$tldr <- "AB-3204 establishes the Data Digesters Registration Act, requiring companies that use data digesters to register with the state. It mandates transparency in data collection practices, ensures accountability for data usage, and sets guidelines for ethical data management to protect consumer rights and privacy."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB3204$tags <- c("data-digester", "registration", "data-collection", "transparency", "accountability", "ethical-data-management", "consumer-rights", "privacy")

# sponsors and cosponsors
aiBills20232024$AB3204$sponsors <- addSponsors("Y20232024", c("BauerKahanA"))
aiBills20232024$AB3204$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB3204$dateStart <- as.Date("2024-02-16")
aiBills20232024$AB3204$dateEnd <- as.Date("2024-11-30")
aiBills20232024$AB3204$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB3204$version <- "Amended Assembly"
aiBills20232024$AB3204$outcome <- "Failed"
aiBills20232024$AB3204$chaptered <- FALSE
aiBills20232024$AB3204$chapterNo <- NA
aiBills20232024$AB3204$active <- FALSE
aiBills20232024$AB3204$result <- "Died"
aiBills20232024$AB3204$vote <- "Majority"
aiBills20232024$AB3204$appropriation <- FALSE
aiBills20232024$AB3204$fiscal <- TRUE
aiBills20232024$AB3204$local <- FALSE
aiBills20232024$AB3204$urgency <- FALSE
aiBills20232024$AB3204$tax <- FALSE
aiBills20232024$AB3204$action <- "From committee without further action"
aiBills20232024$AB3204$pdf <- "20230AB3204_98.pdf"

# AI properties assessed from the text in aiBills20232024$AB3204$text
aiBills20232024$AB3204$aiDisposition <- "Restrictive"
aiBills20232024$AB3204$aiType <- "Generative"
aiBills20232024$AB3204$aiSector <- "Data Management"
aiBills20232024$AB3204$aiSubSector <- "General"
aiBills20232024$AB3204$aiDomain <- "Data Management"
aiBills20232024$AB3204$aiAccountability <- "High"
aiBills20232024$AB3204$aiImpact <- "High"
aiBills20232024$AB3204$aiEthics <- "High"
aiBills20232024$AB3204$aiInnovation <- "Low"
aiBills20232024$AB3204$aiPrivacy <- "High"
aiBills20232024$AB3204$aiTransparency <- "High"

## AB-2876 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB2876$text)

# Topic from aiBills20232024$AB2876$status
aiBills20232024$AB2876$topic <- "AB-2876 Pupil instruction: media literacy: artificial intelligence literacy: curriculum frameworks: instructional materials"

# Title from aiBills20232024$AB2876$status
aiBills20232024$AB2876$title <- paste0(aiBills20232024$AB2876$title, "An act to amend Section 33548 of the Education Code, relating to pupil instruction")

# tldr for aiBills20232024$AB2876$text
aiBills20232024$AB2876$tldr <- "AB-2876 establishes the requirement for media literacy and artificial intelligence literacy in pupil instruction. It mandates the development of curriculum frameworks and instructional materials to educate students about the responsible use of AI technologies."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB2876$tags <- c("artificial-intelligence", "media-literacy", "curriculum-frameworks", "instructional-materials", "pupil-instruction", "education")

# sponsors and cosponsors
aiBills20232024$AB2876$sponsors <- addSponsors("Y20232024", c("BermanA"))
aiBills20232024$AB2876$cosponsors <- addSponsors("Y20232024", c("AddisA"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB2876$dateStart <- as.Date("2024-02-15")
aiBills20232024$AB2876$dateEnd <- as.Date("2024-09-29")
aiBills20232024$AB2876$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB2876$version <- "Chaptered"
aiBills20232024$AB2876$outcome <- "Chaptered"
aiBills20232024$AB2876$chaptered <- TRUE
aiBills20232024$AB2876$chapterNo <- 927
aiBills20232024$AB2876$active <- FALSE
aiBills20232024$AB2876$result <- "Chaptered"
aiBills20232024$AB2876$vote <- "Majority"
aiBills20232024$AB2876$appropriation <- FALSE
aiBills20232024$AB2876$fiscal <- TRUE
aiBills20232024$AB2876$local <- FALSE
aiBills20232024$AB2876$urgency <- FALSE
aiBills20232024$AB2876$tax <- FALSE
aiBills20232024$AB2876$action <- "Chaptered by Secretary of State - Chapter 927, Statutes of 2024"
aiBills20232024$AB2876$pdf <- "20230AB2876_95.pdf"

# AI properties assessed from the text in aiBills20232024$AB2876$text
aiBills20232024$AB2876$aiDisposition <- "Restrictive"
aiBills20232024$AB2876$aiType <- "Generative"
aiBills20232024$AB2876$aiSector <- "Education"
aiBills20232024$AB2876$aiSubSector <- "General"
aiBills20232024$AB2876$aiDomain <- "Education Management"
aiBills20232024$AB2876$aiAccountability <- "High"
aiBills20232024$AB2876$aiImpact <- "High"
aiBills20232024$AB2876$aiEthics <- "High"
aiBills20232024$AB2876$aiInnovation <- "Low"
aiBills20232024$AB2876$aiPrivacy <- "High"
aiBills20232024$AB2876$aiTransparency <- "High"

## AB-2885 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB2885$text)

# Topic from aiBills20232024$AB2885$status
aiBills20232024$AB2885$topic <- "AB-2885 Artificial intelligence"

# Title from aiBills20232024$AB2885$status
aiBills20232024$AB2885$title <- paste0(aiBills20232024$AB2885$title, "An act to amend Section 22675 of the Business and Professions Code, to amend Section 75002 of the Education Code, and to amend Sections 11546.45.5, 11547.5, and 53083.1 of the Government Code, relating to artificial intelligence")

# tldr for aiBills20232024$AB2885$text
aiBills20232024$AB2885$tldr <- "AB-2885 establishes regulations for the use of artificial intelligence in various sectors, including education and government. It mandates transparency in AI algorithms, ensures accountability for AI-generated decisions, and sets guidelines for ethical AI practices to protect consumer rights and privacy."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB2885$tags <- c("artificial-intelligence", "ai-education", "regulations", "transparency", "accountability", "ethical-practices", "consumer-rights", "privacy")

# sponsors and cosponsors
aiBills20232024$AB2885$sponsors <- addSponsors("Y20232024", c("BauerKahanA"))
aiBills20232024$AB2885$cosponsors <- addSponsors("Y20232024", c("UmbergA"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB2885$dateStart <- as.Date("2024-02-15")
aiBills20232024$AB2885$dateEnd <- as.Date("2024-09-28")
aiBills20232024$AB2885$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB2885$version <- "Chaptered"
aiBills20232024$AB2885$outcome <- "Chaptered"
aiBills20232024$AB2885$chaptered <- TRUE
aiBills20232024$AB2885$chapterNo <- 843
aiBills20232024$AB2885$active <- FALSE
aiBills20232024$AB2885$result <- "Chaptered"
aiBills20232024$AB2885$vote <- "Majority"
aiBills20232024$AB2885$appropriation <- FALSE
aiBills20232024$AB2885$fiscal <- TRUE
aiBills20232024$AB2885$local <- FALSE
aiBills20232024$AB2885$urgency <- FALSE
aiBills20232024$AB2885$tax <- FALSE
aiBills20232024$AB2885$action <- "Chaptered by Secretary of State - Chapter 843, Statutes of 2024"
aiBills20232024$AB2885$pdf <- "20230AB2885_93.pdf"

# AI properties assessed from the text in aiBills20232024$AB2885$text
aiBills20232024$AB2885$aiDisposition <- "Restrictive"
aiBills20232024$AB2885$aiType <- "Generative"
aiBills20232024$AB2885$aiSector <- "Decision Making"
aiBills20232024$AB2885$aiSubSector <- "General"
aiBills20232024$AB2885$aiDomain <- "Decision Making Management"
aiBills20232024$AB2885$aiAccountability <- "High"
aiBills20232024$AB2885$aiImpact <- "High"
aiBills20232024$AB2885$aiEthics <- "High"
aiBills20232024$AB2885$aiInnovation <- "Low"
aiBills20232024$AB2885$aiPrivacy <- "High"
aiBills20232024$AB2885$aiTransparency <- "High"

## AB-3095 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB3095$text)

# Topic from aiBills20232024$AB3095$status
aiBills20232024$AB3095$topic <- "AB-3095 Artificial intelligence"

# Title from aiBills20232024$AB3095$status
aiBills20232024$AB3095$title <- paste0(aiBills20232024$AB3095$title, "An act relating to technology")

# tldr for aiBills20232024$AB3095$text
aiBills20232024$AB3095$tldr <- "AB-3095 establishes regulations for the use of artificial intelligence in various sectors. It mandates transparency in AI algorithms, ensures accountability for AI-generated decisions, and sets guidelines for ethical AI practices to protect consumer rights and privacy."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB3095$tags <- c("artificial-intelligence", "technology", "regulations", "transparency", "accountability", "ethical-practices", "consumer-rights", "privacy")

# sponsors and cosponsors
aiBills20232024$AB3095$sponsors <- addSponsors("Y20232024", c("WaldronA"))
aiBills20232024$AB3095$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB3095$dateStart <- as.Date("2024-02-16")
aiBills20232024$AB3095$dateEnd <- as.Date("2024-11-30")
aiBills20232024$AB3095$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB3095$version <- "Introduced"
aiBills20232024$AB3095$outcome <- "Failed"
aiBills20232024$AB3095$chaptered <- FALSE
aiBills20232024$AB3095$chapterNo <- NA
aiBills20232024$AB3095$active <- FALSE
aiBills20232024$AB3095$result <- "Died"
aiBills20232024$AB3095$vote <- "Majority"
aiBills20232024$AB3095$appropriation <- FALSE
aiBills20232024$AB3095$fiscal <- FALSE
aiBills20232024$AB3095$local <- FALSE
aiBills20232024$AB3095$urgency <- FALSE
aiBills20232024$AB3095$tax <- FALSE
aiBills20232024$AB3095$action <- "Died at Desk"
aiBills20232024$AB3095$pdf <- "20230AB3095_99.pdf"

# AI properties assessed from the text in aiBills20232024$AB3095$text
aiBills20232024$AB3095$aiDisposition <- "Neutral"
aiBills20232024$AB3095$aiType <- "Generative"
aiBills20232024$AB3095$aiSector <- "Generative AI"
aiBills20232024$AB3095$aiSubSector <- "General"
aiBills20232024$AB3095$aiDomain <- "Generative AI Management"
aiBills20232024$AB3095$aiAccountability <- "Low"
aiBills20232024$AB3095$aiImpact <- "Low"
aiBills20232024$AB3095$aiEthics <- "Low"
aiBills20232024$AB3095$aiInnovation <- "High"
aiBills20232024$AB3095$aiPrivacy <- "Low"
aiBills20232024$AB3095$aiTransparency <- "Low"

## AB-1831 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB1831$text)

# Topic from aiBills20232024$AB1831$status
aiBills20232024$AB1831$topic <- "AB-1831 Crimes: child pornography"

# Title from aiBills20232024$AB1831$status
aiBills20232024$AB1831$title <- paste0(aiBills20232024$AB1831$title, "An act to amend Sections 311, 311.2, 311.11, and 311.12 of the Penal Code, relating to crimes")


# tldr for aiBills20232024$AB1831$text
aiBills20232024$AB1831$tldr <- "AB-1831 aims to strengthen laws against child pornography, enhancing penalties and enforcement measures to protect children."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB1831$tags <- c("artificial-intelligence", "crimes", "child-pornography", "laws", "penalties", "enforcement", "protection")

# sponsors and cosponsors
aiBills20232024$AB1831$sponsors <- addSponsors("Y20232024", c("BermanA", "SanchezA"))
aiBills20232024$AB1831$cosponsors <- addSponsors("Y20232024", c("WahabS", "AlanisA", "AllenS", "ArchuletaS", "BeckerS", "BennettA", "CalderonA", "ChenA", "DixonA", "FloraA", "GraysonA", "IrwinA", "LackeyA", "LimonS", "LowA", "NguyenS", "BoghS", "PattersonJimA", "PellerinA", "PetrieNorrisA", "PortantinoS", "RubioS", "SchiavoA", "SternS", "TaA", "WeberA", "WilsonA", "WoodA"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB1831$dateStart <- as.Date("2024-01-12")
aiBills20232024$AB1831$dateEnd <- as.Date("2024-09-29")
aiBills20232024$AB1831$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB1831$version <- "Chaptered"
aiBills20232024$AB1831$outcome <- "Chaptered"
aiBills20232024$AB1831$chaptered <- TRUE
aiBills20232024$AB1831$chapterNo <- 926
aiBills20232024$AB1831$active <- FALSE
aiBills20232024$AB1831$result <- "Chaptered"
aiBills20232024$AB1831$vote <- "Majority"
aiBills20232024$AB1831$appropriation <- FALSE
aiBills20232024$AB1831$fiscal <- TRUE
aiBills20232024$AB1831$local <- TRUE
aiBills20232024$AB1831$urgency <- FALSE
aiBills20232024$AB1831$tax <- FALSE
aiBills20232024$AB1831$action <- "Chaptered by Secretary of State - Chapter 926, Statutes of 2024"
aiBills20232024$AB1831$pdf <- "20230AB1831_91.pdf"

# AI properties assessed from the text in aiBills20232024$AB1831$text
aiBills20232024$AB1831$aiDisposition <- "Restrictive"
aiBills20232024$AB1831$aiType <- "Pornography"
aiBills20232024$AB1831$aiSector <- "Child Protection"
aiBills20232024$AB1831$aiSubSector <- "General"
aiBills20232024$AB1831$aiDomain <- "Child Protection Management"
aiBills20232024$AB1831$aiAccountability <- "High"
aiBills20232024$AB1831$aiImpact <- "High"
aiBills20232024$AB1831$aiEthics <- "High"
aiBills20232024$AB1831$aiInnovation <- "Low"
aiBills20232024$AB1831$aiPrivacy <- "High"
aiBills20232024$AB1831$aiTransparency <- "High"





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
