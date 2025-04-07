#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# AI POLICY ANALYSIS PROJECT
# Add AI Bills Data for 2021-2022
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

# Define the list to store the AI bills data for 2021-2022
aiBills20212022 <- list()

## SB-1216 ####

aiBills20212022$SB1216 <- addBillStructure(2021, "SB-1216")

# open the url for the bill text in the default web browser
#browseURL(aiBills20212022$SB1216$text)

# Topic from aiBills20212022$SB1216$status
aiBills20212022$SB1216$topic <- "SB-1216 Secretary of Government Operations: deepfakes"

# Title from aiBills20212022$SB1216$status
aiBills20212022$SB1216$title <- paste0(aiBills20212022$SB1216$title, "An act to add and repeal Section 11547.5 of the Government Code, relating to technology")

# tldr for aiBills20212022$SB1216$text
aiBills20212022$SB1216$tldr <- "SB-1216 establishes regulations for the use of deepfake technology in California. It aims to prevent the malicious use of deepfakes that could harm individuals or mislead the public. The bill focuses on ensuring transparency and accountability in the use of deepfake technology, particularly in political and commercial contexts."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20212022$SB1216$tags <- c("artificial-intelligence", "deepfakes", "government-operations", "technology", "malicious-use", "transparency", "accountability", "political-context", "commercial-context")

# sponsors and cosponsors
aiBills20212022$SB1216$sponsors <- addSponsors("Y20212022", c("GonzalezS"))
aiBills20212022$SB1216$cosponsors <- addSponsors("Y20212022", c("BermanA"))

# dateStart, dateEnd, and dateUpdated
aiBills20212022$SB1216$dateStart <- as.Date("2022-02-27")
aiBills20212022$SB1216$dateEnd <- as.Date("2022-09-30")
aiBills20212022$SB1216$dateUpdated <- Sys.Date()

# measures
aiBills20212022$SB1216$version <- "Chaptered"
aiBills20212022$SB1216$outcome <- "Chaptered"
aiBills20212022$SB1216$chaptered <- TRUE
aiBills20212022$SB1216$chapterNo <- 885
aiBills20212022$SB1216$active <- FALSE
aiBills20212022$SB1216$result <- "Chaptered"
aiBills20212022$SB1216$vote <- "Majority"
aiBills20212022$SB1216$appropriation <- FALSE
aiBills20212022$SB1216$fiscal <- TRUE
aiBills20212022$SB1216$local <- FALSE
aiBills20212022$SB1216$urgency <- FALSE
aiBills20212022$SB1216$tax <- FALSE
aiBills20212022$SB1216$action <- "Chaptered by Secretary of State - Chapter 885, Statutes of 2022"
aiBills20212022$SB1216$pdf <- "20210SB1216_95.pdf"

# AI properties assessed from the text in aiBills20212022$SB1216$text
aiBills20212022$SB1216$aiDisposition <- "Restrictive"
aiBills20212022$SB1216$aiType <- "Cybersecurity"
aiBills20212022$SB1216$aiSector <- "Governance"
aiBills20212022$SB1216$aiSubSector <- "Operations"
aiBills20212022$SB1216$aiDomain <- "Security"
aiBills20212022$SB1216$aiAccountability <- "Moderate"
aiBills20212022$SB1216$aiImpact <- "Moderate"
aiBills20212022$SB1216$aiEthics <- "Moderate"
aiBills20212022$SB1216$aiInnovation <- "Low"
aiBills20212022$SB1216$aiPrivacy <- "Moderate"
aiBills20212022$SB1216$aiTransparency <- "High"

## AB-2224 ####

aiBills20212022$AB2224 <- addBillStructure(2021, "AB-2224")

# open the url for the bill text in the default web browser
#browseURL(aiBills20212022$AB2224$text)

# Topic from aiBills20212022$AB2224$status
aiBills20212022$AB2224$topic <- "AB-2224 Real estate: transactions: iBuyers"

# Title from aiBills20212022$AB2224$status
aiBills20212022$AB2224$title <- paste0(aiBills20212022$AB2224$title, "An act to add Chapter 3 (commencing with Section 11290) to Part 2 of Division 4 of the Business and Professions Code, relating to real estate")

# tldr for aiBills20212022$AB2224$text
aiBills20212022$AB2224$tldr <- "AB-2224 establishes regulations for iBuyer transactions in real estate. It aims to ensure transparency and fairness in the use of technology for buying and selling properties. The bill focuses on protecting consumers and promoting ethical practices in the real estate industry."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20212022$AB2224$tags <- c("artificial-intelligence", "real-estate", "transactions", "ibuyers", "business-and-professions-code", "transparency", "fairness", "technology", "consumer-protection", "ethical-practices")

# sponsors and cosponsors
aiBills20212022$AB2224$sponsors <- addSponsors("Y20212022", c("McCartyA"))
aiBills20212022$AB2224$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20212022$AB2224$dateStart <- as.Date("2022-02-15")
aiBills20212022$AB2224$dateEnd <- as.Date("2022-11-30")
aiBills20212022$AB2224$dateUpdated <- Sys.Date()

# measures
aiBills20212022$AB2224$version <- "Amended Assembly"
aiBills20212022$AB2224$outcome <- "Failed"
aiBills20212022$AB2224$chaptered <- FALSE
aiBills20212022$AB2224$chapterNo <- NA
aiBills20212022$AB2224$active <- FALSE
aiBills20212022$AB2224$result <- "Died"
aiBills20212022$AB2224$vote <- "Majority"
aiBills20212022$AB2224$appropriation <- FALSE
aiBills20212022$AB2224$fiscal <- FALSE
aiBills20212022$AB2224$local <- FALSE
aiBills20212022$AB2224$urgency <- FALSE
aiBills20212022$AB2224$tax <- FALSE
aiBills20212022$AB2224$action <- "From Senate committee without further action"
aiBills20212022$AB2224$pdf <- "20210AB2224_97.pdf"

# AI properties assessed from the text in aiBills20212022$AB2224$text
aiBills20212022$AB2224$aiDisposition <- "Restrictive"
aiBills20212022$AB2224$aiType <- "General"
aiBills20212022$AB2224$aiSector <- "Real Estate"
aiBills20212022$AB2224$aiSubSector <- "Transactions"
aiBills20212022$AB2224$aiDomain <- "Commerce"
aiBills20212022$AB2224$aiAccountability <- "Moderate"
aiBills20212022$AB2224$aiImpact <- "Moderate"
aiBills20212022$AB2224$aiEthics <- "Moderate"
aiBills20212022$AB2224$aiInnovation <- "Low"
aiBills20212022$AB2224$aiPrivacy <- "Moderate"
aiBills20212022$AB2224$aiTransparency <- "Moderate"

## AB-587 ####

aiBills20212022$AB587 <- addBillStructure(2021, "AB-587")

# open the url for the bill text in the default web browser
#browseURL(aiBills20212022$AB587$text)

# Topic from aiBills20212022$AB587$status
aiBills20212022$AB587$topic <- "AB-587 Social media companies: terms of service"

# Title from aiBills20212022$AB587$status
aiBills20212022$AB587$title <- paste0(aiBills20212022$AB587$title, "An act to add Chapter 22.8 (commencing with Section 22675) to Division 8 of the Business and Professions Code, relating to social media")

# tldr for aiBills20212022$AB587$text
aiBills20212022$AB587$tldr <- "AB-587 establishes regulations for social media companies regarding their terms of service. It aims to ensure transparency and fairness in the use of social media platforms. The bill focuses on protecting users' rights and promoting ethical practices in the social media industry."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20212022$AB587$tags <- c("artificial-intelligence", "social-media", "terms-of-service", "business-and-professions-code", "transparency", "fairness", "users-rights", "ethical-practices")

# sponsors and cosponsors
aiBills20212022$AB587$sponsors <- addSponsors("Y20212022", c("GabrielA"))
aiBills20212022$AB587$cosponsors <- addSponsors("Y20212022", c("CunninghamA", "BauerKahanA", "LeeA", "McCartyA", "PanS", "RivasRA", "SternS", "WardA", "WicksA", "WienerS"))

# dateStart, dateEnd, and dateUpdated
aiBills20212022$AB587$dateStart <- as.Date("2021-02-11")
aiBills20212022$AB587$dateEnd <- as.Date("2022-09-13")
aiBills20212022$AB587$dateUpdated <- Sys.Date()

# measures
aiBills20212022$AB587$version <- "Chaptered"
aiBills20212022$AB587$outcome <- "Chaptered"
aiBills20212022$AB587$chaptered <- TRUE
aiBills20212022$AB587$chapterNo <- 269
aiBills20212022$AB587$active <- FALSE
aiBills20212022$AB587$result <- "Chaptered"
aiBills20212022$AB587$vote <- "Majority"
aiBills20212022$AB587$appropriation <- FALSE
aiBills20212022$AB587$fiscal <- TRUE
aiBills20212022$AB587$local <- FALSE
aiBills20212022$AB587$urgency <- FALSE
aiBills20212022$AB587$tax <- FALSE
aiBills20212022$AB587$action <- "Chaptered by Secretary of State - Chapter 269, Statutes of 2022"
aiBills20212022$AB587$pdf <- "20210AB587_91.pdf"

# AI properties assessed from the text in aiBills20212022$AB587$text
aiBills20212022$AB587$aiDisposition <- "Restrictive"
aiBills20212022$AB587$aiType <- "General"
aiBills20212022$AB587$aiSector <- "Social Media"
aiBills20212022$AB587$aiSubSector <- "Terms of Service"
aiBills20212022$AB587$aiDomain <- "Social Media"
aiBills20212022$AB587$aiAccountability <- "High"
aiBills20212022$AB587$aiImpact <- "High"
aiBills20212022$AB587$aiEthics <- "High"
aiBills20212022$AB587$aiInnovation <- "Low"
aiBills20212022$AB587$aiPrivacy <- "High"
aiBills20212022$AB587$aiTransparency <- "High"

## SR-11 ####

aiBills20212022$SR11 <- addBillStructure(2021, "SR-11")

# open the url for the bill text in the default web browser
#browseURL(aiBills20212022$SR11$text)

# Topic from aiBills20212022$SR11$status
aiBills20212022$SR11$topic <- "SR-11 International Women’s Day"

# Title from aiBills20212022$SR11$status
aiBills20212022$SR11$title <- paste0(aiBills20212022$SR11$title, "Relative to International Women’s Day")

# tldr for aiBills20212022$SR11$text
aiBills20212022$SR11$tldr <- "designates March 8, 2021, as International Women’s Day in California, celebrating its historical roots in labor movements and activism for women’s rights. It highlights progress in gender equality, challenges like the gender digital divide, and the disproportionate impact of COVID-19 on women. The resolution emphasizes the importance of women’s leadership, innovation, and inclusion in shaping policies and technologies for a more equitable future."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20212022$SR11$tags <- c("artificial-intelligence", "international-womens-day", "labor-movements", "activism", "gender-equality", "gender-digital-divide", "covid-19", "women’s-rights", "leadership", "innovation", "inclusion", "equitable-future")

# sponsors and cosponsors
aiBills20212022$SR11$sponsors <- addSponsors("Y20212022", c("LeyvaS"))
aiBills20212022$SR11$cosponsors <- addSponsors("Y20212022", c("AtkinsS", "BatesS", "CaballeroS", "DurazoS", "EggmanS", "GonzalezS", "GroveS", "HurtadoS", "LimonS", "MelendezS", "BoghS", "RubioS", "SkinnerS"))

# dateStart, dateEnd, and dateUpdated
aiBills20212022$SR11$dateStart <- as.Date("2021-02-16")
aiBills20212022$SR11$dateEnd <- as.Date("2021-03-08")
aiBills20212022$SR11$dateUpdated <- Sys.Date()

# measures
aiBills20212022$SR11$version <- "Enrolled"
aiBills20212022$SR11$outcome <- "Enrolled"
aiBills20212022$SR11$chaptered <- FALSE
aiBills20212022$SR11$chapterNo <- NA
aiBills20212022$SR11$active <- TRUE
aiBills20212022$SR11$result <- "Passed"
aiBills20212022$SR11$vote <- "No Vote"
aiBills20212022$SR11$appropriation <- FALSE
aiBills20212022$SR11$fiscal <- FALSE
aiBills20212022$SR11$local <- FALSE
aiBills20212022$SR11$urgency <- FALSE
aiBills20212022$SR11$tax <- FALSE
aiBills20212022$SR11$action <- "Read. Adopted. (Ayes 35. Noes 0. Page 399.)"
aiBills20212022$SR11$pdf <- "20210SR11_98.pdf"

# AI properties assessed from the text in aiBills20212022$SR11$text
aiBills20212022$SR11$aiDisposition <- "Supportive"
aiBills20212022$SR11$aiType <- "General"
aiBills20212022$SR11$aiSector <- "Employment"
aiBills20212022$SR11$aiSubSector <- "Labor Movements"
aiBills20212022$SR11$aiDomain <- "Labor"
aiBills20212022$SR11$aiAccountability <- "Moderate"
aiBills20212022$SR11$aiImpact <- "Low"
aiBills20212022$SR11$aiEthics <- "Low"
aiBills20212022$SR11$aiInnovation <- "Low"
aiBills20212022$SR11$aiPrivacy <- "Low"
aiBills20212022$SR11$aiTransparency <- "Low"

## AB-2826 ####

aiBills20212022$AB2826 <- addBillStructure(2021, "AB-2826")

# open the url for the bill text in the default web browser
#browseURL(aiBills20212022$AB2826$text)

# Topic from aiBills20212022$AB2826$status
aiBills20212022$AB2826$topic <- "AB-2826 California Platform Accountability and Transparency Act"

# Title from aiBills20212022$AB2826$status
aiBills20212022$AB2826$title <- paste0(aiBills20212022$AB2826$title, "An act to add Chapter 5.9 (commencing with 11549.75) to Part 1 of Division 3 of Title 2 of the Government Code, relating to technology")

# tldr for aiBills20212022$AB2826$text
aiBills20212022$AB2826$tldr <- "AB-2826 establishes the California Platform Accountability and Transparency Act to regulate online platforms. It aims to ensure transparency and accountability in the use of technology by requiring platforms to disclose their algorithms and data practices. The bill focuses on protecting users' rights and promoting ethical practices in the digital space."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20212022$AB2826$tags <- c("artificial-intelligence", "platform-accountability", "transparency-act", "technology", "online-platforms", "data-practices", "users-rights", "ethical-practices")

# sponsors and cosponsors
aiBills20212022$AB2826$sponsors <- addSponsors("Y20212022", c("MuratsuchiA"))
aiBills20212022$AB2826$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20212022$AB2826$dateStart <- as.Date("2021-02-18")
aiBills20212022$AB2826$dateEnd <- as.Date("2022-11-30")
aiBills20212022$AB2826$dateUpdated <- Sys.Date()

# measures
aiBills20212022$AB2826$version <- "Amended Assembly"
aiBills20212022$AB2826$outcome <- "Failed"
aiBills20212022$AB2826$chaptered <- FALSE
aiBills20212022$AB2826$chapterNo <- NA
aiBills20212022$AB2826$active <- FALSE
aiBills20212022$AB2826$result <- "Died"
aiBills20212022$AB2826$vote <- "Majority"
aiBills20212022$AB2826$appropriation <- FALSE
aiBills20212022$AB2826$fiscal <- TRUE
aiBills20212022$AB2826$local <- FALSE
aiBills20212022$AB2826$urgency <- FALSE
aiBills20212022$AB2826$tax <- FALSE
aiBills20212022$AB2826$action <- "From committee without further action"
aiBills20212022$AB2826$pdf <- "20210AB2826_98.pdf"

# AI properties assessed from the text in aiBills20212022$AB2826$text
aiBills20212022$AB2826$aiDisposition <- "Restrictive"
aiBills20212022$AB2826$aiType <- "General"
aiBills20212022$AB2826$aiSector <- "Technology"
aiBills20212022$AB2826$aiSubSector <- "Platform Accountability"
aiBills20212022$AB2826$aiDomain <- "Digital Space"
aiBills20212022$AB2826$aiAccountability <- "High"
aiBills20212022$AB2826$aiImpact <- "High"
aiBills20212022$AB2826$aiEthics <- "High"
aiBills20212022$AB2826$aiInnovation <- "Low"
aiBills20212022$AB2826$aiPrivacy <- "High"
aiBills20212022$AB2826$aiTransparency <- "High"

## AB-1545 ####

aiBills20212022$AB1545 <- addBillStructure(2021, "AB-1545")

# open the url for the bill text in the default web browser
#browseURL(aiBills20212022$AB1545$text)

# Topic from aiBills20212022$AB1545$status
aiBills20212022$AB1545$topic <- "AB-1545 Children: internet safety: platform operators"

# Title from aiBills20212022$AB1545$status
aiBills20212022$AB1545$title <- paste0(aiBills20212022$AB1545$title, "An act to add Title 1.81.7 (commencing with Section 1798.300) to Part 4 of Division 3 of the Civil Code, relating to business")

# tldr for aiBills20212022$AB1545$text
aiBills20212022$AB1545$tldr <- "AB-1545 establishes regulations for platform operators regarding children's internet safety. It aims to ensure that online platforms prioritize the safety and privacy of minors. The bill focuses on implementing design features that promote safe online experiences for children, including data protection and age-appropriate content."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20212022$AB1545$tags <- c("artificial-intelligence", "children-internet-safety", "platform-operators", "business", "online-safety", "privacy", "minors", "data-protection", "age-appropriate-content")

# sponsors and cosponsors
aiBills20212022$AB1545$sponsors <- addSponsors("Y20212022", c("WicksA"))
aiBills20212022$AB1545$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20212022$AB1545$dateStart <- as.Date("2021-02-19")
aiBills20212022$AB1545$dateEnd <- as.Date("2022-02-01")
aiBills20212022$AB1545$dateUpdated <- Sys.Date()

# measures
aiBills20212022$AB1545$version <- "Amended Assembly"
aiBills20212022$AB1545$outcome <- "Failed"
aiBills20212022$AB1545$chaptered <- FALSE
aiBills20212022$AB1545$chapterNo <- NA
aiBills20212022$AB1545$active <- FALSE
aiBills20212022$AB1545$result <- "Died"
aiBills20212022$AB1545$vote <- "Majority"
aiBills20212022$AB1545$appropriation <- FALSE
aiBills20212022$AB1545$fiscal <- TRUE
aiBills20212022$AB1545$local <- FALSE
aiBills20212022$AB1545$urgency <- FALSE
aiBills20212022$AB1545$tax <- FALSE
aiBills20212022$AB1545$action <- "From committee: Filed with the Chief Clerk pursuant to Joint Rule 56"
aiBills20212022$AB1545$pdf <- "20210AB1545_97.pdf"

# AI properties assessed from the text in aiBills20212022$AB1545$text
aiBills20212022$AB1545$aiDisposition <- "Restrictive"
aiBills20212022$AB1545$aiType <- "Safety and Privacy"
aiBills20212022$AB1545$aiSector <- "Children's Safety"
aiBills20212022$AB1545$aiSubSector <- "Online Safety"
aiBills20212022$AB1545$aiDomain <- "Safety and Privacy"
aiBills20212022$AB1545$aiAccountability <- "High"
aiBills20212022$AB1545$aiImpact <- "High"
aiBills20212022$AB1545$aiEthics <- "High"
aiBills20212022$AB1545$aiInnovation <- "Low"
aiBills20212022$AB1545$aiPrivacy <- "High"
aiBills20212022$AB1545$aiTransparency <- "High"

## AB-1400 ####

aiBills20212022$AB1400 <- addBillStructure(2021, "AB-1400")

# open the url for the bill text in the default web browser
#browseURL(aiBills20212022$AB1400$text)

# Topic from aiBills20212022$AB1400$status
aiBills20212022$AB1400$topic <- "AB-1400 Guaranteed Health Care for All"

# Title from aiBills20212022$AB1400$status
aiBills20212022$AB1400$title <- paste0(aiBills20212022$AB1400$title, "An act to add Title 23 (commencing with Section 100600) to the Government Code, relating to health care coverage, and making an appropriation therefor")

# tldr for aiBills20212022$AB1400$text
aiBills20212022$AB1400$tldr <- "AB-1400 establishes the Guaranteed Health Care for All program in California. It aims to provide comprehensive health care coverage to all residents, ensuring access to necessary medical services without financial barriers. The bill focuses on creating a single-payer health care system that prioritizes equity and affordability."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20212022$AB1400$tags <- c("artificial-intelligence", "guaranteed-health-care", "health-care-coverage", "government-code", "single-payer-system", "equity", "affordability", "comprehensive-health-care")

# sponsors and cosponsors
aiBills20212022$AB1400$sponsors <- addSponsors("Y20212022", c("KalraA", "LeeA", "SantiagoA"))
aiBills20212022$AB1400$cosponsors <- addSponsors("Y20212022", c("BryanA", "CarrilloA", "ChiuA", "GonzalezS", "McGuireS", "TingA", "WienerS", "BeckerS", "BontaMA", "CorteseS", "FriedmanA", "KamlagerS", "LairdS", "McCartyA", "NazarianA", "RivasLA", "WicksA", "WieckowskiS"))

# dateStart, dateEnd, and dateUpdated
aiBills20212022$AB1400$dateStart <- as.Date("2021-02-19")
aiBills20212022$AB1400$dateEnd <- as.Date("2022-02-01")
aiBills20212022$AB1400$dateUpdated <- Sys.Date()

# measures
aiBills20212022$AB1400$version <- "Amended Assembly"
aiBills20212022$AB1400$outcome <- "Failed"
aiBills20212022$AB1400$chaptered <- FALSE
aiBills20212022$AB1400$chapterNo <- NA
aiBills20212022$AB1400$active <- FALSE
aiBills20212022$AB1400$result <- "Died"
aiBills20212022$AB1400$vote <- "Majority"
aiBills20212022$AB1400$appropriation <- TRUE
aiBills20212022$AB1400$fiscal <- TRUE
aiBills20212022$AB1400$local <- FALSE
aiBills20212022$AB1400$urgency <- FALSE
aiBills20212022$AB1400$tax <- FALSE
aiBills20212022$AB1400$action <- "Died on third reading file"
aiBills20212022$AB1400$pdf <- "20210AB1400_98.pdf"

# AI properties assessed from the text in aiBills20212022$AB1400$text
aiBills20212022$AB1400$aiDisposition <- "Restrictive"
aiBills20212022$AB1400$aiType <- "Medical"
aiBills20212022$AB1400$aiSector <- "Health Care"
aiBills20212022$AB1400$aiSubSector <- "Health Coverage"
aiBills20212022$AB1400$aiDomain <- "Health Care"
aiBills20212022$AB1400$aiAccountability <- "High"
aiBills20212022$AB1400$aiImpact <- "High"
aiBills20212022$AB1400$aiEthics <- "High"
aiBills20212022$AB1400$aiInnovation <- "Low"
aiBills20212022$AB1400$aiPrivacy <- "High"
aiBills20212022$AB1400$aiTransparency <- "High"

## SB-54 ####

aiBills20212022$SB54 <- addBillStructure(2021, "SB-54")

# open the url for the bill text in the default web browser
#browseURL(aiBills20212022$SB54$text)

# Topic from aiBills20212022$SB54$status
aiBills20212022$SB54$topic <- "SB-54 Solid waste: reporting, packaging, and plastic food service ware"

# Title from aiBills20212022$SB54$status
aiBills20212022$SB54$title <- paste0(aiBills20212022$SB54$title, "An act to amend Section 41821.5 of, to add Chapter 3 (commencing with Section 42040) to Part 3 of Division 30 of, and to repeal Section 42064 of, the Public Resources Code, relating to solid waste")

# tldr for aiBills20212022$SB54$text
aiBills20212022$SB54$tldr <- "SB-54 establishes regulations for solid waste management in California. It aims to improve reporting, packaging, and plastic food service ware practices. The bill focuses on reducing plastic waste and promoting sustainable materials in the food service industry."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20212022$SB54$tags <- c("artificial-intelligence", "solid-waste", "reporting", "packaging", "plastic-food-service-ware", "public-resources-code", "sustainable-materials", "plastic-waste")

# sponsors and cosponsors
aiBills20212022$SB54$sponsors <- addSponsors("Y20212022", c("AllenS", "HertzbergS", "RivasLA", "SkinnerS", "SternS", "WienerS"))
aiBills20212022$SB54$cosponsors <- addSponsors("Y20212022", c("FriedmanA", "GonzalezS", "GraysonA", "MuratsuchiA", "TingA", "BeckerS", "BoernerHorvathA", "CarrilloA", "IrwinA", "KamlagerS", "McCartyA", "WoodA"))

# dateStart, dateEnd, and dateUpdated
aiBills20212022$SB54$dateStart <- as.Date("2020-12-07")
aiBills20212022$SB54$dateEnd <- as.Date("2022-06-30")
aiBills20212022$SB54$dateUpdated <- Sys.Date()

# measures
aiBills20212022$SB54$version <- "Chaptered"
aiBills20212022$SB54$outcome <- "Chaptered"
aiBills20212022$SB54$chaptered <- TRUE
aiBills20212022$SB54$chapterNo <- 75
aiBills20212022$SB54$active <- FALSE
aiBills20212022$SB54$result <- "Chaptered"
aiBills20212022$SB54$vote <- "Two Thirds"
aiBills20212022$SB54$appropriation <- FALSE
aiBills20212022$SB54$fiscal <- TRUE
aiBills20212022$SB54$local <- TRUE
aiBills20212022$SB54$urgency <- FALSE
aiBills20212022$SB54$tax <- FALSE
aiBills20212022$SB54$action <- "Chaptered by Secretary of State - Chapter 75, Statutes of 2022"
aiBills20212022$SB54$pdf <- "20210SB54_93.pdf"

# AI properties assessed from the text in aiBills20212022$SB54$text
aiBills20212022$SB54$aiDisposition <- "Restrictive"
aiBills20212022$SB54$aiType <- "General"
aiBills20212022$SB54$aiSector <- "Solid Waste Management"
aiBills20212022$SB54$aiSubSector <- "Plastic Waste Reduction"
aiBills20212022$SB54$aiDomain <- "Waste Management"
aiBills20212022$SB54$aiAccountability <- "High"
aiBills20212022$SB54$aiImpact <- "High"
aiBills20212022$SB54$aiEthics <- "High"
aiBills20212022$SB54$aiInnovation <- "Low"
aiBills20212022$SB54$aiPrivacy <- "High"
aiBills20212022$SB54$aiTransparency <- "High"

## AB-1651 ####

aiBills20212022$AB1651 <- addBillStructure(2021, "AB-1651")

# open the url for the bill text in the default web browser
#browseURL(aiBills20212022$AB1651$text)

# Topic from aiBills20212022$AB1651$status
aiBills20212022$AB1651$topic <- "AB-1651 Worker rights: Workplace Technology Accountability Act"

# Title from aiBills20212022$AB1651$status
aiBills20212022$AB1651$title <- paste0(aiBills20212022$AB1651$title, "An act to amend Sections 12930 and 14203 of the Government Code, and to amend Section 90.5 of, and to add Part 5.6 (commencing with Section 1520) to Division 2 of, the Labor Code, relating to employment")

# tldr for aiBills20212022$AB1651$text
aiBills20212022$AB1651$tldr <- "AB-1651 establishes the Workplace Technology Accountability Act to protect worker rights in the face of advancing technology. It aims to ensure that employers are accountable for the use of technology in the workplace, particularly regarding surveillance and data collection practices. The bill focuses on promoting transparency and fairness in the use of technology that affects employees."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20212022$AB1651$tags <- c("artificial-intelligence", "worker-rights", "workplace-technology", "accountability-act", "employment", "surveillance", "data-collection", "transparency", "fairness")

# sponsors and cosponsors
aiBills20212022$AB1651$sponsors <- addSponsors("Y20212022", c("KalraA"))
aiBills20212022$AB1651$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20212022$AB1651$dateStart <- as.Date("2022-01-13")
aiBills20212022$AB1651$dateEnd <- as.Date("2022-11-30")
aiBills20212022$AB1651$dateUpdated <- Sys.Date()

# measures
aiBills20212022$AB1651$version <- "Amended Assembly"
aiBills20212022$AB1651$outcome <- "Failed"
aiBills20212022$AB1651$chaptered <- FALSE
aiBills20212022$AB1651$chapterNo <- NA
aiBills20212022$AB1651$active <- FALSE
aiBills20212022$AB1651$result <- "Died"
aiBills20212022$AB1651$vote <- "Majority"
aiBills20212022$AB1651$appropriation <- FALSE
aiBills20212022$AB1651$fiscal <- TRUE
aiBills20212022$AB1651$local <- FALSE
aiBills20212022$AB1651$urgency <- FALSE
aiBills20212022$AB1651$tax <- FALSE
aiBills20212022$AB1651$action <- "From committee without further action"
aiBills20212022$AB1651$pdf <- "20210AB1651_98.pdf"

# AI properties assessed from the text in aiBills20212022$AB1651$text
aiBills20212022$AB1651$aiDisposition <- "Restrictive"
aiBills20212022$AB1651$aiType <- "General"
aiBills20212022$AB1651$aiSector <- "Workplace Technology"
aiBills20212022$AB1651$aiSubSector <- "Worker Rights"
aiBills20212022$AB1651$aiDomain <- "Employment"
aiBills20212022$AB1651$aiAccountability <- "High"
aiBills20212022$AB1651$aiImpact <- "High"
aiBills20212022$AB1651$aiEthics <- "High"
aiBills20212022$AB1651$aiInnovation <- "Low"
aiBills20212022$AB1651$aiPrivacy <- "High"
aiBills20212022$AB1651$aiTransparency <- "High"

## AB-178 ####

aiBills20212022$AB178 <- addBillStructure(2021, "AB-178")

# open the url for the bill text in the default web browser
#browseURL(aiBills20212022$AB178$text)

# Topic from aiBills20212022$AB178$status
aiBills20212022$AB178$topic <- "AB-178 Budget Act of 2022"

# Title from aiBills20212022$AB178$status
aiBills20212022$AB178$title <- paste0(aiBills20212022$AB178$title, "An act to amend the Budget Act of 2022 by amending Items 0250-001-0001, 0250-001-3066, 0250-101-0001, 0250-101-0932, 0250-102-0159, 0250-102-0932, 0250-111-0001, 0250-113-0001, 0250-114-0001, 0250-115-0001, 0500-001-0001, 0509-001-0001, 0509-101-0001, 0509-101-3398, 0509-102-0001, 0511-001-0001, 0515-103-0001, 0515-105-0001, 0521-131-0001, 0530-001-0001, 0540-101-0001, 0540-102-0001, 0540-490, 0559-001-0001, 0650-001-0001, 0650-101-0001, 0690-001-0001, 0690-012-0001, 0690-101-0001, 0690-101-0890, 0690-490, 0820-001-0001, 0820-490, 0840-001-0001, 0840-001-9740, 0890-001-0001, 0954-101-0001, 0977-101-0001, 0985-220-0001, 1111-011-0001, 1115-001-3288, 1115-004-0001, 1115-102-0001, 1701-001-0001, 2240-104-0001, 2240-105-0001, 2240-106-0001, 2240-110-0001, 2240-111-0001, 2240-121-0001, 2240-122-0001, 2240-124-0001, 2240-125-0001, 2240-126-0001, 2660-302-0890, 2740-001-0044, 2740-490, 3125-001-0001, 3125-001-0568, 3340-001-0001, 3340-001-6088, 3355-001-0462, 3360-101-0001, 3480-001-0001, 3480-102-0001, 3540-001-0001, 3540-301-0001, 3540-301-0660, 3540-492, 3600-001-0001, 3720-001-0001, 3760-101-3228, 3760-105-0001, 3790-001-0001, 3790-002-0392, 3790-002-6088, 3790-003-0001, 3790-005-0001, 3790-101-0001, 3790-102-0001, 3790-301-0001, 3790-301-0263, 3790-491, 3790-492, 3855-001-8120, 3860-001-0001, 3860-101-0001, 3900-001-0115, 3900-101-0001, 3930-490, 3940-106-0001, 3960-001-0014, 3970-001-0001, 3970-101-3228, 4140-001-0001, 4140-001-3085, 4140-101-0001, 4140-101-3085, 4170-001-0001, 4170-101-0001, 4260-001-0001, 4260-101-0001, 4260-101-0890, 4260-115-0890, 4260-116-3397, 4260-101-3085, 4265-001-0001, 4265-001-3385, 4265-111-0001, 4265-111-3385, 4300-001-0001, 4300-101-0001, 4560-001-3085, 4560-101-3085, 4800-101-3381, 5160-001-0001, 5160-001-3397, 5175-101-0890, 5175-101-8004, 5180-001-0001, 5180-101-0001, 5180-101-0890, 5180-111-0001, 5180-141-0001, 5180-151-0001, 5180-151-0890, 5225-001-0001, 5225-002-0001, 5225-019-0001, 5225-020-0001, 5225-021-3398, 5227-119-0001, 5227-121-0001, 5227-124-0001, 6100-001-0001, 6100-004-0001, 6100-107-0001, 6100-110-0001, 6100-161-0001, 6100-161-0890, 6100-172-0001, 6100-194-0001, 6100-196-0001, 6100-220-0001, 6100-488, 6120-161-0001, 6360-001-0001, 6360-001-0408, 6440-001-0001, 6610-001-0001, 6610-002-0001, 6870-001-0001, 6870-101-0001, 6870-403, 6980-001-0001, 6980-101-0001, 7100-001-0001, 7100-001-0588, 7120-001-0001, 7120-101-0001, 7350-001-0001, 7350-001-3152, 7501-001-0001, 7730-001-0001, 7730-490, 7760-311-0001, 7870-001-0214, 7870-101-0001, 7870-111-0001, 8120-002-0001, 8120-491, 8260-101-0001, 8570-002-0001, 8570-102-0001, 8820-101-0001, 8880-001-9740, and 8940-301-0001 of Section 2.00 of, adding Items 0509-102-3398, 0690-006-0001, 0775-001-3085, 0840-001-3228, 0957-113-0001, 0974-113-0001, 2240-002-0890, 2240-102-0890, 2240-492, 3340-101-0001, 3360-002-0001, 3360-102-0001, 3540-101-0001, 3600-002-3288, 3600-005-0001, 3720-001-3228, 3760-102-0001, 3790-006-0001, 3790-012-0001, 3810-102-0001, 3845-102-0001, 3855-101-0001, 3860-001-3398, 3900-002-3228, 3900-101-3228, 3930-002-3288, 3930-102-3288, 3940-002-3288, 3940-101-0439, 4700-001-3398, 4700-101-3398, 5225-017-0001, 5225-022-0001, 5227-118-0001, 5227-123-0001, 6100-485, 7100-001-3288, 7100-004-0001, 7501-001-3085, 7600-002-3288, 7760-015-0001, 8880-011-0001, and 8880-011-9740 to Section 2.00 of, repealing Items 0511-002-0001, 0957-001-0001, 0957-101-0001, 2240-123-0001, 4260-011-3397, and 8570-101-3398 of Section 2.00 of, amending Sections 11.96, 12.00, 12.32, 19.54, 19.55, 20.00, 35.50, 39.00, and 99.50 of, adding Section 19.56 to, and repealing Sections 6.15 and 35.70 of, that act, relating to the state budget, and making an appropriation therefor, to take effect immediately, budget bill")

# tldr for aiBills20212022$AB178$text
aiBills20212022$AB178$tldr <- "AB-178 is the Budget Act of 2022, which outlines the state's budgetary allocations and appropriations. It includes provisions for various state departments and programs, ensuring funding for essential services and initiatives. The bill focuses on fiscal responsibility and effective resource management to support California's needs."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20212022$AB178$tags <- c("artificial-intelligence", "budget-act", "state-budget", "appropriations", "fiscal-responsibility", "resource-management", "essential-services")

# sponsors and cosponsors
aiBills20212022$AB178$sponsors <- addSponsors("Y20212022", c("TingA"))
aiBills20212022$AB178$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20212022$AB178$dateStart <- as.Date("2022-01-08")
aiBills20212022$AB178$dateEnd <- as.Date("2022-06-30")
aiBills20212022$AB178$dateUpdated <- Sys.Date()

# measures
aiBills20212022$AB178$version <- "Chaptered"
aiBills20212022$AB178$outcome <- "Chaptered"
aiBills20212022$AB178$chaptered <- TRUE
aiBills20212022$AB178$chapterNo <- 45
aiBills20212022$AB178$active <- FALSE
aiBills20212022$AB178$result <- "Chaptered"
aiBills20212022$AB178$vote <- "Majority"
aiBills20212022$AB178$appropriation <- TRUE
aiBills20212022$AB178$fiscal <- TRUE
aiBills20212022$AB178$local <- FALSE
aiBills20212022$AB178$urgency <- TRUE
aiBills20212022$AB178$tax <- FALSE
aiBills20212022$AB178$action <- "Chaptered by Secretary of State - Chapter 45, Statutes of 2022"
aiBills20212022$AB178$pdf <- "20210AB178_95.pdf"

# AI properties assessed from the text in aiBills20212022$AB178$text
aiBills20212022$AB178$aiDisposition <- "Restrictive"
aiBills20212022$AB178$aiType <- "General"
aiBills20212022$AB178$aiSector <- "Budget"
aiBills20212022$AB178$aiSubSector <- "State Budget"
aiBills20212022$AB178$aiDomain <- "Budget Management"
aiBills20212022$AB178$aiAccountability <- "High"
aiBills20212022$AB178$aiImpact <- "High"
aiBills20212022$AB178$aiEthics <- "High"
aiBills20212022$AB178$aiInnovation <- "Low"
aiBills20212022$AB178$aiPrivacy <- "High"
aiBills20212022$AB178$aiTransparency <- "High"

## AB-179 ####

aiBills20212022$AB179 <- addBillStructure(2021, "AB-179")

# open the url for the bill text in the default web browser
#browseURL(aiBills20212022$AB179$text)

# Topic from aiBills20212022$AB179$status
aiBills20212022$AB179$topic <- "AB-179 Budget Act of 2022"

# Title from aiBills20212022$AB179$status
aiBills20212022$AB179$title <- paste0(aiBills20212022$AB179$title, "An act to amend the Budget Act of 2022 (Chs. 43 and 45, Stats. 2022) by amending Items 0250-001-0001, 0250-101-0001, 0250-101-0932, 0250-111-0001, 0250-162-8506, 0250-301-0001, 0509-001-0001, 0509-101-0001, 0509-102-3398, 0509-104-0001, 0509-112-0001, 0511-001-0001, 0521-001-0042, 0521-001-0044, 0521-001-0046, 0521-001-0890, 0530-001-0001, 0540-001-0001, 0540-101-0001, 0540-490, 0540-492, 0540-495, 0650-001-0001, 0650-001-0890, 0650-101-0001, 0690-001-0001, 0690-003-0001, 0690-004-0001, 0690-012-0001, 0690-101-0001, 0890-001-0001, 0954-101-0001, 0985-220-0001, 2240-001-0001, 2240-102-0001, 2240-104-0001, 2240-110-0001, 2240-111-0001, 2240-121-0001, 2240-122-0001, 2240-124-0001, 2240-125-0001, 2240-126-0001, 2660-490, 3340-001-0001, 3340-003-0001, 3360-001-0465, 3360-001-0890, 3360-001-3062, 3360-002-0001, 3360-102-0001, 3480-001-3046, 3480-101-0001, 3480-491, 3480-492, 3540-001-0001, 3540-003-0001, 3540-101-0001, 3560-001-0001, 3600-001-0001, 3600-006-0001, 3600-007-0001, 3720-001-0001, 3790-001-0001, 3790-101-0263, 3790-101-3001, 3790-301-0001, 3790-301-3312, 3790-491, 3790-493, 3790-496, 3810-103-0001, 3835-101-0001, 3860-001-0001, 3860-001-3398, 3860-101-0001, 3900-001-0001, 3900-001-3228, 3900-002-3228, 3900-101-0001, 3900-101-3228, 3900-102-3228, 3930-001-0001, 3940-001-0001, 3970-001-0001, 3970-001-0133, 3970-101-0001, 3970-101-0133, 3970-101-3228, 4140-101-0001, 4140-101-3085, 4170-001-0001, 4170-101-0001, 4260-001-0001, 4260-101-0001, 4260-116-0890, 4265-001-0001, 4265-021-3398, 4265-111-0001, 4265-491, 4300-001-0890, 4300-101-0890, 4440-003-0001, 5180-001-0001, 5180-101-0001, 5180-101-0890, 5180-141-0001, 5180-151-0001, 5225-008-0001, 5225-018-0001, 5225-019-0001, 5225-022-0001, 5227-001-0001, 5227-119-0001, 6100-001-0001, 6100-004-0001, 6100-006-0001, 6100-009-0001, 6100-107-0001, 6100-112-0890, 6100-134-0890, 6100-137-0890, 6100-161-0890, 6100-195-0890, 6100-203-0001, 6100-296-0001, 6100-491, 6120-161-0001, 6360-001-0001, 6360-001-0408, 6440-001-0001, 6440-005-0001, 6870-101-0001, 6870-201-0001, 7120-001-0001, 7120-001-0890, 7350-001-0001, 7350-001-0890, 7502-001-9730, 7760-001-0001, 8260-001-0001, 8570-001-0001, 8570-002-0001, 8570-102-0001, 8570-490, 8660-001-0462, 8660-001-0890, 8660-101-0464, 8660-101-0470, 8955-001-0001, and 9210-104-0001 of Section 2.00 of, adding Items 0509-492, 0540-103-0001, 0820-101-0001, 2667-001-0046, 2720-301-0660, 3125-101-0001, 3340-002-0001, 3360-001-3228, 3360-004-0001, 3360-005-0001, 3360-007-0001, 3360-101-3228, 3360-104-0001, 3360-107-0001, 3480-103-0001, 3480-494, 3540-102-0001, 3600-102-0001, 3600-495, 3640-002-0001, 3640-103-0001, 3760-001-0001, 3760-103-0001, 3760-106-0001, 3810-001-0001, 3810-104-0001, 3825-001-0001, 3825-102-0001, 3830-101-0001, 3845-001-0001, 3845-101-0001, 3850-101-0001, 3850-495, 3855-102-0001, 3875-101-0001, 3940-002-0001, 3940-493, 3970-001-3408, 3970-011-0133, 3970-492, 5225-496, 6440-492, 6610-490, 6870-302-6087, 6870-492, 7350-002-0001, 7502-011-0890, 7600-011-0001, 8260-491, 8570-102-3228, and 8660-001-0001 to Section 2.00 of, repealing Item 0775-001-3085 of Section 2.00 of, amending Sections 8.75, 11.96, 15.14, 19.56, 39.00, and 99.50 of, adding Sections 19.58 and 39.10 to, and repealing Section 19.55 of, that act, relating to the state budget, and making an appropriation therefor, to take effect immediately, budget bill")

# tldr for aiBills20212022$AB179$text
aiBills20212022$AB179$tldr <- "AB-179 is the Budget Act of 2022, which outlines the state's budgetary allocations and appropriations. It includes provisions for various state departments and programs, ensuring funding for essential services and initiatives. The bill focuses on fiscal responsibility and effective resource management to support California's needs."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20212022$AB179$tags <- c("artificial-intelligence", "budget-act", "state-budget", "appropriations", "fiscal-responsibility", "resource-management", "essential-services")

# sponsors and cosponsors
aiBills20212022$AB179$sponsors <- addSponsors("Y20212022", c("TingA"))
aiBills20212022$AB179$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20212022$AB179$dateStart <- as.Date("2022-01-08")
aiBills20212022$AB179$dateEnd <- as.Date("2022-06-30")
aiBills20212022$AB179$dateUpdated <- Sys.Date()

# measures
aiBills20212022$AB179$version <- "Chaptered"
aiBills20212022$AB179$outcome <- "Chaptered"
aiBills20212022$AB179$chaptered <- TRUE
aiBills20212022$AB179$chapterNo <- 249
aiBills20212022$AB179$active <- FALSE
aiBills20212022$AB179$result <- "Chaptered"
aiBills20212022$AB179$vote <- "Majority"
aiBills20212022$AB179$appropriation <- TRUE
aiBills20212022$AB179$fiscal <- TRUE
aiBills20212022$AB179$local <- FALSE
aiBills20212022$AB179$urgency <- TRUE
aiBills20212022$AB179$tax <- FALSE
aiBills20212022$AB179$action <- "Chaptered by Secretary of State - Chapter 249, Statutes of 2022"
aiBills20212022$AB179$pdf <- "20210AB179_95.pdf"

# AI properties assessed from the text in aiBills20212022$AB179$text
aiBills20212022$AB179$aiDisposition <- "Restrictive"
aiBills20212022$AB179$aiType <- "General"
aiBills20212022$AB179$aiSector <- "Budget"
aiBills20212022$AB179$aiSubSector <- "State Budget"
aiBills20212022$AB179$aiDomain <- "Budget Management"
aiBills20212022$AB179$aiAccountability <- "High"
aiBills20212022$AB179$aiImpact <- "High"
aiBills20212022$AB179$aiEthics <- "High"
aiBills20212022$AB179$aiInnovation <- "Low"
aiBills20212022$AB179$aiPrivacy <- "High"
aiBills20212022$AB179$aiTransparency <- "High"

## SB-179 ####

aiBills20212022$SB179 <- addBillStructure(2021, "SB-179")

# open the url for the bill text in the default web browser
#browseURL(aiBills20212022$SB179$text)

# Topic from aiBills20212022$SB179$status
aiBills20212022$SB179$topic <- "SB-179 Budget Act of 2022"

# Title from aiBills20212022$SB179$status
aiBills20212022$SB179$title <- paste0(aiBills20212022$SB179$title, "An act to to amend the Budget Act of 2022 (Chs. 43 and 45, Stats. 2022) by amending Items 0250-001-0001, 0250-101-0001, 0250-101-0932, 0250-111-0001, 0250-162-8506, 0250-301-0001, 0509-001-0001, 0509-102-3398, 0509-104-0001, 0509-112-0001, 0511-001-0001, 0521-001-0042, 0521-001-0044, 0521-001-0046, 0521-001-0890, 0530-001-0001, 0540-001-0001, 0540-101-0001, 0540-490, 0540-492, 0540-495, 0650-001-0001, 0650-001-0890, 0650-101-0001, 0690-001-0001, 0690-003-0001, 0690-004-0001, 0690-012-0001, 0690-101-0001, 0890-001-0001, 0954-101-0001, 0985-220-0001, 2240-001-0001, 2240-104-0001, 2240-110-0001, 2240-111-0001, 2240-121-0001, 2240-122-0001, 2240-124-0001, 2240-125-0001, 2240-126-0001, 2660-490, 3340-001-0001, 3340-003-0001, 3360-001-0465, 3360-001-0890, 3360-001-3062, 3360-002-0001, 3360-102-0001, 3480-001-3046, 3480-101-0001, 3480-491, 3480-492, 3540-001-0001, 3540-003-0001, 3540-101-0001, 3560-001-0001, 3600-001-0001, 3600-006-0001, 3600-007-0001, 3720-001-0001, 3790-001-0001, 3790-101-0263, 3790-101-3001, 3790-301-0001, 3790-301-3312, 3790-491, 3790-493, 3790-496, 3810-103-0001, 3835-101-0001, 3860-001-0001, 3860-001-3398, 3860-101-0001, 3900-001-0001, 3900-001-3228, 3900-002-3228, 3900-101-0001, 3900-101-3228, 3900-102-3228, 3930-001-0001, 3940-001-0001, 3970-001-0001, 3970-001-0133, 3970-101-0001, 3970-101-0133, 3970-101-3228, 4140-101-0001, 4140-101-3085, 4170-001-0001, 4170-101-0001, 4260-001-0001, 4260-101-0001, 4260-116-0890, 4265-001-0001, 4265-021-3398, 4265-111-0001, 4265-491, 4300-001-0890, 4300-101-0890, 4440-003-0001, 5180-001-0001, 5180-101-0001, 5180-101-0890, 5180-141-0001, 5180-151-0001, 5225-008-0001, 5225-018-0001, 5225-019-0001, 5225-022-0001, 5227-001-0001, 5227-119-0001, 6100-001-0001, 6100-004-0001, 6100-006-0001, 6100-009-0001, 6100-107-0001, 6100-112-0890, 6100-134-0890, 6100-137-0890, 6100-161-0890, 6100-195-0890, 6100-203-0001, 6100-296-0001, 6100-491, 6120-161-0001, 6360-001-0001, 6360-001-0408, 6440-001-0001, 6440-005-0001, 6870-101-0001, 6870-201-0001, 7120-001-0001, 7120-001-0890, 7350-001-0001, 7350-001-0890, 7502-001-9730, 7760-001-0001, 8260-001-0001, 8570-001-0001, 8570-002-0001, 8570-102-0001, 8570-490, 8660-001-0462, 8660-001-0890, 8660-101-0464, 8660-101-0470, 8955-001-0001, and 9210-104-0001 of Section 2.00 of, adding Items 0509-492, 0540-103-0001, 0820-101-0001, 2240-102-0001, 2667-001-0046, 2720-301-0660, 3125-101-0001, 3340-002-0001, 3360-001-3228, 3360-004-0001, 3360-005-0001, 3360-007-0001, 3360-101-3228, 3360-104-0001, 3360-107-0001, 3480-103-0001, 3480-494, 3540-102-0001, 3600-102-0001, 3600-495, 3640-002-0001, 3640-103-0001, 3760-001-0001, 3760-103-0001, 3760-106-0001, 3810-001-0001, 3810-104-0001, 3825-001-0001, 3825-102-0001, 3830-101-0001, 3845-001-0001, 3845-101-0001, 3850-101-0001, 3850-495, 3855-102-0001, 3875-101-0001, 3940-002-0001, 3940-493, 3970-001-3408, 3970-011-0133, 3970-492, 5225-496, 6440-492, 6610-490, 6870-302-6087, 6870-492, 7350-002-0001, 7502-011-0890, 7600-011-0001, 8260-491, 8570-102-3228, and 8660-001-0001 to Section 2.00 of, repealing Item 0775-001-3085 of Section 2.00 of, amending Sections 8.75, 11.96, 15.14, 19.56, 39.00, and 99.50 of, adding Sections 19.58 and 39.10 to, and repealing Section 19.55 of, that act, relating to the state budget, and making an appropriation therefor, to take effect immediately, budget bill")

# tldr for aiBills20212022$SB179$text
aiBills20212022$SB179$tldr <- "SB-179 is the Budget Act of 2022, which outlines the state's budgetary allocations and appropriations. It includes provisions for various state departments and programs, ensuring funding for essential services and initiatives. The bill focuses on fiscal responsibility and effective resource management to support California's needs."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20212022$SB179$tags <- c("artificial-intelligence", "budget-act", "state-budget", "appropriations", "fiscal-responsibility", "resource-management", "essential-services")

# sponsors and cosponsors
aiBills20212022$SB179$sponsors <- addSponsors("Y20212022", c("SkinnerS"))
aiBills20212022$SB179$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20212022$SB179$dateStart <- as.Date("2022-01-08")
aiBills20212022$SB179$dateEnd <- as.Date("2022-11-30")
aiBills20212022$SB179$dateUpdated <- Sys.Date()

# measures
aiBills20212022$SB179$version <- "Amended Assembly"
aiBills20212022$SB179$outcome <- "Failed"
aiBills20212022$SB179$chaptered <- FALSE
aiBills20212022$SB179$chapterNo <- NA
aiBills20212022$SB179$active <- FALSE
aiBills20212022$SB179$result <- "Died"
aiBills20212022$SB179$vote <- "Majority"
aiBills20212022$SB179$appropriation <- TRUE
aiBills20212022$SB179$fiscal <- TRUE
aiBills20212022$SB179$local <- FALSE
aiBills20212022$SB179$urgency <- TRUE
aiBills20212022$SB179$tax <- FALSE
aiBills20212022$SB179$action <- "Died on the inactive file"
aiBills20212022$SB179$pdf <- "20210SB179_96.pdf"

# AI properties assessed from the text in aiBills20212022$SB179$text
aiBills20212022$SB179$aiDisposition <- "Restrictive"
aiBills20212022$SB179$aiType <- "General"
aiBills20212022$SB179$aiSector <- "Budget"
aiBills20212022$SB179$aiSubSector <- "State Budget"
aiBills20212022$SB179$aiDomain <- "Budget Management"
aiBills20212022$SB179$aiAccountability <- "High"
aiBills20212022$SB179$aiImpact <- "High"
aiBills20212022$SB179$aiEthics <- "High"
aiBills20212022$SB179$aiInnovation <- "Low"
aiBills20212022$SB179$aiPrivacy <- "High"
aiBills20212022$SB179$aiTransparency <- "High"

## SB-178 ####

aiBills20212022$SB178 <- addBillStructure(2021, "SB-178")

# open the url for the bill text in the default web browser
#browseURL(aiBills20212022$SB178$text)

# Topic from aiBills20212022$SB178$status
aiBills20212022$SB178$topic <- "SB-178 Budget Act of 2022"

# Title from aiBills20212022$SB178$status
aiBills20212022$SB178$title <- paste0(aiBills20212022$SB178$title, "An act to amend the Budget Act of 2022 by amending Items 0250-001-0001, 0250-001-3066, 0250-101-0001, 0250-101-0932, 0250-102-0159, 0250-102-0932, 0250-111-0001, 0250-113-0001, 0250-114-0001, 0250-115-0001, 0500-001-0001, 0509-001-0001, 0509-101-0001, 0509-101-3398, 0509-102-0001, 0511-001-0001, 0515-103-0001, 0515-105-0001, 0521-131-0001, 0530-001-0001, 0540-101-0001, 0540-102-0001, 0540-490, 0559-001-0001, 0650-001-0001, 0650-101-0001, 0690-001-0001, 0690-012-0001, 0690-101-0001, 0690-101-0890, 0690-490, 0820-001-0001, 0820-490, 0840-001-0001, 0840-001-9740, 0890-001-0001, 0954-101-0001, 0977-101-0001, 0985-220-0001, 1111-011-0001, 1115-001-3288, 1115-004-0001, 1115-102-0001, 1701-001-0001, 2240-104-0001, 2240-105-0001, 2240-106-0001, 2240-110-0001, 2240-111-0001, 2240-121-0001, 2240-122-0001, 2240-124-0001, 2240-125-0001, 2240-126-0001, 2660-302-0890, 2740-001-0044, 2740-490, 3125-001-0001, 3125-001-0568, 3340-001-0001, 3340-001-6088, 3355-001-0462, 3360-101-0001, 3480-001-0001, 3480-102-0001, 3540-001-0001, 3540-301-0001, 3540-301-0660, 3540-492, 3600-001-0001, 3720-001-0001, 3760-101-3228, 3760-105-0001, 3790-001-0001, 3790-002-0392, 3790-002-6088, 3790-003-0001, 3790-005-0001, 3790-101-0001, 3790-102-0001, 3790-301-0001, 3790-301-0263, 3790-491, 3790-492, 3855-001-8120, 3860-001-0001, 3860-101-0001, 3900-001-0115, 3900-101-0001, 3930-490, 3940-106-0001, 3960-001-0014, 3970-001-0001, 3970-101-3228, 4140-001-0001, 4140-001-3085, 4140-101-0001, 4140-101-3085, 4170-001-0001, 4170-101-0001, 4260-001-0001, 4260-101-0001, 4260-101-0890, 4260-115-0890, 4260-116-3397, 4260-101-3085, 4265-001-0001, 4265-001-3385, 4265-111-0001, 4265-111-3385, 4300-001-0001, 4300-101-0001, 4560-001-3085, 4560-101-3085, 4800-101-3381, 5160-001-0001, 5160-001-3397, 5175-101-0890, 5175-101-8004, 5180-001-0001, 5180-101-0001, 5180-101-0890, 5180-111-0001, 5180-141-0001, 5180-151-0001, 5180-151-0890, 5225-001-0001, 5225-002-0001, 5225-019-0001, 5225-020-0001, 5225-021-3398, 5227-119-0001, 5227-121-0001, 5227-124-0001, 6100-001-0001, 6100-004-0001, 6100-107-0001, 6100-110-0001, 6100-161-0001, 6100-161-0890, 6100-172-0001, 6100-194-0001, 6100-196-0001, 6100-220-0001, 6100-488, 6120-161-0001, 6360-001-0001, 6360-001-0408, 6440-001-0001, 6610-001-0001, 6610-002-0001, 6870-001-0001, 6870-101-0001, 6870-403, 6980-001-0001, 6980-101-0001, 7100-001-0001, 7100-001-0588, 7120-001-0001, 7120-101-0001, 7350-001-0001, 7350-001-3152, 7501-001-0001, 7730-001-0001, 7730-490, 7760-311-0001, 7870-001-0214, 7870-101-0001, 7870-111-0001, 8120-002-0001, 8120-491, 8260-101-0001, 8570-002-0001, 8570-102-0001, 8820-101-0001, 8880-001-9740, and 8940-301-0001 of Section 2.00 of, adding Items 0509-102-3398, 0690-006-0001, 0775-001-3085, 0840-001-3228, 0957-113-0001, 0974-113-0001, 2240-002-0890, 2240-102-0890, 2240-492, 3340-101-0001, 3360-002-0001, 3360-102-0001, 3540-101-0001, 3600-002-3288, 3600-005-0001, 3720-001-3228, 3760-102-0001, 3790-006-0001, 3790-012-0001, 3810-102-0001, 3845-102-0001, 3855-101-0001, 3860-001-3398, 3900-002-3228, 3900-101-3228, 3930-002-3288, 3930-102-3288, 3940-002-3288, 3940-101-0439, 4700-001-3398, 4700-101-3398, 5225-017-0001, 5225-022-0001, 5227-118-0001, 5227-123-0001, 6100-485, 7100-001-3288, 7100-004-0001, 7501-001-3085, 7600-002-3288, 7760-015-0001, 8880-011-0001, and 8880-011-9740 to Section 2.00 of, repealing Items 0511-002-0001, 0957-001-0001, 0957-101-0001, 2240-123-0001, 4260-011-3397, and 8570-101-3398 of Section 2.00 of, amending Sections 11.96, 12.00, 12.32, 19.54, 19.55, 20.00, 35.50, 39.00, and 99.50 of, adding Section 19.56 to, and repealing Sections 6.15 and 35.70 of, that act, relating to the state budget, and making an appropriation therefor, to take effect immediately, budget bill")

# tldr for aiBills20212022$SB178$text
aiBills20212022$SB178$tldr <- "SB-178 is the Budget Act of 2022, which outlines the state's budgetary allocations and appropriations. It includes provisions for various state departments and programs, ensuring funding for essential services and initiatives. The bill focuses on fiscal responsibility and effective resource management to support California's needs."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20212022$SB178$tags <- c("artificial-intelligence", "budget-act", "state-budget", "appropriations", "fiscal-responsibility", "resource-management", "essential-services")

# sponsors and cosponsors
aiBills20212022$SB178$sponsors <- addSponsors("Y20212022", c("SkinnerS"))
aiBills20212022$SB178$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20212022$SB178$dateStart <- as.Date("2022-01-08")
aiBills20212022$SB178$dateEnd <- as.Date("2022-11-30")
aiBills20212022$SB178$dateUpdated <- Sys.Date()

# measures
aiBills20212022$SB178$version <- "Amended Assembly"
aiBills20212022$SB178$outcome <- "Failed"
aiBills20212022$SB178$chaptered <- FALSE
aiBills20212022$SB178$chapterNo <- NA
aiBills20212022$SB178$active <- FALSE
aiBills20212022$SB178$result <- "Died"
aiBills20212022$SB178$vote <- "Majority"
aiBills20212022$SB178$appropriation <- TRUE
aiBills20212022$SB178$fiscal <- TRUE
aiBills20212022$SB178$local <- FALSE
aiBills20212022$SB178$urgency <- TRUE
aiBills20212022$SB178$tax <- FALSE
aiBills20212022$SB178$action <- "From Assembly without further action"
aiBills20212022$SB178$pdf <- "20210SB178_98.pdf"

# AI properties assessed from the text in aiBills20212022$SB178$text
aiBills20212022$SB178$aiDisposition <- "Restrictive"
aiBills20212022$SB178$aiType <- "General"
aiBills20212022$SB178$aiSector <- "Budget"
aiBills20212022$SB178$aiSubSector <- "State Budget"
aiBills20212022$SB178$aiDomain <- "Budget Management"
aiBills20212022$SB178$aiAccountability <- "High"
aiBills20212022$SB178$aiImpact <- "High"
aiBills20212022$SB178$aiEthics <- "High"
aiBills20212022$SB178$aiInnovation <- "Low"
aiBills20212022$SB178$aiPrivacy <- "High"
aiBills20212022$SB178$aiTransparency <- "High"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 4. Export and Save Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Remove unnecessary variables
rm(billList)

# Export the dfCalMembers data frame to the data directory as an RData file
save(aiBills20212022, file = file.path(prjDirs$pathData, "aiBills20212022.RData"))

# Export the calMembers list to the data directory as an RData file
save(calMembers, file = file.path(prjDirs$pathData, "calMembers.RData"))

#~~~~~~~~~~~~~~~~~~~
# End of Script ####
#~~~~~~~~~~~~~~~~~~~
