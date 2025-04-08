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

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 3. Populate AI Bill Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Define the list to store the AI bills data for 2023-2024
aiBills20232024 <- list()

## AB-2652 ####

aiBills20232024$AB2652 <- addBillStructure(2023, "AB-2652")

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

aiBills20232024$SB1288 <- addBillStructure(2023, "SB-1288")

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

aiBills20232024$AB2013 <- addBillStructure(2023, "AB-2013")

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

aiBills20232024$AB2811 <- addBillStructure(2023, "AB-2811")

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

aiBills20232024$SB893 <- addBillStructure(2023, "SB-893")

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

aiBills20232024$SB1235 <- addBillStructure(2023, "SB-1235")

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

aiBills20232024$SB896 <- addBillStructure(2023, "SB-896")

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

aiBills20232024$SB313 <- addBillStructure(2023, "SB-313")

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

aiBills20232024$SB970 <- addBillStructure(2023, "SB-970")

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

aiBills20232024$AB3030 <- addBillStructure(2023, "AB-3030")

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

aiBills20232024$SB1229 <- addBillStructure(2023, "SB-1229")

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

aiBills20232024$SB1120 <- addBillStructure(2023, "SB-1120")

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

aiBills20232024$SB398 <- addBillStructure(2023, "SB-398")

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

aiBills20232024$AB3058 <- addBillStructure(2023, "AB-3058")

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

aiBills20232024$SB1047 <- addBillStructure(2023, "SB-1047")

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

aiBills20232024$AB3204 <- addBillStructure(2023, "AB-3204")

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

aiBills20232024$AB2876 <- addBillStructure(2023, "AB-2876")

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

aiBills20232024$AB2885 <- addBillStructure(2023, "AB-2885")

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

aiBills20232024$AB3095 <- addBillStructure(2023, "AB-3095")

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

aiBills20232024$AB1831 <- addBillStructure(2023, "AB-1831")

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

## SB-942 ####

aiBills20232024$SB942 <- addBillStructure(2023, "SB-942")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$SB942$text)

# Topic from aiBills20232024$SB942$status
aiBills20232024$SB942$topic <- "SB-942 California AI Transparency Act"

# Title from aiBills20232024$SB942$status
aiBills20232024$SB942$title <- paste0(aiBills20232024$SB942$title, "An act to add Chapter 25 (commencing with Section 22757) to Division 8 of the Business and Professions Code, relating to consumer protection")

# tldr for aiBills20232024$SB942$text
aiBills20232024$SB942$tldr <- "SB-942 aims to enhance consumer protection through transparency in AI systems, ensuring accountability and ethical use of artificial intelligence."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$SB942$tags <- c("artificial-intelligence", "transparency", "consumer-protection", "accountability", "ethical-use")

# sponsors and cosponsors
aiBills20232024$SB942$sponsors <- addSponsors("Y20232024", c("BeckerS"))
aiBills20232024$SB942$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$SB942$dateStart <- as.Date("2024-01-17")
aiBills20232024$SB942$dateEnd <- as.Date("2024-09-19")
aiBills20232024$SB942$dateUpdated <- Sys.Date()

# measures
aiBills20232024$SB942$version <- "Chaptered"
aiBills20232024$SB942$outcome <- "Chaptered"
aiBills20232024$SB942$chaptered <- TRUE
aiBills20232024$SB942$chapterNo <- 291
aiBills20232024$SB942$active <- FALSE
aiBills20232024$SB942$result <- "Chaptered"
aiBills20232024$SB942$vote <- "Majority"
aiBills20232024$SB942$appropriation <- FALSE
aiBills20232024$SB942$fiscal <- TRUE
aiBills20232024$SB942$local <- FALSE
aiBills20232024$SB942$urgency <- FALSE
aiBills20232024$SB942$tax <- FALSE
aiBills20232024$SB942$action <- "Chaptered by Secretary of State - Chapter 291, Statutes of 2024"
aiBills20232024$SB942$pdf <- "20230SB942_91.pdf"

# AI properties assessed from the text in aiBills20232024$SB942$text
aiBills20232024$SB942$aiDisposition <- "Restrictive"
aiBills20232024$SB942$aiType <- "Generative"
aiBills20232024$SB942$aiSector <- "Consumer Protection"
aiBills20232024$SB942$aiSubSector <- "General"
aiBills20232024$SB942$aiDomain <- "Consumer Protection Management"
aiBills20232024$SB942$aiAccountability <- "High"
aiBills20232024$SB942$aiImpact <- "High"
aiBills20232024$SB942$aiEthics <- "High"
aiBills20232024$SB942$aiInnovation <- "Low"
aiBills20232024$SB942$aiPrivacy <- "High"
aiBills20232024$SB942$aiTransparency <- "High"

## ACR-96 ####

aiBills20232024$ACR96 <- addBillStructure(2023, "ACR-96")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$ACR96$text)

# Topic from aiBills20232024$ACR96$status
aiBills20232024$ACR96$topic <- "ACR-96 23 Asilomar AI Principles"

# Title from aiBills20232024$ACR96$status
aiBills20232024$ACR96$title <- paste0(aiBills20232024$ACR96$title, "Relative to the 23 Asilomar AI Principles")

# tldr for aiBills20232024$ACR96$text
aiBills20232024$ACR96$tldr <- "ACR-96 establishes the principles for the ethical development and use of AI technologies, emphasizing safety, transparency, and accountability."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$ACR96$tags <- c("artificial-intelligence", "asilomar-ai-principles", "ethical-development", "safety", "transparency", "accountability")

# sponsors and cosponsors
aiBills20232024$ACR96$sponsors <- addSponsors("Y20232024", c("HooverA"))
aiBills20232024$ACR96$cosponsors <- addSponsors("Y20232024", c("AddisA", "AlanisA", "AlvarezA", "ArambulaA", "BainsA", "BauerKahanA", "BennettA", "BermanA", "BoernerA", "BryanA", "CalderonA", "CarrilloJA", "CarrilloWA", "CervantesA", "ChenA", "ConnollyA", "DahleA", "DaviesA", "DixonA", "EssayliA", "FloraA", "FongMA", "FongVA", "FriedmanA", "GabrielA", "GallagherA", "GipsonA", "GraysonA", "HaneyA", "HartA", "HoldenA", "IrwinA", "JacksonA", "JonesSawyerA", "LackeyA", "LowA", "LowenthalA", "MaienscheinA", "MathisA", "OrtegaA", "PachecoA", "PapanA", "PattersonJimA", "PattersonJoeA", "PellerinA", "PetrieNorrisA", "QuirkSilvaA", "RendonA", "ReyesA","RivasLA","RivasRA","RodriguezA","RubioA","SanchezA","SantiagoA","SchiavoA","SoriaA","TaA","TingA","ValenciaA","VillapuduaA","WaldronA","WallisA","WardA","WeberA","WicksA","WilsonA","WoodA","ZburA"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$ACR96$dateStart <- as.Date("2023-06-12")
aiBills20232024$ACR96$dateEnd <- as.Date("2024-11-30")
aiBills20232024$ACR96$dateUpdated <- Sys.Date()

# measures
aiBills20232024$ACR96$version <- "Introduced"
aiBills20232024$ACR96$outcome <- "Failed"
aiBills20232024$ACR96$chaptered <- FALSE
aiBills20232024$ACR96$chapterNo <- NA
aiBills20232024$ACR96$active <- FALSE
aiBills20232024$ACR96$result <- "Died"
aiBills20232024$ACR96$vote <- "No Vote"
aiBills20232024$ACR96$appropriation <- FALSE
aiBills20232024$ACR96$fiscal <- FALSE
aiBills20232024$ACR96$local <- FALSE
aiBills20232024$ACR96$urgency <- FALSE
aiBills20232024$ACR96$tax <- FALSE
aiBills20232024$ACR96$action <- "From Senate committee without further action"
aiBills20232024$ACR96$pdf <- "20230ACR96_99.pdf"

# AI properties assessed from the text in aiBills20232024$ACR96$text
aiBills20232024$ACR96$aiDisposition <- "Neutral"
aiBills20232024$ACR96$aiType <- "Generative"
aiBills20232024$ACR96$aiSector <- "Generative AI"
aiBills20232024$ACR96$aiSubSector <- "General"
aiBills20232024$ACR96$aiDomain <- "Generative AI Management"
aiBills20232024$ACR96$aiAccountability <- "Low"
aiBills20232024$ACR96$aiImpact <- "Low"
aiBills20232024$ACR96$aiEthics <- "Low"
aiBills20232024$ACR96$aiInnovation <- "High"
aiBills20232024$ACR96$aiPrivacy <- "Low"
aiBills20232024$ACR96$aiTransparency <- "Low"

## SB-933 ####

aiBills20232024$SB933 <- addBillStructure(2023, "SB-933")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$SB933$text)

# Topic from aiBills20232024$SB933$status
aiBills20232024$SB933$topic <- "SB-933 Crimes: child pornography"

# Title from aiBills20232024$SB933$status
aiBills20232024$SB933$title <- paste0(aiBills20232024$SB933$title, "An act to amend Sections 311, 311.1, 311.2, 311.3, 311.4, 311.11, and 312.3 of, and to add Section 13012.9 to, the Penal Code, relating to crimes")

# tldr for aiBills20232024$SB933$text
aiBills20232024$SB933$tldr <- "SB-933 aims to amend various sections of the Penal Code to enhance the legal framework surrounding crimes related to child pornography."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$SB933$tags <- c("artificial-intelligence", "crimes", "child-pornography", "penal-code", "legal-framework", "enhancement")

# sponsors and cosponsors
aiBills20232024$SB933$sponsors <- addSponsors("Y20232024", c("WahabS", "BoghS"))
aiBills20232024$SB933$cosponsors <- addSponsors("Y20232024", c("BermanA", "BradfordS", "CorteseS", "DixonA", "GroveS", "JonesS", "NguyenA", "RubioS", "SchiavoA", "SeyartoS", "SkinnerS"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$SB933$dateStart <- as.Date("2024-01-16")
aiBills20232024$SB933$dateEnd <- as.Date("2024-11-30")
aiBills20232024$SB933$dateUpdated <- Sys.Date()

# measures
aiBills20232024$SB933$version <- "Amended Assembly"
aiBills20232024$SB933$outcome <- "Failed"
aiBills20232024$SB933$chaptered <- FALSE
aiBills20232024$SB933$chapterNo <- NA
aiBills20232024$SB933$active <- FALSE
aiBills20232024$SB933$result <- "Died"
aiBills20232024$SB933$vote <- "Majority"
aiBills20232024$SB933$appropriation <- FALSE
aiBills20232024$SB933$fiscal <- TRUE
aiBills20232024$SB933$local <- TRUE
aiBills20232024$SB933$urgency <- FALSE
aiBills20232024$SB933$tax <- FALSE
aiBills20232024$SB933$action <- "From Assembly without further action"
aiBills20232024$SB933$pdf <- "20230SB933_98.pdf"

# AI properties assessed from the text in aiBills20232024$SB933$text
aiBills20232024$SB933$aiDisposition <- "Restrictive"
aiBills20232024$SB933$aiType <- "Pornography"
aiBills20232024$SB933$aiSector <- "Child Protection"
aiBills20232024$SB933$aiSubSector <- "General"
aiBills20232024$SB933$aiDomain <- "Child Protection Management"
aiBills20232024$SB933$aiAccountability <- "High"
aiBills20232024$SB933$aiImpact <- "High"
aiBills20232024$SB933$aiEthics <- "High"
aiBills20232024$SB933$aiInnovation <- "Low"
aiBills20232024$SB933$aiPrivacy <- "High"
aiBills20232024$SB933$aiTransparency <- "High"

## SB-892 ####

aiBills20232024$SB892 <- addBillStructure(2023, "SB-892")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$SB892$text)

# Topic from aiBills20232024$SB892$status
aiBills20232024$SB892$topic <- "SB-892 Public contracts: automated decision systems: procurement standards"

# Title from aiBills20232024$SB892$status
aiBills20232024$SB892$title <- paste0(aiBills20232024$SB892$title, "An act to add Section 12100.1 to the Public Contract Code, relating to public contracts")

# tldr for aiBills20232024$SB892$text
aiBills20232024$SB892$tldr <- "SB-892 establishes procurement standards for public contracts involving automated decision systems, ensuring transparency and accountability in their use."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$SB892$tags <- c("artificial-intelligence", "public-contracts", "automated-decision-systems", "procurement-standards", "transparency", "accountability")

# sponsors and cosponsors
aiBills20232024$SB892$sponsors <- addSponsors("Y20232024", c("PadillaS"))
aiBills20232024$SB892$cosponsors <- addSponsors("Y20232024", c("RubioS", "SmallwoodCuevasS"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$SB892$dateStart <- as.Date("2024-01-03")
aiBills20232024$SB892$dateEnd <- as.Date("2024-11-30")
aiBills20232024$SB892$dateUpdated <- Sys.Date()

# measures
aiBills20232024$SB892$version <- "Enrolled"
aiBills20232024$SB892$outcome <- "Failed"
aiBills20232024$SB892$chaptered <- FALSE
aiBills20232024$SB892$chapterNo <- NA
aiBills20232024$SB892$active <- TRUE
aiBills20232024$SB892$result <- "In Floor Process"
aiBills20232024$SB892$vote <- "Majority"
aiBills20232024$SB892$appropriation <- FALSE
aiBills20232024$SB892$fiscal <- TRUE
aiBills20232024$SB892$local <- FALSE
aiBills20232024$SB892$urgency <- FALSE
aiBills20232024$SB892$tax <- FALSE
aiBills20232024$SB892$action <- "Last day to consider Governor's veto pursuant to Joint Rule 58.5"
aiBills20232024$SB892$pdf <- "20230SB892_93.pdf"

# AI properties assessed from the text in aiBills20232024$SB892$text
aiBills20232024$SB892$aiDisposition <- "Restrictive"
aiBills20232024$SB892$aiType <- "Generative"
aiBills20232024$SB892$aiSector <- "Public Sector"
aiBills20232024$SB892$aiSubSector <- "General"
aiBills20232024$SB892$aiDomain <- "Public Sector Management"
aiBills20232024$SB892$aiAccountability <- "High"
aiBills20232024$SB892$aiImpact <- "High"
aiBills20232024$SB892$aiEthics <- "High"
aiBills20232024$SB892$aiInnovation <- "Low"
aiBills20232024$SB892$aiPrivacy <- "High"
aiBills20232024$SB892$aiTransparency <- "High"

## AB-2355 ####

aiBills20232024$AB2355 <- addBillStructure(2023, "AB-2355")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB2355$text)

# Topic from aiBills20232024$AB2355$status
aiBills20232024$AB2355$topic <- "AB-2355 Political Reform Act of 1974: political advertisements: artificial intelligence"

# Title from aiBills20232024$AB2355$status
aiBills20232024$AB2355$title <- paste0(aiBills20232024$AB2355$title, "An act to amend Sections 84504, 84504.1, 84504.2, 84504.3, 84054.4, and 84504.5 of, and to add Section 84514 to, the Government Code, relating to the Political Reform Act of 1974")

# tldr for aiBills20232024$AB2355$text
aiBills20232024$AB2355$tldr <- "AB-2355 amends the Political Reform Act of 1974 to include regulations on political advertisements that utilize artificial intelligence, ensuring transparency and accountability in their use."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB2355$tags <- c("artificial-intelligence", "political-reform-act", "political-advertisements", "regulations", "transparency", "accountability")

# sponsors and cosponsors
aiBills20232024$AB2355$sponsors <- addSponsors("Y20232024", c("CarrilloWA", "CervantesA"))
aiBills20232024$AB2355$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB2355$dateStart <- as.Date("2024-02-12")
aiBills20232024$AB2355$dateEnd <- as.Date("2024-09-17")
aiBills20232024$AB2355$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB2355$version <- "Chaptered"
aiBills20232024$AB2355$outcome <- "Chaptered"
aiBills20232024$AB2355$chaptered <- TRUE
aiBills20232024$AB2355$chapterNo <- 260
aiBills20232024$AB2355$active <- FALSE
aiBills20232024$AB2355$result <- "Chaptered"
aiBills20232024$AB2355$vote <- "Two Thirds"
aiBills20232024$AB2355$appropriation <- FALSE
aiBills20232024$AB2355$fiscal <- TRUE
aiBills20232024$AB2355$local <- FALSE
aiBills20232024$AB2355$urgency <- FALSE
aiBills20232024$AB2355$tax <- FALSE
aiBills20232024$AB2355$action <- "Chaptered by Secretary of State - Chapter 260, Statutes of 2024"
aiBills20232024$AB2355$pdf <- "20230AB2355_93.pdf"

# AI properties assessed from the text in aiBills20232024$AB2355$text
aiBills20232024$AB2355$aiDisposition <- "Restrictive"
aiBills20232024$AB2355$aiType <- "Generative"
aiBills20232024$AB2355$aiSector <- "Political Sector"
aiBills20232024$AB2355$aiSubSector <- "General"
aiBills20232024$AB2355$aiDomain <- "Political Sector Management"
aiBills20232024$AB2355$aiAccountability <- "High"
aiBills20232024$AB2355$aiImpact <- "High"
aiBills20232024$AB2355$aiEthics <- "High"
aiBills20232024$AB2355$aiInnovation <- "Low"
aiBills20232024$AB2355$aiPrivacy <- "High"
aiBills20232024$AB2355$aiTransparency <- "High"

## SB-1381 ####

aiBills20232024$SB1381 <- addBillStructure(2023, "SB-1381")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$SB1381$text)

# Topic from aiBills20232024$SB1381$status
aiBills20232024$SB1381$topic <- "SB-1381 Crimes: child pornography"

# Title from aiBills20232024$SB1381$status
aiBills20232024$SB1381$title <- paste0(aiBills20232024$SB1381$title, "An act to amend Sections 311.1, 311.3, 311.4 and, 312.3 of the Penal Code, relating to crimes")

# tldr for aiBills20232024$SB1381$text
aiBills20232024$SB1381$tldr <- "SB-1381 addresses crimes related to child pornography, enhancing penalties and enforcement measures."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$SB1381$tags <- c("artificial-intelligence", "crimes", "child-pornography", "penalties", "enforcement", "enhancement")

# sponsors and cosponsors
aiBills20232024$SB1381$sponsors <- addSponsors("Y20232024", c("WahabS", "BoghS"))
aiBills20232024$SB1381$cosponsors <- addSponsors("Y20232024", c("Bermans", "BradfordS", "CorteseS", "DixonA", "GroveS", "JonesS", "NguyenA", "RubioS", "SchiavoA", "SeyartoS", "SkinnerS"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$SB1381$dateStart <- as.Date("2024-02-16")
aiBills20232024$SB1381$dateEnd <- as.Date("2024-09-29")
aiBills20232024$SB1381$dateUpdated <- Sys.Date()

# measures
aiBills20232024$SB1381$version <- "Chaptered"
aiBills20232024$SB1381$outcome <- "Chaptered"
aiBills20232024$SB1381$chaptered <- TRUE
aiBills20232024$SB1381$chapterNo <- 929
aiBills20232024$SB1381$active <- FALSE
aiBills20232024$SB1381$result <- "Chaptered"
aiBills20232024$SB1381$vote <- "Majority"
aiBills20232024$SB1381$appropriation <- FALSE
aiBills20232024$SB1381$fiscal <- TRUE
aiBills20232024$SB1381$local <- TRUE
aiBills20232024$SB1381$urgency <- FALSE
aiBills20232024$SB1381$tax <- FALSE
aiBills20232024$SB1381$action <- "Chaptered by Secretary of State - Chapter 929, Statutes of 2024"
aiBills20232024$SB1381$pdf <- "20230SB1381_94.pdf"

# AI properties assessed from the text in aiBills20232024$SB1381$text
aiBills20232024$SB1381$aiDisposition <- "Restrictive"
aiBills20232024$SB1381$aiType <- "Pornography"
aiBills20232024$SB1381$aiSector <- "Child Protection"
aiBills20232024$SB1381$aiSubSector <- "General"
aiBills20232024$SB1381$aiDomain <- "Child Protection Management"
aiBills20232024$SB1381$aiAccountability <- "High"
aiBills20232024$SB1381$aiImpact <- "High"
aiBills20232024$SB1381$aiEthics <- "High"
aiBills20232024$SB1381$aiInnovation <- "Low"
aiBills20232024$SB1381$aiPrivacy <- "High"
aiBills20232024$SB1381$aiTransparency <- "High"

## AJR-6 ####

aiBills20232024$AJR6 <- addBillStructure(2023, "AJR-6")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AJR6$text)

# Topic from aiBills20232024$AJR6$status
aiBills20232024$AJR6$topic <- "AJR-6 Artificial intelligence"

# Title from aiBills20232024$AJR6$status
aiBills20232024$AJR6$title <- paste0(aiBills20232024$AJR6$title, "Relative to artificial intelligence")

# tldr for aiBills20232024$AJR6$text
aiBills20232024$AJR6$tldr <- "AJR-6 expresses the need for a comprehensive framework to govern the development and use of artificial intelligence, ensuring ethical standards and accountability."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AJR6$tags <- c("artificial-intelligence", "comprehensive-framework", "governance", "ethical-standards", "accountability")

# sponsors and cosponsors
aiBills20232024$AJR6$sponsors <- addSponsors("Y20232024", c("EssayliA"))
aiBills20232024$AJR6$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AJR6$dateStart <- as.Date("2023-05-04")
aiBills20232024$AJR6$dateEnd <- as.Date("2024-11-30")
aiBills20232024$AJR6$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AJR6$version <- "Introduced"
aiBills20232024$AJR6$outcome <- "Failed"
aiBills20232024$AJR6$chaptered <- FALSE
aiBills20232024$AJR6$chapterNo <- NA
aiBills20232024$AJR6$active <- FALSE
aiBills20232024$AJR6$result <- "Died"
aiBills20232024$AJR6$vote <- "No Vote"
aiBills20232024$AJR6$appropriation <- FALSE
aiBills20232024$AJR6$fiscal <- FALSE
aiBills20232024$AJR6$local <- FALSE
aiBills20232024$AJR6$urgency <- FALSE
aiBills20232024$AJR6$tax <- FALSE
aiBills20232024$AJR6$action <- "From committee without further action"
aiBills20232024$AJR6$pdf <- "20230AJR6_99.pdf"

# AI properties assessed from the text in aiBills20232024$AJR6$text
aiBills20232024$AJR6$aiDisposition <- "Neutral"
aiBills20232024$AJR6$aiType <- "Generative"
aiBills20232024$AJR6$aiSector <- "Generative AI"
aiBills20232024$AJR6$aiSubSector <- "General"
aiBills20232024$AJR6$aiDomain <- "Generative AI Management"
aiBills20232024$AJR6$aiAccountability <- "Low"
aiBills20232024$AJR6$aiImpact <- "Low"
aiBills20232024$AJR6$aiEthics <- "Low"
aiBills20232024$AJR6$aiInnovation <- "High"
aiBills20232024$AJR6$aiPrivacy <- "Low"
aiBills20232024$AJR6$aiTransparency <- "Low"

## AB-1873 ####

aiBills20232024$AB1873 <- addBillStructure(2023, "AB-1873")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB1873$text)

# Topic from aiBills20232024$AB1873$status
aiBills20232024$AB1873$topic <- "AB-1873 Crimes: sexual exploitation of a child"

# Title from aiBills20232024$AB1873$status
aiBills20232024$AB1873$title <- paste0(aiBills20232024$AB1873$title, "An act to amend Section 311.3 of the Penal Code, relating to crimes")

# tldr for aiBills20232024$AB1873$text
aiBills20232024$AB1873$tldr <- "AB-1873 addresses sexual exploitation of a child, enhancing penalties and enforcement measures."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB1873$tags <- c("artificial-intelligence", "sexual-exploitation", "child-protection")

# sponsors and cosponsors
aiBills20232024$AB1873$sponsors <- addSponsors("Y20232024", c("SanchezA"))
aiBills20232024$AB1873$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB1873$dateStart <- as.Date("2024-01-22")
aiBills20232024$AB1873$dateEnd <- as.Date("2024-11-30")
aiBills20232024$AB1873$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB1873$version <- "Introduced"
aiBills20232024$AB1873$outcome <- "Failed"
aiBills20232024$AB1873$chaptered <- FALSE
aiBills20232024$AB1873$chapterNo <- NA
aiBills20232024$AB1873$active <- FALSE
aiBills20232024$AB1873$result <- "Died"
aiBills20232024$AB1873$vote <- "Majority"
aiBills20232024$AB1873$appropriation <- FALSE
aiBills20232024$AB1873$fiscal <- TRUE
aiBills20232024$AB1873$local <- TRUE
aiBills20232024$AB1873$urgency <- FALSE
aiBills20232024$AB1873$tax <- FALSE
aiBills20232024$AB1873$action <- "From committee without further action"
aiBills20232024$AB1873$pdf <- "20230AB1873_99.pdf"

# AI properties assessed from the text in aiBills20232024$AB1873$text
aiBills20232024$AB1873$aiDisposition <- "Restrictive"
aiBills20232024$AB1873$aiType <- "Preventive"
aiBills20232024$AB1873$aiSector <- "Child Protection"
aiBills20232024$AB1873$aiSubSector <- "General"
aiBills20232024$AB1873$aiDomain <- "Child Protection Management"
aiBills20232024$AB1873$aiAccountability <- "High"
aiBills20232024$AB1873$aiImpact <- "High"
aiBills20232024$AB1873$aiEthics <- "High"
aiBills20232024$AB1873$aiInnovation <- "Low"
aiBills20232024$AB1873$aiPrivacy <- "High"
aiBills20232024$AB1873$aiTransparency <- "High"

## SCR-17 ####

aiBills20232024$SCR17 <- addBillStructure(2023, "SCR-17")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$SCR17$text)

# Topic from aiBills20232024$SCR17$status
aiBills20232024$SCR17$topic <- "SCR-17 Artificial intelligence"

# Title from aiBills20232024$SCR17$status
aiBills20232024$SCR17$title <- paste0(aiBills20232024$SCR17$title, "Relative to artificial intelligence")

# tldr for aiBills20232024$SCR17$text
aiBills20232024$SCR17$tldr <- "SCR-17 expresses the need for a comprehensive framework to govern the development and use of artificial intelligence, ensuring ethical standards and accountability."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$SCR17$tags <- c("artificial-intelligence", "comprehensive-framework", "governance", "ethical-standards", "accountability")

# sponsors and cosponsors
aiBills20232024$SCR17$sponsors <- addSponsors("Y20232024", c("DoddS"))
aiBills20232024$SCR17$cosponsors <- addSponsors("Y20232024", c("AddisA", "AguiarCurryA", "AlanisA", "AlvarezA", "ArambulaA", "BainsA", "BauerKahanA", "BennettA", "BermanA", "BoernerA", "BontaA", "BryanA", "CalderonA", "CarrilloJA", "CarrilloWA", "CervantesA", "ConnollyA", "DixonA", "FongMA" , "FriedmanA", "GabrielA", "GipsonA", "GraysonA", "HaneyA", "HartA", "HoldenA", "IrwinA", "JacksonA", "JonesSawyerA", "KalraA", "LeeA", "LowA", "LowenthalA", "MaienscheinA", "McCartyA", "McKinnorA", "MuratsuchiA", "OrtegaA", "PachecoA", "PapanA", "PellerinA", "PetrieNorrisA", "QuirkSilvaA", "RamosA", "RendonA", "ReyesA", "RivasLA", "RivasRA", "RodriguezA", "RubioA", "SantiagoA", "SchiavoA", "SoriaA", "TingA", "ValenciaA", "VillapuduaA", "WaldronA", "WallisA", "WardA", "WeberA", "WicksA", "WilsonA", "WoodA", "ZburA"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$SCR17$dateStart <- as.Date("2023-01-30")
aiBills20232024$SCR17$dateEnd <- as.Date("2023-08-23")
aiBills20232024$SCR17$dateUpdated <- Sys.Date()

# measures
aiBills20232024$SCR17$version <- "Chaptered"
aiBills20232024$SCR17$outcome <- "Chaptered"
aiBills20232024$SCR17$chaptered <- TRUE
aiBills20232024$SCR17$chapterNo <- 135
aiBills20232024$SCR17$active <- FALSE
aiBills20232024$SCR17$result <- "Chaptered"
aiBills20232024$SCR17$vote <- "No Vote"
aiBills20232024$SCR17$appropriation <- FALSE
aiBills20232024$SCR17$fiscal <- FALSE
aiBills20232024$SCR17$local <- FALSE
aiBills20232024$SCR17$urgency <- FALSE
aiBills20232024$SCR17$tax <- FALSE
aiBills20232024$SCR17$action <- "Chaptered by Secretary of State - Chapter 135, Statutes of 2023"
aiBills20232024$SCR17$pdf <- "20230SCR17_97.pdf"

# AI properties assessed from the text in aiBills20232024$SCR17$text
aiBills20232024$SCR17$aiDisposition <- "Neutral"
aiBills20232024$SCR17$aiType <- "Generative"
aiBills20232024$SCR17$aiSector <- "Generative AI"
aiBills20232024$SCR17$aiSubSector <- "General"
aiBills20232024$SCR17$aiDomain <- "Generative AI Management"
aiBills20232024$SCR17$aiAccountability <- "Low"
aiBills20232024$SCR17$aiImpact <- "Low"
aiBills20232024$SCR17$aiEthics <- "Low"
aiBills20232024$SCR17$aiInnovation <- "High"
aiBills20232024$SCR17$aiPrivacy <- "Low"
aiBills20232024$SCR17$aiTransparency <- "Low"

## AB-2905 ####

aiBills20232024$AB2905 <- addBillStructure(2023, "AB-2905")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB2905$text)

# Topic from aiBills20232024$AB2905$status
aiBills20232024$AB2905$topic <- "AB-2905 Telecommunications: automatic dialing-announcing devices: artificial voices"

# Title from aiBills20232024$AB2905$status
aiBills20232024$AB2905$title <- paste0(aiBills20232024$AB2905$title, "An act to amend Section 2874 of the Public Utilities Code, relating to telecommunications")

# tldr for aiBills20232024$AB2905$text
aiBills20232024$AB2905$tldr <- "AB-2905 regulates the use of automatic dialing-announcing devices that utilize artificial voices in telecommunications, ensuring consumer protection and privacy."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB2905$tags <- c("artificial-intelligence", "telecommunications", "automatic-dialing-announcing-devices", "consumer-protection", "privacy")

# sponsors and cosponsors
aiBills20232024$AB2905$sponsors <- addSponsors("Y20232024", c("LowA", "PattersonJimA"))
aiBills20232024$AB2905$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB2905$dateStart <- as.Date("2024-02-15")
aiBills20232024$AB2905$dateEnd <- as.Date("2024-09-20")
aiBills20232024$AB2905$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB2905$version <- "Chaptered"
aiBills20232024$AB2905$outcome <- "Chaptered"
aiBills20232024$AB2905$chaptered <- TRUE
aiBills20232024$AB2905$chapterNo <- 316
aiBills20232024$AB2905$active <- FALSE
aiBills20232024$AB2905$result <- "Chaptered"
aiBills20232024$AB2905$vote <- "Majority"
aiBills20232024$AB2905$appropriation <- FALSE
aiBills20232024$AB2905$fiscal <- TRUE
aiBills20232024$AB2905$local <- TRUE
aiBills20232024$AB2905$urgency <- FALSE
aiBills20232024$AB2905$tax <- FALSE
aiBills20232024$AB2905$action <- "Chaptered by Secretary of State - Chapter 316, Statutes of 2024"
aiBills20232024$AB2905$pdf <- "20230AB2905_94.pdf"

# AI properties assessed from the text in aiBills20232024$AB2905$text
aiBills20232024$AB2905$aiDisposition <- "Restrictive"
aiBills20232024$AB2905$aiType <- "Generative"
aiBills20232024$AB2905$aiSector <- "Telecommunications"
aiBills20232024$AB2905$aiSubSector <- "General"
aiBills20232024$AB2905$aiDomain <- "Telecommunications Management"
aiBills20232024$AB2905$aiAccountability <- "High"
aiBills20232024$AB2905$aiImpact <- "High"
aiBills20232024$AB2905$aiEthics <- "High"
aiBills20232024$AB2905$aiInnovation <- "Low"
aiBills20232024$AB2905$aiPrivacy <- "High"
aiBills20232024$AB2905$aiTransparency <- "High"

## AB-3050 ####

aiBills20232024$AB3050 <- addBillStructure(2023, "AB-3050")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB3050$text)

# Topic from aiBills20232024$AB3050$status
aiBills20232024$AB3050$topic <- "AB-3050 Artificial intelligence"

# Title from aiBills20232024$AB3050$status
aiBills20232024$AB3050$title <- paste0(aiBills20232024$AB3050$title, "An act to add Section 11547.6 to the Government Code, relating to state government")

# tldr for aiBills20232024$AB3050$text
aiBills20232024$AB3050$tldr <- "AB-3050 establishes guidelines for the ethical use of artificial intelligence in state government, ensuring transparency and accountability."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB3050$tags <- c("artificial-intelligence", "state-government", "ethical-use", "guidelines", "transparency", "accountability")

# sponsors and cosponsors
aiBills20232024$AB3050$sponsors <- addSponsors("Y20232024", c("LowA"))
aiBills20232024$AB3050$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB3050$dateStart <- as.Date("2024-02-16")
aiBills20232024$AB3050$dateEnd <- as.Date("2024-11-30")
aiBills20232024$AB3050$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB3050$version <- "Introduced"
aiBills20232024$AB3050$outcome <- "Failed"
aiBills20232024$AB3050$chaptered <- FALSE
aiBills20232024$AB3050$chapterNo <- NA
aiBills20232024$AB3050$active <- FALSE
aiBills20232024$AB3050$result <- "Died"
aiBills20232024$AB3050$vote <- "Majority"
aiBills20232024$AB3050$appropriation <- FALSE
aiBills20232024$AB3050$fiscal <- TRUE
aiBills20232024$AB3050$local <- FALSE
aiBills20232024$AB3050$urgency <- FALSE
aiBills20232024$AB3050$tax <- FALSE
aiBills20232024$AB3050$action <- "From committee without further action"
aiBills20232024$AB3050$pdf <- "20230AB3050_99.pdf"

# AI properties assessed from the text in aiBills20232024$AB3050$text
aiBills20232024$AB3050$aiDisposition <- "Restrictive"
aiBills20232024$AB3050$aiType <- "Generative"
aiBills20232024$AB3050$aiSector <- "Generative AI"
aiBills20232024$AB3050$aiSubSector <- "General"
aiBills20232024$AB3050$aiDomain <- "Generative AI Management"
aiBills20232024$AB3050$aiAccountability <- "High"
aiBills20232024$AB3050$aiImpact <- "High"
aiBills20232024$AB3050$aiEthics <- "High"
aiBills20232024$AB3050$aiInnovation <- "Low"
aiBills20232024$AB3050$aiPrivacy <- "High"
aiBills20232024$AB3050$aiTransparency <- "High"

## AB-3211 ####

aiBills20232024$AB3211 <- addBillStructure(2023, "AB-3211")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB3211$text)

# Topic from aiBills20232024$AB3211$status
aiBills20232024$AB3211$topic <- "AB-3211 California Digital Content Provenance Standards"

# Title from aiBills20232024$AB3211$status
aiBills20232024$AB3211$title <- paste0(aiBills20232024$AB3211$title, "An act to add Chapter 41 (commencing with Section 22949.90) to Division 8 of the Business and Professions Code, relating to artificial intelligence")

# tldr for aiBills20232024$AB3211$text
aiBills20232024$AB3211$tldr <- "AB-3211 establishes California Digital Content Provenance Standards to ensure the authenticity and integrity of digital content, particularly in the context of artificial intelligence."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB3211$tags <- c("artificial-intelligence", "digital-content", "provenance-standards", "authenticity", "integrity")

# sponsors and cosponsors
aiBills20232024$AB3211$sponsors <- addSponsors("Y20232024", c("WicksA"))
aiBills20232024$AB3211$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB3211$dateStart <- as.Date("2024-02-16")
aiBills20232024$AB3211$dateEnd <- as.Date("2024-11-30")
aiBills20232024$AB3211$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB3211$version <- "Amended Senate"
aiBills20232024$AB3211$outcome <- "Failed"
aiBills20232024$AB3211$chaptered <- FALSE
aiBills20232024$AB3211$chapterNo <- NA
aiBills20232024$AB3211$active <- FALSE
aiBills20232024$AB3211$result <- "Died"
aiBills20232024$AB3211$vote <- "Majority"
aiBills20232024$AB3211$appropriation <- FALSE
aiBills20232024$AB3211$fiscal <- TRUE
aiBills20232024$AB3211$local <- FALSE
aiBills20232024$AB3211$urgency <- FALSE
aiBills20232024$AB3211$tax <- FALSE
aiBills20232024$AB3211$action <- "Died on Senate inactive file"
aiBills20232024$AB3211$pdf <- "20230AB3211_93.pdf"

# AI properties assessed from the text in aiBills20232024$AB3211$text
aiBills20232024$AB3211$aiDisposition <- "Restrictive"
aiBills20232024$AB3211$aiType <- "Generative"
aiBills20232024$AB3211$aiSector <- "Generative AI"
aiBills20232024$AB3211$aiSubSector <- "General"
aiBills20232024$AB3211$aiDomain <- "Generative AI Management"
aiBills20232024$AB3211$aiAccountability <- "High"
aiBills20232024$AB3211$aiImpact <- "High"
aiBills20232024$AB3211$aiEthics <- "High"
aiBills20232024$AB3211$aiInnovation <- "Low"
aiBills20232024$AB3211$aiPrivacy <- "High"
aiBills20232024$AB3211$aiTransparency <- "High"

## AB-2877 ####

aiBills20232024$AB2877 <- addBillStructure(2023, "AB-2877")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB2877$text)

# Topic from aiBills20232024$AB2877$status
aiBills20232024$AB2877$topic <- "AB-2877 California Consumer Privacy Act of 2018: artificial intelligence: training"

# Title from aiBills20232024$AB2877$status
aiBills20232024$AB2877$title <- paste0(aiBills20232024$AB2877$title, "An act to amend Sections 1798.99.90, 1798.121, 1798.130, 1798.140, 1798.145, 1798.185, and 1798.199.40 of, and to add Section 1798.199.41 to, the Civil Code, relating to privacy")

# tldr for aiBills20232024$AB2877$text
aiBills20232024$AB2877$tldr <- "AB-2877 amends the California Consumer Privacy Act of 2018 to address the implications of artificial intelligence on consumer privacy."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB2877$tags <- c("artificial-intelligence", "consumer-privacy", "privacy-act", "amendment")

# sponsors and cosponsors
aiBills20232024$AB2877$sponsors <- addSponsors("Y20232024", c("BauerKahanA"))
aiBills20232024$AB2877$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB2877$dateStart <- as.Date("2024-02-15")
aiBills20232024$AB2877$dateEnd <- as.Date("2024-11-30")
aiBills20232024$AB2877$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB2877$version <- "Amended Senate"
aiBills20232024$AB2877$outcome <- "Failed"
aiBills20232024$AB2877$chaptered <- FALSE
aiBills20232024$AB2877$chapterNo <- NA
aiBills20232024$AB2877$active <- FALSE
aiBills20232024$AB2877$result <- "Died"
aiBills20232024$AB2877$vote <- "Majority"
aiBills20232024$AB2877$appropriation <- FALSE
aiBills20232024$AB2877$fiscal <- TRUE
aiBills20232024$AB2877$local <- FALSE
aiBills20232024$AB2877$urgency <- FALSE
aiBills20232024$AB2877$tax <- FALSE
aiBills20232024$AB2877$action <- "From Senate committee without further action"
aiBills20232024$AB2877$pdf <- "20230AB2877_95.pdf"

# AI properties assessed from the text in aiBills20232024$AB2877$text
aiBills20232024$AB2877$aiDisposition <- "Restrictive"
aiBills20232024$AB2877$aiType <- "Generative"
aiBills20232024$AB2877$aiSector <- "Generative AI"
aiBills20232024$AB2877$aiSubSector <- "General"
aiBills20232024$AB2877$aiDomain <- "Generative AI Management"
aiBills20232024$AB2877$aiAccountability <- "High"
aiBills20232024$AB2877$aiImpact <- "High"
aiBills20232024$AB2877$aiEthics <- "High"
aiBills20232024$AB2877$aiInnovation <- "Low"
aiBills20232024$AB2877$aiPrivacy <- "High"
aiBills20232024$AB2877$aiTransparency <- "High"

## AB-331 ####

aiBills20232024$AB331 <- addBillStructure(2023, "AB-331")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB331$text)

# Topic from aiBills20232024$AB331$status
aiBills20232024$AB331$topic <- "AB-331 Automated decision tools"

# Title from aiBills20232024$AB331$status
aiBills20232024$AB331$title <- paste0(aiBills20232024$AB331$title, "An act to add Chapter 25 (commencing with Section 22756) to Division 8 of the Business and Professions Code, relating to artificial intelligence")

# tldr for aiBills20232024$AB331$text
aiBills20232024$AB331$tldr <- "AB-331 establishes regulations for the use of automated decision tools in various sectors, ensuring transparency and accountability."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB331$tags <- c("artificial-intelligence", "automated-decision-tools", "regulations", "transparency", "accountability")

# sponsors and cosponsors
aiBills20232024$AB331$sponsors <- addSponsors("Y20232024", c("BaurerKahanA"))
aiBills20232024$AB331$cosponsors <- addSponsors("Y20232024", c("BoernerA"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB331$dateStart <- as.Date("2023-01-30")
aiBills20232024$AB331$dateEnd <- as.Date("2024-02-01")
aiBills20232024$AB331$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB331$version <- "Amended Assemby"
aiBills20232024$AB331$outcome <- "Failed"
aiBills20232024$AB331$chaptered <- FALSE
aiBills20232024$AB331$chapterNo <- NA
aiBills20232024$AB331$active <- FALSE
aiBills20232024$AB331$result <- "Died"
aiBills20232024$AB331$vote <- "Majority"
aiBills20232024$AB331$appropriation <- FALSE
aiBills20232024$AB331$fiscal <- TRUE
aiBills20232024$AB331$local <- TRUE
aiBills20232024$AB331$urgency <- FALSE
aiBills20232024$AB331$tax <- FALSE
aiBills20232024$AB331$action <- "From committee: Filed with the Chief Clerk pursuant to Joint Rule 56"
aiBills20232024$AB331$pdf <- "20230AB331_95.pdf"

# AI properties assessed from the text in aiBills20232024$AB331$text
aiBills20232024$AB331$aiDisposition <- "Restrictive"
aiBills20232024$AB331$aiType <- "Generative"
aiBills20232024$AB331$aiSector <- "Generative AI"
aiBills20232024$AB331$aiSubSector <- "General"
aiBills20232024$AB331$aiDomain <- "Generative AI Management"
aiBills20232024$AB331$aiAccountability <- "High"
aiBills20232024$AB331$aiImpact <- "High"
aiBills20232024$AB331$aiEthics <- "High"
aiBills20232024$AB331$aiInnovation <- "Low"
aiBills20232024$AB331$aiPrivacy <- "High"
aiBills20232024$AB331$aiTransparency <- "High"

## SB-1220 ####

aiBills20232024$SB1220 <- addBillStructure(2023, "SB-1220")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$SB1220$text)

# Topic from aiBills20232024$SB1220$status
aiBills20232024$SB1220$topic <- "SB-1220 Public benefits contracts: phone operator jobs"

# Title from aiBills20232024$SB1220$status
aiBills20232024$SB1220$title <- paste0(aiBills20232024$SB1220$title, "An act to amend, repeal, and add Section 12140 of, and to amend the heading of Chapter 3.7 (commencing with Section 12140) of Part 2 of Division 2 of, the Public Contract Code, relating to public contracts")

# tldr for aiBills20232024$SB1220$text
aiBills20232024$SB1220$tldr <- "SB-1220 addresses public benefits contracts and the impact of artificial intelligence on phone operator jobs, ensuring job security and fair labor practices."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$SB1220$tags <- c("artificial-intelligence", "public-benefits-contracts", "phone-operator-jobs", "labor-practices")

# sponsors and cosponsors
aiBills20232024$SB1220$sponsors <- addSponsors("Y20232024", c("LimonS"))
aiBills20232024$SB1220$cosponsors <- addSponsors("Y20232024", c("RubioS"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$SB1220$dateStart <- as.Date("2024-02-15")
aiBills20232024$SB1220$dateEnd <- as.Date("2024-11-30")
aiBills20232024$SB1220$dateUpdated <- Sys.Date()

# measures
aiBills20232024$SB1220$version <- "Enrolled"
aiBills20232024$SB1220$outcome <- "Vetoed"
aiBills20232024$SB1220$chaptered <- FALSE
aiBills20232024$SB1220$chapterNo <- NA
aiBills20232024$SB1220$active <- FALSE
aiBills20232024$SB1220$result <- "In Floor Process"
aiBills20232024$SB1220$vote <- "Majority"
aiBills20232024$SB1220$appropriation <- FALSE
aiBills20232024$SB1220$fiscal <- TRUE
aiBills20232024$SB1220$local <- TRUE
aiBills20232024$SB1220$urgency <- FALSE
aiBills20232024$SB1220$tax <- FALSE
aiBills20232024$SB1220$action <- "Last day to consider Governor's veto pursuant to Joint Rule 58.5"
aiBills20232024$SB1220$pdf <- "20230SB1220_93.pdf"

# AI properties assessed from the text in aiBills20232024$SB1220$text
aiBills20232024$SB1220$aiDisposition <- "Restrictive"
aiBills20232024$SB1220$aiType <- "Generative"
aiBills20232024$SB1220$aiSector <- "Employment"
aiBills20232024$SB1220$aiSubSector <- "Telecommunications"
aiBills20232024$SB1220$aiDomain <- "Telecommunications Management"
aiBills20232024$SB1220$aiAccountability <- "High"
aiBills20232024$SB1220$aiImpact <- "High"
aiBills20232024$SB1220$aiEthics <- "High"
aiBills20232024$SB1220$aiInnovation <- "Low"
aiBills20232024$SB1220$aiPrivacy <- "High"
aiBills20232024$SB1220$aiTransparency <- "High"

## AB-2512 ####

aiBills20232024$AB2512 <- addBillStructure(2023, "AB-2512")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB2512$text)

# Topic from aiBills20232024$AB2512$status
aiBills20232024$AB2512$topic <- "AB-2512 Telecommunications: automatic dialing-announcing devices: artificial voices"

# Title from aiBills20232024$AB2512$status
aiBills20232024$AB2512$title <- paste0(aiBills20232024$AB2512$title, "An act to amend Section 2871 of the Public Utilities Code, relating to telecommunications")

# tldr for aiBills20232024$AB2512$text
aiBills20232024$AB2512$tldr <- "AB-2512 regulates the use of automatic dialing-announcing devices that utilize artificial voices in telecommunications, ensuring consumer protection and privacy."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB2512$tags <- c("artificial-intelligence", "telecommunications", "automatic-dialing-announcing-devices", "consumer-protection", "privacy")

# sponsors and cosponsors
aiBills20232024$AB2512$sponsors <- addSponsors("Y20232024", c("LowA", "PattersonJimA"))
aiBills20232024$AB2512$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB2512$dateStart <- as.Date("2024-02-13")
aiBills20232024$AB2512$dateEnd <- as.Date("2024-11-30")
aiBills20232024$AB2512$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB2512$version <- "Amended Assembly"
aiBills20232024$AB2512$outcome <- "Failed"
aiBills20232024$AB2512$chaptered <- FALSE
aiBills20232024$AB2512$chapterNo <- NA
aiBills20232024$AB2512$active <- FALSE
aiBills20232024$AB2512$result <- "Died"
aiBills20232024$AB2512$vote <- "Majority"
aiBills20232024$AB2512$appropriation <- FALSE
aiBills20232024$AB2512$fiscal <- TRUE
aiBills20232024$AB2512$local <- TRUE
aiBills20232024$AB2512$urgency <- FALSE
aiBills20232024$AB2512$tax <- FALSE
aiBills20232024$AB2512$action <- "From committee without further action"
aiBills20232024$AB2512$pdf <- "20230AB2512_98.pdf"

# AI properties assessed from the text in aiBills20232024$AB2512$text
aiBills20232024$AB2512$aiDisposition <- "Restrictive"
aiBills20232024$AB2512$aiType <- "Generative"
aiBills20232024$AB2512$aiSector <- "Telecommunications"
aiBills20232024$AB2512$aiSubSector <- "General"
aiBills20232024$AB2512$aiDomain <- "Telecommunications Management"
aiBills20232024$AB2512$aiAccountability <- "High"
aiBills20232024$AB2512$aiImpact <- "High"
aiBills20232024$AB2512$aiEthics <- "High"
aiBills20232024$AB2512$aiInnovation <- "Low"
aiBills20232024$AB2512$aiPrivacy <- "High"
aiBills20232024$AB2512$aiTransparency <- "High"

## ACR-227 ####

aiBills20232024$ACR227 <- addBillStructure(2023, "ACR-227")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$ACR227$text)

# Topic from aiBills20232024$ACR227$status
aiBills20232024$ACR227$topic <- "ACR-227 Women in Animation"

# Title from aiBills20232024$ACR227$status
aiBills20232024$ACR227$title <- paste0(aiBills20232024$ACR227$title, "Relative to Women in Animation")

# tldr for aiBills20232024$ACR227$text
aiBills20232024$ACR227$tldr <- "This resolution recognizes the contributions of women in animation and advocates for increased representation and opportunities in the industry."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$ACR227$tags <- c("women-in-animation", "animation-industry", "representation", "opportunities", "artificial-intelligence")

# sponsors and cosponsors
aiBills20232024$ACR227$sponsors <- addSponsors("Y20232024", c("WallisA"))
aiBills20232024$ACR227$cosponsors <- addSponsors("Y20232024", c("PachecoA"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$ACR227$dateStart <- as.Date("2024-08-05")
aiBills20232024$ACR227$dateEnd <- as.Date("2024-08-23")
aiBills20232024$ACR227$dateUpdated <- Sys.Date()

# measures
aiBills20232024$ACR227$version <- "Chaptered"
aiBills20232024$ACR227$outcome <- "Chaptered"
aiBills20232024$ACR227$chaptered <- TRUE
aiBills20232024$ACR227$chapterNo <- 177
aiBills20232024$ACR227$active <- FALSE
aiBills20232024$ACR227$result <- "Chaptered"
aiBills20232024$ACR227$vote <- "No Vote"
aiBills20232024$ACR227$appropriation <- FALSE
aiBills20232024$ACR227$fiscal <- FALSE
aiBills20232024$ACR227$local <- FALSE
aiBills20232024$ACR227$urgency <- FALSE
aiBills20232024$ACR227$tax <- FALSE
aiBills20232024$ACR227$action <- "Chaptered by Secretary of State - Chapter 177, Statutes of 2024"
aiBills20232024$ACR227$pdf <- "20230ACR227_97.pdf"

# AI properties assessed from the text in aiBills20232024$ACR227$text
aiBills20232024$ACR227$aiDisposition <- "Neutral"
aiBills20232024$ACR227$aiType <- "Generative"
aiBills20232024$ACR227$aiSector <- "Generative AI"
aiBills20232024$ACR227$aiSubSector <- "Women in Animation"
aiBills20232024$ACR227$aiDomain <- "Generative AI Management"
aiBills20232024$ACR227$aiAccountability <- "Low"
aiBills20232024$ACR227$aiImpact <- "Low"
aiBills20232024$ACR227$aiEthics <- "Low"
aiBills20232024$ACR227$aiInnovation <- "Low"
aiBills20232024$ACR227$aiPrivacy <- "Low"
aiBills20232024$ACR227$aiTransparency <- "Low"

## AB-2930 ####

aiBills20232024$AB2930 <- addBillStructure(2023, "AB-2930")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB2930$text)

# Topic from aiBills20232024$AB2930$status
aiBills20232024$AB2930$topic <- "AB-2930 Automated decision systems"

# Title from aiBills20232024$AB2930$status
aiBills20232024$AB2930$title <- paste0(aiBills20232024$AB2930$title, "An act to add Chapter 25 (commencing with Section 22756) to Division 8 of the Business and Professions Code, relating to artificial intelligence")

# tldr for aiBills20232024$AB2930$text
aiBills20232024$AB2930$tldr <- "AB-2930 establishes regulations for the use of automated decision systems in various sectors, ensuring transparency and accountability."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB2930$tags <- c("artificial-intelligence", "automated-decision-systems", "regulations", "transparency", "accountability")

# sponsors and cosponsors
aiBills20232024$AB2930$sponsors <- addSponsors("Y20232024", c("BaurerKahanA"))
aiBills20232024$AB2930$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB2930$dateStart <- as.Date("2024-02-15")
aiBills20232024$AB2930$dateEnd <- as.Date("2024-11-30")
aiBills20232024$AB2930$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB2930$version <- "Amended Senate"
aiBills20232024$AB2930$outcome <- "Failed"
aiBills20232024$AB2930$chaptered <- FALSE
aiBills20232024$AB2930$chapterNo <- NA
aiBills20232024$AB2930$active <- FALSE
aiBills20232024$AB2930$result <- "Died"
aiBills20232024$AB2930$vote <- "Majority"
aiBills20232024$AB2930$appropriation <- FALSE
aiBills20232024$AB2930$fiscal <- TRUE
aiBills20232024$AB2930$local <- TRUE
aiBills20232024$AB2930$urgency <- FALSE
aiBills20232024$AB2930$tax <- FALSE
aiBills20232024$AB2930$action <- "Died on Senate inactive file"
aiBills20232024$AB2930$pdf <- "20230AB2930_91.pdf"

# AI properties assessed from the text in aiBills20232024$AB2930$text
aiBills20232024$AB2930$aiDisposition <- "Restrictive"
aiBills20232024$AB2930$aiType <- "Generative"
aiBills20232024$AB2930$aiSector <- "Decision Making"
aiBills20232024$AB2930$aiSubSector <- "Automated Decision Systems"
aiBills20232024$AB2930$aiDomain <- "Automated Decision Systems Management"
aiBills20232024$AB2930$aiAccountability <- "High"
aiBills20232024$AB2930$aiImpact <- "High"
aiBills20232024$AB2930$aiEthics <- "High"
aiBills20232024$AB2930$aiInnovation <- "Low"
aiBills20232024$AB2930$aiPrivacy <- "High"
aiBills20232024$AB2930$aiTransparency <- "High"

## AB-1027 ####

aiBills20232024$AB1027 <- addBillStructure(2023, "AB-1027")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB1027$text)

# Topic from aiBills20232024$AB1027$status
aiBills20232024$AB1027$topic <- "AB-1027 Social media platforms: drug safety policies"

# Title from aiBills20232024$AB1027$status
aiBills20232024$AB1027$title <- paste0(aiBills20232024$AB1027$title, "An act to amend Sections 22677 and 22945 of, and to add and repeal Sections 22945.7 and 22945.9 of, the Business and Professions Code, relating to social media platforms")

# tldr for aiBills20232024$AB1027$text
aiBills20232024$AB1027$tldr <- "AB-1027 requires social media platforms to implement drug safety policies and report adverse events related to drug use, ensuring consumer protection and safety."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB1027$tags <- c("artificial-intelligence", "social-media-platforms", "drug-safety-policies", "consumer-protection", "safety")

# sponsors and cosponsors
aiBills20232024$AB1027$sponsors <- addSponsors("Y20232024", c("PetrieNorrisA"))
aiBills20232024$AB1027$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB1027$dateStart <- as.Date("2023-02-15")
aiBills20232024$AB1027$dateEnd <- as.Date("2023-10-13")
aiBills20232024$AB1027$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB1027$version <- "Chaptered"
aiBills20232024$AB1027$outcome <- "Chaptered"
aiBills20232024$AB1027$chaptered <- TRUE
aiBills20232024$AB1027$chapterNo <- 824
aiBills20232024$AB1027$active <- FALSE
aiBills20232024$AB1027$result <- "Chaptered"
aiBills20232024$AB1027$vote <- "Majority"
aiBills20232024$AB1027$appropriation <- FALSE
aiBills20232024$AB1027$fiscal <- FALSE
aiBills20232024$AB1027$local <- FALSE
aiBills20232024$AB1027$urgency <- FALSE
aiBills20232024$AB1027$tax <- FALSE
aiBills20232024$AB1027$action <- "Chaptered by Secretary of State - Chapter 824, Statutes of 2023"
aiBills20232024$AB1027$pdf <- "20230AB1027_90.pdf"

# AI properties assessed from the text in aiBills20232024$AB1027$text
aiBills20232024$AB1027$aiDisposition <- "Restrictive"
aiBills20232024$AB1027$aiType <- "Generative"
aiBills20232024$AB1027$aiSector <- "Social Media"
aiBills20232024$AB1027$aiSubSector <- "Drug Safety"
aiBills20232024$AB1027$aiDomain <- "Social Media Management"
aiBills20232024$AB1027$aiAccountability <- "High"
aiBills20232024$AB1027$aiImpact <- "High"
aiBills20232024$AB1027$aiEthics <- "High"
aiBills20232024$AB1027$aiInnovation <- "Low"
aiBills20232024$AB1027$aiPrivacy <- "High"
aiBills20232024$AB1027$aiTransparency <- "High"

## AB-302 ####

aiBills20232024$AB302 <- addBillStructure(2023, "AB-302")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB302$text)

# Topic from aiBills20232024$AB302$status
aiBills20232024$AB302$topic <- "AB-302 Department of Technology: high-risk automated decision systems: inventory"

# Title from aiBills20232024$AB302$status
aiBills20232024$AB302$title <- paste0(aiBills20232024$AB302$title, "An act to add Section 11546.45.5 to the Government Code, relating to automated decision systems")

# tldr for aiBills20232024$AB302$text
aiBills20232024$AB302$tldr <- "AB-302 requires the Department of Technology to maintain an inventory of high-risk automated decision systems used by state agencies, ensuring transparency and accountability."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB302$tags <- c("artificial-intelligence", "automated-decision-systems", "inventory", "transparency", "accountability")

# sponsors and cosponsors
aiBills20232024$AB302$sponsors <- addSponsors("Y20232024", c("WardA"))
aiBills20232024$AB302$cosponsors <- addSponsors("Y20232024", c("AllenS", "WeberA"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB302$dateStart <- as.Date("2023-01-26")
aiBills20232024$AB302$dateEnd <- as.Date("2023-10-13")
aiBills20232024$AB302$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB302$version <- "Chaptered"
aiBills20232024$AB302$outcome <- "Chaptered"
aiBills20232024$AB302$chaptered <- TRUE
aiBills20232024$AB302$chapterNo <- 800
aiBills20232024$AB302$active <- FALSE
aiBills20232024$AB302$result <- "Chaptered"
aiBills20232024$AB302$vote <- "Majority"
aiBills20232024$AB302$appropriation <- FALSE
aiBills20232024$AB302$fiscal <- TRUE
aiBills20232024$AB302$local <- FALSE
aiBills20232024$AB302$urgency <- FALSE
aiBills20232024$AB302$tax <- FALSE
aiBills20232024$AB302$action <- "Chaptered by Secretary of State - Chapter 800, Statutes of 2023"
aiBills20232024$AB302$pdf <- "20230AB302_94.pdf"

# AI properties assessed from the text in aiBills20232024$AB302$text
aiBills20232024$AB302$aiDisposition <- "Restrictive"
aiBills20232024$AB302$aiType <- "Generative"
aiBills20232024$AB302$aiSector <- "Decision Making"
aiBills20232024$AB302$aiSubSector <- "Automated Decision Systems"
aiBills20232024$AB302$aiDomain <- "Automated Decision Systems Management"
aiBills20232024$AB302$aiAccountability <- "High"
aiBills20232024$AB302$aiImpact <- "High"
aiBills20232024$AB302$aiEthics <- "High"
aiBills20232024$AB302$aiInnovation <- "Low"
aiBills20232024$AB302$aiPrivacy <- "High"
aiBills20232024$AB302$aiTransparency <- "High"

## SCR-121 ####

aiBills20232024$SCR121 <- addBillStructure(2023, "SCR-121")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$SCR121$text)

# Topic from aiBills20232024$SCR121$status
aiBills20232024$SCR121$topic <- "SCR-121 International Women’s Day"

# Title from aiBills20232024$SCR121$status
aiBills20232024$SCR121$title <- paste0(aiBills20232024$SCR121$title, "Relative to International Women’s Day")

# tldr for aiBills20232024$SCR121$text
aiBills20232024$SCR121$tldr <- "This resolution recognizes the contributions of women in various fields and promotes gender equality."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$SCR121$tags <- c("women-in-animation", "animation-industry", "representation", "opportunities", "artificial-intelligence")

# sponsors and cosponsors
aiBills20232024$SCR121$sponsors <- addSponsors("Y20232024", c("WahabS"))
aiBills20232024$SCR121$cosponsors <- addSponsors("Y20232024", c("AtkinsS", "BlakespearS", "CaballeroS", "HurtadoS", "LimonS", "MenjivarS", "BoghS", "RubioS", "SkinnerS"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$SCR121$dateStart <- as.Date("2024-03-05")
aiBills20232024$SCR121$dateEnd <- as.Date("2024-05-31")
aiBills20232024$SCR121$dateUpdated <- Sys.Date()

# measures
aiBills20232024$SCR121$version <- "Chaptered"
aiBills20232024$SCR121$outcome <- "Chaptered"
aiBills20232024$SCR121$chaptered <- TRUE
aiBills20232024$SCR121$chapterNo <- 76
aiBills20232024$SCR121$active <- FALSE
aiBills20232024$SCR121$result <- "Chaptered"
aiBills20232024$SCR121$vote <- "No Vote"
aiBills20232024$SCR121$appropriation <- FALSE
aiBills20232024$SCR121$fiscal <- FALSE
aiBills20232024$SCR121$local <- FALSE
aiBills20232024$SCR121$urgency <- FALSE
aiBills20232024$SCR121$tax <- FALSE
aiBills20232024$SCR121$action <- "Chaptered by Secretary of State - Chapter 76, Statutes of 2024"
aiBills20232024$SCR121$pdf <- "20230SCR121_96.pdf"

# AI properties assessed from the text in aiBills20232024$SCR121$text
aiBills20232024$SCR121$aiDisposition <- "Neutral"
aiBills20232024$SCR121$aiType <- "Generative"
aiBills20232024$SCR121$aiSector <- "Generative AI"
aiBills20232024$SCR121$aiSubSector <- "Professional Development"
aiBills20232024$SCR121$aiDomain <- "Generative AI Management"
aiBills20232024$SCR121$aiAccountability <- "Low"
aiBills20232024$SCR121$aiImpact <- "Low"
aiBills20232024$SCR121$aiEthics <- "Low"
aiBills20232024$SCR121$aiInnovation <- "Low"
aiBills20232024$SCR121$aiPrivacy <- "Low"
aiBills20232024$SCR121$aiTransparency <- "Low"

## AB-2412 ####

aiBills20232024$AB2412 <- addBillStructure(2023, "AB-2412")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB2412$text)

# Topic from aiBills20232024$AB2412$status
aiBills20232024$AB2412$topic <- "AB-2412 Healing arts: California Body Contouring Council: practitioners"

# Title from aiBills20232024$AB2412$status
aiBills20232024$AB2412$title <- paste0(aiBills20232024$AB2412$title, "An act to add Chapter 10.8 (commencing with Section 4660) to Division 2 of the Business and Professions Code, relating to body contouring")

# tldr for aiBills20232024$AB2412$text
aiBills20232024$AB2412$tldr <- "This act establishes the California Body Contouring Council to regulate body contouring practitioners."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB2412$tags <- c("artificial-intelligence", "body-contouring", "practitioners", "regulation", "artificial-intelligence")

# sponsors and cosponsors
aiBills20232024$AB2412$sponsors <- addSponsors("Y20232024", c("ReyesA"))
aiBills20232024$AB2412$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB2412$dateStart <- as.Date("2024-02-12")
aiBills20232024$AB2412$dateEnd <- as.Date("2024-11-30")
aiBills20232024$AB2412$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB2412$version <- "Amended Assembly"
aiBills20232024$AB2412$outcome <- "Failed"
aiBills20232024$AB2412$chaptered <- FALSE
aiBills20232024$AB2412$chapterNo <- NA
aiBills20232024$AB2412$active <- FALSE
aiBills20232024$AB2412$result <- "Died"
aiBills20232024$AB2412$vote <- "Majority"
aiBills20232024$AB2412$appropriation <- FALSE
aiBills20232024$AB2412$fiscal <- TRUE
aiBills20232024$AB2412$local <- FALSE
aiBills20232024$AB2412$urgency <- FALSE
aiBills20232024$AB2412$tax <- FALSE
aiBills20232024$AB2412$action <- "From committee without further action"
aiBills20232024$AB2412$pdf <- "20230AB2412_98.pdf"

# AI properties assessed from the text in aiBills20232024$AB2412$text
aiBills20232024$AB2412$aiDisposition <- "Restrictive"
aiBills20232024$AB2412$aiType <- "Generative"
aiBills20232024$AB2412$aiSector <- "Health Care"
aiBills20232024$AB2412$aiSubSector <- "Body Contouring"
aiBills20232024$AB2412$aiDomain <- "Health Care Management"
aiBills20232024$AB2412$aiAccountability <- "High"
aiBills20232024$AB2412$aiImpact <- "High"
aiBills20232024$AB2412$aiEthics <- "High"
aiBills20232024$AB2412$aiInnovation <- "Low"
aiBills20232024$AB2412$aiPrivacy <- "High"
aiBills20232024$AB2412$aiTransparency <- "High"

## AB-2839 ####

aiBills20232024$AB2839 <- addBillStructure(2023, "AB-2839")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$AB2839$text)

# Topic from aiBills20232024$AB2839$status
aiBills20232024$AB2839$topic <- "AB-2839 Elections: deceptive media in advertisements"

# Title from aiBills20232024$AB2839$status
aiBills20232024$AB2839$title <- paste0(aiBills20232024$AB2839$title, "An act to amend Section 35 of the Code of Civil Procedure, and to add Section 20012 to the Elections Code, relating to elections, and declaring the urgency thereof, to take effect immediately")

# tldr for aiBills20232024$AB2839$text
aiBills20232024$AB2839$tldr <- "This act establishes regulations for the use of deceptive media in election advertisements, ensuring transparency and accountability."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$AB2839$tags <- c("artificial-intelligence", "elections", "deceptive-media", "advertisements", "transparency", "accountability")

# sponsors and cosponsors
aiBills20232024$AB2839$sponsors <- addSponsors("Y20232024", c("PellerinA", "BermanA"))
aiBills20232024$AB2839$cosponsors <- addSponsors("Y20232024", c("CervantesA", "BeckerS", "BennettA", "DoddS", "JacksonA", "QuirkSilvaA", "TingA", "ValenciaA", "WeberA", "WoodA"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$AB2839$dateStart <- as.Date("2024-02-15")
aiBills20232024$AB2839$dateEnd <- as.Date("2024-09-17")
aiBills20232024$AB2839$dateUpdated <- Sys.Date()

# measures
aiBills20232024$AB2839$version <- "Chaptered"
aiBills20232024$AB2839$outcome <- "Chaptered"
aiBills20232024$AB2839$chaptered <- TRUE
aiBills20232024$AB2839$chapterNo <- 262
aiBills20232024$AB2839$active <- FALSE
aiBills20232024$AB2839$result <- "Chaptered"
aiBills20232024$AB2839$vote <- "Two Thirds"
aiBills20232024$AB2839$appropriation <- FALSE
aiBills20232024$AB2839$fiscal <- FALSE
aiBills20232024$AB2839$local <- FALSE
aiBills20232024$AB2839$urgency <- TRUE
aiBills20232024$AB2839$tax <- FALSE
aiBills20232024$AB2839$action <- "Chaptered by Secretary of State - Chapter 262, Statutes of 2024"
aiBills20232024$AB2839$pdf <- "20230AB2839_91.pdf"

# AI properties assessed from the text in aiBills20232024$AB2839$text
aiBills20232024$AB2839$aiDisposition <- "Restrictive"
aiBills20232024$AB2839$aiType <- "Generative"
aiBills20232024$AB2839$aiSector <- "Elections"
aiBills20232024$AB2839$aiSubSector <- "Deceptive Media"
aiBills20232024$AB2839$aiDomain <- "Elections Management"
aiBills20232024$AB2839$aiAccountability <- "High"
aiBills20232024$AB2839$aiImpact <- "High"
aiBills20232024$AB2839$aiEthics <- "High"
aiBills20232024$AB2839$aiInnovation <- "Low"
aiBills20232024$AB2839$aiPrivacy <- "High"
aiBills20232024$AB2839$aiTransparency <- "High"

## SB-1446 ####

aiBills20232024$SB1446 <- addBillStructure(2023, "SB-1446")

# open the url for the bill text in the default web browser
#browseURL(aiBills20232024$SB1446$text)

# Topic from aiBills20232024$SB1446$status
aiBills20232024$SB1446$topic <- "SB-1446 Grocery retail store and retail drug establishment employees: self-service checkout and consequential workplace technology"

# Title from aiBills20232024$SB1446$status
aiBills20232024$SB1446$title <- paste0(aiBills20232024$SB1446$title, "An act to add Part 9.6 (commencing with Section 2530) to Division 2 of the Labor Code, relating to private employment")

# tldr for aiBills20232024$SB1446$text
aiBills20232024$SB1446$tldr <- "This act regulates the use of self-service checkout systems and other workplace technologies in grocery retail stores and retail drug establishments, ensuring employee rights and protections."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20232024$SB1446$tags <- c("artificial-intelligence", "grocery-retail", "self-service-checkout", "workplace-technology", "employee-rights", "protections")

# sponsors and cosponsors
aiBills20232024$SB1446$sponsors <- addSponsors("Y20232024", c("SmallwoodCuevasS"))
aiBills20232024$SB1446$cosponsors <- addSponsors("Y20232024", c("GipsonA", "LowenthalA", "McKinnorA", "OrtegaA"))

# dateStart, dateEnd, and dateUpdated
aiBills20232024$SB1446$dateStart <- as.Date("2024-02-16")
aiBills20232024$SB1446$dateEnd <- as.Date("2024-11-30")
aiBills20232024$SB1446$dateUpdated <- Sys.Date()

# measures
aiBills20232024$SB1446$version <- "Amended Assembly"
aiBills20232024$SB1446$outcome <- "Failed"
aiBills20232024$SB1446$chaptered <- FALSE
aiBills20232024$SB1446$chapterNo <- NA
aiBills20232024$SB1446$active <- FALSE
aiBills20232024$SB1446$result <- "Died"
aiBills20232024$SB1446$vote <- "Majority"
aiBills20232024$SB1446$appropriation <- FALSE
aiBills20232024$SB1446$fiscal <- TRUE
aiBills20232024$SB1446$local <- FALSE
aiBills20232024$SB1446$urgency <- FALSE
aiBills20232024$SB1446$tax <- FALSE
aiBills20232024$SB1446$action <- "From Assembly without further action"
aiBills20232024$SB1446$pdf <- "20230SB1446_93.pdf"

# AI properties assessed from the text in aiBills20232024$SB1446$text
aiBills20232024$SB1446$aiDisposition <- "Restrictive"
aiBills20232024$SB1446$aiType <- "Generative"
aiBills20232024$SB1446$aiSector <- "Retail"
aiBills20232024$SB1446$aiSubSector <- "Self-Service Checkout"
aiBills20232024$SB1446$aiDomain <- "Retail Management"
aiBills20232024$SB1446$aiAccountability <- "High"
aiBills20232024$SB1446$aiImpact <- "High"
aiBills20232024$SB1446$aiEthics <- "High"
aiBills20232024$SB1446$aiInnovation <- "Low"
aiBills20232024$SB1446$aiPrivacy <- "High"
aiBills20232024$SB1446$aiTransparency <- "High"

## ACR-219 ####

## SCR-162 ####

## SB-1154 ####

## AB-2655 ####

## AB-1008 ####

## AB-1526 ####

## AB-2200 ####

## SB-1223 ####

## AB-108 ####

## AB-103 ####

## AB-2928 ####

## AB-100 ####

## AB-106 ####

## SB-106 ####

## SB-100 ####

## SB-103 ####

## AB-158 ####

## SB-158 ####

## AB-104 ####

## SB-104 ####

## SB-107 ####

## AB-107 ####

## AB-1754 ####


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 4. Export and Save Data ####
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
