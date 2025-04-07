#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# AI POLICY ANALYSIS PROJECT
# Add AI Bills Data for 2013-2014
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

# Define the list to store the AI bills data for 2013-2014
aiBills20132014 <- list()

## SB-836 ####

aiBills20132014$SB836 <- addBillStructure(2013, "SB-836")

# open the url for the bill text in the default web browser
#browseURL(aiBills20132014$SB836$text)

# Topic from aiBills20132014$SB836$status
aiBills20132014$SB836$topic <- "SB-836 Brain research: Cal-BRAIN program"

# Title from aiBills20132014$SB836$status
aiBills20132014$SB836$title <- paste0(aiBills20132014$SB836$title, "An act to add Chapter 15 (commencing with Section 92985) to Part 57 of Division 9 of Title 3 of the Education Code, relating to brain research.")

# tldr for aiBills20132014$SB836$text
aiBills20132014$SB836$tldr <- "SB-836 establishes the California Brain Research through Advancing Innovative Neurotechnologies (Cal-BRAIN) program to support research and development of neurotechnologies for brain disorders. The program aims to advance understanding of the brain and improve treatments for brain-related conditions. It is a collaborative effort involving various stakeholders, including state agencies, research institutions, and private organizations."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20132014$SB836$tags <- c("artificial-intelligence", "brain-research", "cal-brain-program", "neurotechnologies", "brain-disorders", "research-and-development", "collaboration", "state-agencies", "research-institutions", "private-organizations")

# sponsors and cosponsors
aiBills20132014$SB836$sponsors <- addSponsors("Y20132014", c("CorbettS"))
aiBills20132014$SB836$cosponsors <- addSponsors("Y20132014", c("AndersonS", "BeallS", "BlockS", "CannellaS", "CorreaS", "EvansS", "GalgianiS", "HancockS", "HillS", "LaraS", "LieuS", "LiuS", "NielsenS", "RothS", "WolkS", "SkinnerA", "WaldronA"))

# dateStart, dateEnd, and dateUpdated
aiBills20132014$SB836$dateStart <- as.Date("2014-01-06")
aiBills20132014$SB836$dateEnd <- as.Date("2014-11-30")
aiBills20132014$SB836$dateUpdated <- Sys.Date()

# measures
aiBills20132014$SB836$version <- "Amended Senate"
aiBills20132014$SB836$outcome <- "Failed"
aiBills20132014$SB836$chaptered <- FALSE
aiBills20132014$SB836$chapterNo <- NA
aiBills20132014$SB836$active <- FALSE
aiBills20132014$SB836$result <- "Died"
aiBills20132014$SB836$vote <- "Majority"
aiBills20132014$SB836$appropriation <- FALSE
aiBills20132014$SB836$fiscal <- FALSE
aiBills20132014$SB836$local <- FALSE
aiBills20132014$SB836$urgency <- FALSE
aiBills20132014$SB836$tax <- FALSE
aiBills20132014$SB836$action <- "From Assembly without further action"
aiBills20132014$SB836$pdf <- "20130SB83695AMD.pdf"

# AI properties assessed from the text in aiBills20132014$SB836$text
aiBills20132014$SB836$aiDisposition <- "Supportive"
aiBills20132014$SB836$aiType <- "Research and Development"
aiBills20132014$SB836$aiSector <- "Health"
aiBills20132014$SB836$aiSubSector <- "Neuroscience"
aiBills20132014$SB836$aiDomain <- "Neuroscience"
aiBills20132014$SB836$aiAccountability <- "Moderate"
aiBills20132014$SB836$aiImpact <- "Moderate"
aiBills20132014$SB836$aiEthics <- "Moderate"
aiBills20132014$SB836$aiInnovation <- "Low"
aiBills20132014$SB836$aiPrivacy <- "Low"
aiBills20132014$SB836$aiTransparency <- "Moderate"

## SB-860 ####

aiBills20132014$SB860 <- addBillStructure(2013, "SB-860")

# open the url for the bill text in the default web browser
#browseURL(aiBills20132014$SB860$text)

# Topic from aiBills20132014$SB860$status
aiBills20132014$SB860$topic <- "SB-860 Education finance: education omnibus trailer bill"

# Title from aiBills20132014$SB860$status
aiBills20132014$SB860$title <- paste0(aiBills20132014$SB860$title, "An act to amend Sections 69432, 69432.7, 69433.6, 70022, 70023, 79200, 81821, 84321.6, 84750.5, 84751, 87482, 89295, 92493, 92494, 92495, 92495.5, and 92675 of, to amend the heading of Article 5 (commencing with Section 79200) of Chapter 9 of Part 48 of Division 7 of Title 3 of, to add Sections 79204, 79205, 79206, 79207, 79208, 79209, 84750.6, 84754.6, 89712, 90083, 92495.6, and 94102.1 to, to add Article 1.5 (commencing with Section 78220) to Chapter 2 of Part 48 of Division 7 of Title 3 of, to add Article 5 (commencing with Section 89770) to Chapter 6 of Part 55 of Division 8 of Title 3 of, and to add Chapter 15 (commencing with Section 92985) to Part 57 of Division 9 of Title 3 of, the Education Code, to amend Sections 17581.7 and 68926.3 of the Government Code, to amend Section 13146 of the Health and Safety Code, and to amend Sections 10726 and 10742 of the Public Contract Code, relating to postsecondary education, and making an appropriation therefor, to take effect immediately, bill related to the budget.")

# tldr for aiBills20132014$SB860$text
aiBills20132014$SB860$tldr <- "SB-860 is an education omnibus trailer bill that makes various amendments to the Education Code and other related codes. It includes provisions related to postsecondary education, funding, and program implementation. The bill aims to streamline processes, enhance educational opportunities, and ensure compliance with state regulations. It also addresses budget-related matters and appropriations for educational programs."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20132014$SB860$tags <- c("artificial-intelligence", "education-finance", "education-omnibus-trailer-bill", "postsecondary-education", "funding", "program-implementation", "streamlining-processes", "educational-opportunities", "state-regulations", "budget-related-matters")

# sponsors and cosponsors
aiBills20132014$SB860$sponsors <- addSponsors("Y20132014", c("CommitteeOnBudgetAndFiscalReviewS"))
aiBills20132014$SB860$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20132014$SB860$dateStart <- as.Date("2014-01-09")
aiBills20132014$SB860$dateEnd <- as.Date("2014-06-20")
aiBills20132014$SB860$dateUpdated <- Sys.Date()

# measures
aiBills20132014$SB860$version <- "Chaptered"
aiBills20132014$SB860$outcome <- "Chaptered"
aiBills20132014$SB860$chaptered <- TRUE
aiBills20132014$SB860$chapterNo <- 34
aiBills20132014$SB860$active <- FALSE
aiBills20132014$SB860$result <- "Chaptered"
aiBills20132014$SB860$vote <- "Majority"
aiBills20132014$SB860$appropriation <- TRUE
aiBills20132014$SB860$fiscal <- TRUE
aiBills20132014$SB860$local <- TRUE
aiBills20132014$SB860$urgency <- TRUE
aiBills20132014$SB860$tax <- FALSE
aiBills20132014$SB860$action <- "Chaptered by Secretary of State. Chapter 34, Statutes of 2014"
aiBills20132014$SB860$pdf <- "20130SB86096CHP.pdf"

# AI properties assessed from the text in aiBills20132014$SB860$text
aiBills20132014$SB860$aiDisposition <- "Neutral"
aiBills20132014$SB860$aiType <- "Research and Development"
aiBills20132014$SB860$aiSector <- "Education"
aiBills20132014$SB860$aiSubSector <- "Postsecondary Education"
aiBills20132014$SB860$aiDomain <- "Education"
aiBills20132014$SB860$aiAccountability <- "Moderate"
aiBills20132014$SB860$aiImpact <- "Moderate"
aiBills20132014$SB860$aiEthics <- "Low"
aiBills20132014$SB860$aiInnovation <- "Moderate"
aiBills20132014$SB860$aiPrivacy <- "Moderate"
aiBills20132014$SB860$aiTransparency <- "Moderate"

## AB-1465 ####

aiBills20132014$AB1465 <- addBillStructure(2013, "AB-1465")

# open the url for the bill text in the default web browser
#browseURL(aiBills20132014$AB1465$text)

# Topic from aiBills20132014$AB1465$status
aiBills20132014$AB1465$topic <- "AB-1465 Education finance: education omnibus trailer bill"

# Title from aiBills20132014$AB1465$status
aiBills20132014$AB1465$title <- paste0(aiBills20132014$AB1465$title, "An act to amend Sections 69432, 69432.7, 69433.6, 70022, 70023, 79200, 81821, 84321.6, 84750.5, 84751, 87482, 89295, 92493, 92494, 92495, 92495.5, and 92675 of, to amend the heading of Article 5 (commencing with Section 79200) of Chapter 9 of Part 48 of Division 7 of Title 3 of, to add Sections 79204, 79205, 79206, 79207, 79208, 79209, 84750.6, 84754.6, 89712, 90083, 92495.6, and 94102.1 to, to add Article 1.5 (commencing with Section 78220) to Chapter 2 of Part 48 of Division 7 of Title 3 of, to add Article 5 (commencing with Section 89770) to Chapter 6 of Part 55 of Division 8 of Title 3 of, and to add Chapter 15 (commencing with Section 92985) to Part 57 of Division 9 of Title 3 of, the Education Code, to amend Sections 17581.7 and 68926.3 of the Government Code, to amend Section 13146 of the Health and Safety Code, and to amend Sections 10726 and 10742 of the Public Contract Code, relating to postsecondary education, and making an appropriation therefor, to take effect immediately, bill related to the budget")

# tldr for aiBills20132014$AB1465$text
aiBills20132014$AB1465$tldr <- "AB-1465 is an education omnibus trailer bill that makes various amendments to the Education Code and other related codes. It includes provisions related to postsecondary education, funding, and program implementation. The bill aims to streamline processes, enhance educational opportunities, and ensure compliance with state regulations. It also addresses budget-related matters and appropriations for educational programs."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20132014$AB1465$tags <- c("artificial-intelligence", "education-finance", "education-omnibus-trailer-bill", "postsecondary-education", "funding", "program-implementation", "streamlining-processes", "educational-opportunities", "state-regulations", "budget-related-matters")

# sponsors and cosponsors
aiBills20132014$AB1465$sponsors <- addSponsors("Y20132014", c("CommitteeOnBudgetA", "SkinnerA", "BloomA", "CamposA", "ChesbroA", "DababnehA", "DalyA", "DickinsonA", "GordonA", "JonesSawyerA", "MullinA", "MuratsuchiA", "NazarianA", "RodriguezA", "StoneA", "TingA", "WeberA"))
aiBills20132014$AB1465$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20132014$AB1465$dateStart <- as.Date("2014-01-09")
aiBills20132014$AB1465$dateEnd <- as.Date("2014-11-30")
aiBills20132014$AB1465$dateUpdated <- Sys.Date()

# measures
aiBills20132014$AB1465$version <- "Amended Senate"
aiBills20132014$AB1465$outcome <- "Failed"
aiBills20132014$AB1465$chaptered <- FALSE
aiBills20132014$AB1465$chapterNo <- NA
aiBills20132014$AB1465$active <- FALSE
aiBills20132014$AB1465$result <- "Died"
aiBills20132014$AB1465$vote <- "Majority"
aiBills20132014$AB1465$appropriation <- TRUE
aiBills20132014$AB1465$fiscal <- TRUE
aiBills20132014$AB1465$local <- TRUE
aiBills20132014$AB1465$urgency <- TRUE
aiBills20132014$AB1465$tax <- FALSE
aiBills20132014$AB1465$action <- "Died on inactive file"
aiBills20132014$AB1465$pdf <- "20130AB146598AMD.pdf"

# AI properties assessed from the text in aiBills20132014$AB1465$text
aiBills20132014$AB1465$aiDisposition <- "Neutral"
aiBills20132014$AB1465$aiType <- "Education and Training"
aiBills20132014$AB1465$aiSector <- "Education"
aiBills20132014$AB1465$aiSubSector <- "Postsecondary Education"
aiBills20132014$AB1465$aiDomain <- "Education"
aiBills20132014$AB1465$aiAccountability <- "Moderate"
aiBills20132014$AB1465$aiImpact <- "Moderate"
aiBills20132014$AB1465$aiEthics <- "Low"
aiBills20132014$AB1465$aiInnovation <- "Moderate"
aiBills20132014$AB1465$aiPrivacy <- "Moderate"
aiBills20132014$AB1465$aiTransparency <- "Moderate"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 4. Export and Save Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Remove unnecessary variables
rm(billList)

# Export the dfCalMembers data frame to the data directory as an RData file
save(aiBills20132014, file = file.path(prjDirs$pathData, "aiBills20132014.RData"))

# Export the calMembers list to the data directory as an RData file
save(calMembers, file = file.path(prjDirs$pathData, "calMembers.RData"))

#~~~~~~~~~~~~~~~~~~~
# End of Script ####
#~~~~~~~~~~~~~~~~~~~
