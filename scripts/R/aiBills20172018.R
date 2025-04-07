#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# AI POLICY ANALYSIS PROJECT
# Add AI Bills Data for 2017-2018
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
billList <- c("ACR-215", "SB-1470", "AB-2662", "AB-1809", "SB-843")

# Define the list to store the AI bills data for 2017-2018
aiBills20172018 <- list()

# Loop through each year in the AI Bill List and create a template for each bill
for (bill in billList) {
    id <- gsub("-", "", bill)
    # Call the function to add the bill structure
    aiBills20172018[[id]] <- addBillStructure(2017, bill)
}

# Remove unnecessary variables
rm(bill, id)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 4. Populate AI Bill Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### ACR-215 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20172018$ACR215$text)

# Topic from aiBills20172018$ACR215$status
aiBills20172018$ACR215$topic <- "ACR-215 23 Asilomar AI Principles"

# Title from aiBills20172018$ACR215$status
aiBills20172018$ACR215$title <- paste0(aiBills20172018$ACR215$title, "Relative to the 23 Asilomar AI Principles")

# tldr for aiBills20172018$ACR215$text
aiBills20172018$ACR215$tldr <- "ACR-215 recognizes the 23 Asilomar AI Principles, which are guidelines for the ethical development and use of artificial intelligence. These principles emphasize the importance of safety, transparency, accountability, and collaboration in AI research and applications. The resolution aims to promote responsible AI practices and ensure that AI technologies benefit humanity while minimizing risks."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20172018$ACR215$tags <- c("artificial-intelligence", "asilomar-ai-principles", "ethical-development", "guidelines", "safety", "transparency", "accountability", "collaboration", "responsible-ai-practices", "benefit-humanity")

# sponsors and cosponsors
aiBills20172018$ACR215$sponsors <- addSponsors("Y20172018", c("KileyA"))
aiBills20172018$ACR215$cosponsors <- addSponsors("Y20172018", c("AcostaA", "AguiarCurryA", "ArambulaA", "BakerA", "BermanA", "BigelowA", "BloomA", "BontaA", "BurkeA", "CaballeroA", "CalderonA", "CarrilloA", "ChauA", "ChavezA", "ChenA", "ChiuA", "ChuA", "CooleyA", "CooperA", "CunninghamA", "DahleA", "DalyA", "EggmanA", "FloraA", "FongA", "FrazierA", "FriedmanA", "GabrielA", "GallagherA", "GarciaEA", "GarciaCA", "GipsonA", "GloriaA", "GrayA", "GraysonA", "HarperA", "HoldenA", "IrwinA", "JonesSawyerA", "KalraA", "LackeyA", "LevineA", "LimonA", "LowA", "MaienscheinA", "MathisA", "MayesA", "McCartyA", "MelendezA", "MullinA", "MuratsuchiA", "NazarianA", "ODonnellA", "ObernolteA", "PattersonA", "QuirkA", "QuirkSilvaA", "RendonA", "ReyesA", "RivasA", "RodriguezA", "RubioA", "SalasA", "SantiagoA", "SteinorthA", "StoneA", "TingA", "VoepelA", "WaldronA", "WeberA", "WoodA"))

# dateStart, dateEnd, and dateUpdated
aiBills20172018$ACR215$dateStart <- as.Date("2018-04-05")
aiBills20172018$ACR215$dateEnd <- as.Date("2018-09-07")
aiBills20172018$ACR215$dateUpdated <- Sys.Date()
aiBills20172018$ACR215$version <- "Chaptered"
aiBills20172018$ACR215$outcome <- "Chaptered"
aiBills20172018$ACR215$chaptered <- TRUE
aiBills20172018$ACR215$chapterNo <- 286
aiBills20172018$ACR215$active <- FALSE
aiBills20172018$ACR215$result <- "Chaptered"
aiBills20172018$ACR215$vote <- "No Vote"
aiBills20172018$ACR215$appropriation <- FALSE
aiBills20172018$ACR215$fiscal <- FALSE
aiBills20172018$ACR215$local <- FALSE
aiBills20172018$ACR215$urgency <- FALSE
aiBills20172018$ACR215$tax <- FALSE
aiBills20172018$ACR215$action <- "Chaptered by Secretary of State. Chapter 286, Statutes of 2018"
aiBills20172018$ACR215$pdf <- "20170ACR215_97.pdf"

# AI properties assessed from the text in aiBills20172018$ACR215$text
aiBills20172018$ACR215$aiDisposition <- "Supportive"
aiBills20172018$ACR215$aiType <- "Principles and Guidelines"
aiBills20172018$ACR215$aiSector <- "Governance"
aiBills20172018$ACR215$aiSubSector <- "Policy and Regulation"
aiBills20172018$ACR215$aiDomain <- "Ethics"
aiBills20172018$ACR215$aiAccountability <- "Moderate"
aiBills20172018$ACR215$aiImpact <- "Moderate"
aiBills20172018$ACR215$aiEthics <- "Moderate"
aiBills20172018$ACR215$aiInnovation <- "Low"
aiBills20172018$ACR215$aiPrivacy <- "Low"
aiBills20172018$ACR215$aiTransparency <- "Moderate"

### SB-1470 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20172018$SB1470$text)

# Topic from aiBills20172018$SB1470$status
aiBills20172018$SB1470$topic <- "SB-1470 Commission on the Future of Work"

# Title from aiBills20172018$SB1470$status
aiBills20172018$SB1470$title <- paste0(aiBills20172018$SB1470$title, "An act to add Chapter 7.1 (commencing with Section 160) to Division 1 of the Labor Code, relating to employment development")

# tldr for aiBills20172018$SB1470$text
aiBills20172018$SB1470$tldr <- "SB-1470 establishes the Commission on the Future of Work to address the impact of technology, including artificial intelligence, on employment and the workforce. The commission will study and make recommendations on policies to ensure that workers are prepared for the changing job landscape and that the benefits of technological advancements are shared equitably. The bill aims to promote a fair and inclusive future of work in California."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20172018$SB1470$tags <- c("artificial-intelligence", "commission-on-the-future-of-work", "employment-development", "technology-impact", "workforce-preparation", "policy-recommendations", "equitable-benefits", "fair-and-inclusive-future")

# sponsors and cosponsors
aiBillData$Y20132014$SB1470$sponsors <- addSponsors("Y20172018", c("SternS"))
aiBills20172018$SB1470$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20172018$SB1470$dateStart <- as.Date("2018-02-16")
aiBills20172018$SB1470$dateEnd <- as.Date("2018-11-30")
aiBills20172018$SB1470$dateUpdated <- Sys.Date()

# measures
aiBills20172018$SB1470$version <- "Amended Assembly"
aiBills20172018$SB1470$outcome <- "Failed"
aiBills20172018$SB1470$chaptered <- FALSE
aiBills20172018$SB1470$chapterNo <- NA
aiBills20172018$SB1470$active <- FALSE
aiBills20172018$SB1470$result <- "Died"
aiBills20172018$SB1470$vote <- "Majority"
aiBills20172018$SB1470$appropriation <- FALSE
aiBills20172018$SB1470$fiscal <- TRUE
aiBills20172018$SB1470$local <- FALSE
aiBills20172018$SB1470$urgency <- FALSE
aiBills20172018$SB1470$tax <- FALSE
aiBills20172018$SB1470$action <- "From Assembly without further action"
aiBills20172018$SB1470$pdf <- "20170SB1470_98.pdf"

# AI properties assessed from the text in aiBills20172018$SB1470$text
aiBills20172018$SB1470$aiDisposition <- "Neutral"
aiBills20172018$SB1470$aiType <- "General"
aiBills20172018$SB1470$aiSector <- "Governance"
aiBills20172018$SB1470$aiSubSector <- "Policy and Regulation"
aiBills20172018$SB1470$aiDomain <- "Ethics"
aiBills20172018$SB1470$aiAccountability <- "Moderate"
aiBills20172018$SB1470$aiImpact <- "Moderate"
aiBills20172018$SB1470$aiEthics <- "Moderate"
aiBills20172018$SB1470$aiInnovation <- "Low"
aiBills20172018$SB1470$aiPrivacy <- "Low"
aiBills20172018$SB1470$aiTransparency <- "Moderate"

### AB-2662 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20172018$AB2662$text)

# Topic from aiBills20172018$AB2662$status
aiBills20172018$AB2662$topic <- "AB-2662 State government: Office of Planning and Research: electronic media: child development"

# Title from aiBills20172018$AB2662$status
aiBills20172018$AB2662$title <- paste0(aiBills20172018$AB2662$title, "AB-2662: An act to add Section 65040.16 to the Government Code, relating to state government, and making an appropriation therefor")

# tldr for aiBills20172018$AB2662$text
aiBills20172018$AB2662$tldr <- "AB-2662 establishes the Office of Planning and Research to develop and implement a comprehensive strategy for the use of electronic media in child development programs. The bill aims to enhance the effectiveness of child development initiatives through the integration of technology and digital resources. It emphasizes the importance of research, collaboration, and innovation in improving outcomes for children and families."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20172018$AB2662$tags <- c("artificial-intelligence", "state-government", "office-of-planning-and-research", "electronic-media", "child-development", "comprehensive-strategy", "technology-integration", "digital-resources", "research-and-collaboration", "innovation")

# sponsors and cosponsors
aiBills20172018$AB2662$sponsors <- addSponsors("Y20172018", c("ChauA"))
aiBills20172018$AB2662$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20172018$AB2662$dateStart <- as.Date("2018-02-15")
aiBills20172018$AB2662$dateEnd <- as.Date("2018-11-30")
aiBills20172018$AB2662$dateUpdated <- Sys.Date()

# measures
aiBills20172018$AB2662$version <- "Amended Assembly"
aiBills20172018$AB2662$outcome <- "Failed"
aiBills20172018$AB2662$chaptered <- FALSE
aiBills20172018$AB2662$chapterNo <- NA
aiBills20172018$AB2662$active <- FALSE
aiBills20172018$AB2662$result <- "Died"
aiBills20172018$AB2662$vote <- "Majority"
aiBills20172018$AB2662$appropriation <- TRUE
aiBills20172018$AB2662$fiscal <- TRUE
aiBills20172018$AB2662$local <- FALSE
aiBills20172018$AB2662$urgency <- FALSE
aiBills20172018$AB2662$tax <- FALSE
aiBills20172018$AB2662$action <- "From committee without further action"
aiBills20172018$AB2662$pdf <- "20170AB2662_97.pdf"

# AI properties assessed from the text in aiBills20172018$AB2662$text
aiBills20172018$AB2662$aiDisposition <- "Neutral"
aiBills20172018$AB2662$aiType <- "General"
aiBills20172018$AB2662$aiSector <- "Governance"
aiBills20172018$AB2662$aiSubSector <- "Policy and Regulation"
aiBills20172018$AB2662$aiDomain <- "Ethics"
aiBills20172018$AB2662$aiAccountability <- "Moderate"
aiBills20172018$AB2662$aiImpact <- "Moderate"
aiBills20172018$AB2662$aiEthics <- "Moderate"
aiBills20172018$AB2662$aiInnovation <- "Low"
aiBills20172018$AB2662$aiPrivacy <- "Low"
aiBills20172018$AB2662$aiTransparency <- "Moderate"

### AB-1809 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20172018$AB1809$text)

# Topic from aiBills20172018$AB1809$status
aiBills20172018$AB1809$topic <- "AB-1809 Higher education trailer bill"

# Title from aiBills20172018$AB1809$status
aiBills20172018$AB1809$title <- paste0(aiBills20172018$AB1809$title, "AB-1809: An act to amend Sections 8152, 8154, 19104.5, 52523, 66021.1, 66027.8, 68075.6, 69432, 69433.6, 69435.3, 70023, 70900, 70901, 72506, 76004, 76300, 76350, 78401, 79149.3, 79149.5, 82542, 84040.5, 84750.5, 84751, 84810.5, 84900, 84901, 84906, 84913, 84916, 99151, 99152, 99153, 99154, and 99162 of, to amend the heading of Article 9 (commencing with Section 84900) of Chapter 5 of Part 50 of Division 7 of Title 3 of, to amend and repeal Sections 84750.6, 84750.7, and 88912.5 of, to add Sections 66749.6, 66749.7, 78222, 79148.1, 79149.7, 84750.4, and 84750.41 to, to add Article 10 (commencing with Section 54800) to Chapter 9 of Part 29 of Division 4 of Title 2 of, to add Part 46.5 (commencing with Section 75000), Part 52.7 (commencing with Section 88670), and Part 54.82 (commencing with Section 88930) to Division 7 of Title 3 of, to add Article 2.5 (commencing with Section 92010) to Chapter 1 of Part 57 of Division 9 of Title 3 of, to add and repeal Section 89290.5 of, to repeal Sections 88910, 88912, and 88913 of, and to repeal and add Section 79149.1 of, the Education Code, to add Sections 22874.7 and 22958.4 to, and to add Article 7 (commencing with Section 65059.1) to Chapter 1.5 of Division 1 of Title 7 of, the Government Code, to amend Section 33492.78 of the Health and Safety Code, to amend Section 95 of the Revenue and Taxation Code, to add Section 18928 to the Welfare and Institutions Code, and to amend the Budget Act of 2017 by amending Item 6870-101-0001 of Section 2.00 of that act, relating to education, and making an appropriation therefor, to take effect immediately, bill related to the budget")

# tldr for aiBills20172018$AB1809$text
aiBills20172018$AB1809$tldr <- "AB-1809 is a higher education trailer bill that makes various amendments to the Education Code and other related codes. It includes provisions related to funding, program implementation, and administrative processes in higher education. The bill aims to streamline operations, enhance educational opportunities, and ensure compliance with state regulations. It also addresses budget-related matters and appropriations for educational programs."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20172018$AB1809$tags <- c("artificial-intelligence", "higher-education-trailer-bill", "education-finance", "funding", "program-implementation", "administrative-processes", "streamlining-operations", "educational-opportunities", "state-regulations", "budget-related-matters")

# sponsors and cosponsors
aiBills20172018$AB1809$sponsors <- addSponsors("Y20172018", c("CommitteeOnBudgetA", "TingA", "ArambulaA", "BloomA", "CaballeroA", "ChiuA", "CooperA", "JonesSawyerA", "LimonA", "McCartyA", "MedinaA", "MullinA", "MuratsuchiA", "ODonnellA", "RubioA", "StoneA", "WeberA", "WoodA"))
aiBills20172018$AB1809$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20172018$AB1809$dateStart <- as.Date("2018-01-10")
aiBills20172018$AB1809$dateEnd <- as.Date("2018-06-27")
aiBills20172018$AB1809$dateUpdated <- Sys.Date()

# measures
aiBills20172018$AB1809$version <- "Chaptered"
aiBills20172018$AB1809$outcome <- "Chaptered"
aiBills20172018$AB1809$chaptered <- TRUE
aiBills20172018$AB1809$chapterNo <- 33
aiBills20172018$AB1809$active <- FALSE
aiBills20172018$AB1809$result <- "Chaptered"
aiBills20172018$AB1809$vote <- "Majority"
aiBills20172018$AB1809$appropriation <- TRUE
aiBills20172018$AB1809$fiscal <- TRUE
aiBills20172018$AB1809$local <- TRUE
aiBills20172018$AB1809$urgency <- TRUE
aiBills20172018$AB1809$tax <- FALSE
aiBills20172018$AB1809$action <- "Chaptered by Secretary of State. Chapter 33, Statutes of 2018"
aiBills20172018$AB1809$pdf <- "20170AB1809_96.pdf"

# AI properties assessed from the text in aiBills20172018$AB1809$text
aiBills20172018$AB1809$aiDisposition <- "Neutral"
aiBills20172018$AB1809$aiType <- "Research and Development"
aiBills20172018$AB1809$aiSector <- "Education"
aiBills20172018$AB1809$aiSubSector <- "Postsecondary Education"
aiBills20172018$AB1809$aiDomain <- "Education"
aiBills20172018$AB1809$aiAccountability <- "Moderate"
aiBills20172018$AB1809$aiImpact <- "Moderate"
aiBills20172018$AB1809$aiEthics <- "Moderate"
aiBills20172018$AB1809$aiInnovation <- "Low"
aiBills20172018$AB1809$aiPrivacy <- "Low"
aiBills20172018$AB1809$aiTransparency <- "Low"

### SB-843 ####

# open the url for the bill text in the default web browser
#browseURL(aiBills20172018$SB843$text)

# Topic from aiBills20172018$SB843$status
aiBills20172018$SB843$topic <- "SB-843 Higher education trailer bill"

# Title from aiBills20172018$SB843$status
aiBills20172018$SB843$title <- paste0(aiBills20172018$SB843$title, "An act to amend Sections 8152, 8154, 19104.5, 52523, 66021.1, 66027.8, 68075.6, 69432, 69433.6, 69435.3, 70023, 70900, 70901, 72506, 76004, 76300, 76350, 78401, 79149.3, 79149.5, 82542, 84040.5, 84750.5, 84751, 84810.5, 84900, 84901, 84906, 84913, 84916, 99151, 99152, 99153, 99154, and 99162 of, to amend the heading of Article 9 (commencing with Section 84900) of Chapter 5 of Part 50 of Division 7 of Title 3 of, to amend and repeal Sections 84750.6, 84750.7, and 88912.5 of, to add Sections 66749.6, 66749.7, 78222, 79148.1, 79149.7, 84750.4, and 84750.41 to, to add Article 10 (commencing with Section 54800) to Chapter 9 of Part 29 of Division 4 of Title 2 of, to add Part 46.5 (commencing with Section 75000), Part 52.7 (commencing with Section 88670), and Part 54.82 (commencing with Section 88930) to Division 7 of Title 3 of, to add Article 2.5 (commencing with Section 92010) to Chapter 1 of Part 57 of Division 9 of Title 3 of, to add and repeal Section 89290.5 of, to repeal Sections 88910, 88912, and 88913 of, and to repeal and add Section 79149.1 of, the Education Code, to add Sections 22874.7 and 22958.4 to, and to add Article 7 (commencing with Section 65059.1) to Chapter 1.5 of Division 1 of Title 7 of, the Government Code, to amend Section 33492.78 of the Health and Safety Code, to amend Section 95 of the Revenue and Taxation Code, to add Section 18928 to the Welfare and Institutions Code, and to amend the Budget Act of 2017 by amending Item 6870-101-0001 of Section 2.00 of that act, relating to education, and making an appropriation therefor, to take effect immediately, bill related to the budget")

# tldr for aiBills20172018$SB843$text
aiBills20172018$SB843$tldr <- "SB-843 is a higher education trailer bill that makes various amendments to the Education Code and other related codes. It includes provisions related to funding, program implementation, and administrative processes in higher education. The bill aims to streamline operations, enhance educational opportunities, and ensure compliance with state regulations. It also addresses budget-related matters and appropriations for educational programs."

# tags (lowercase, words separated by dash, include "artificial-intelligence")
aiBills20172018$SB843$tags <- c("artificial-intelligence", "higher-education-trailer-bill", "education-finance", "funding", "program-implementation", "administrative-processes", "streamlining-operations", "educational-opportunities", "state-regulations", "budget-related-matters")

# sponsors and cosponsors
aiBills20172018$SB843$sponsors <- addSponsors("Y20172018", c("CommitteeOnBudgetAndFiscalReviewS"))
aiBills20172018$SB843$cosponsors <- NA

# dateStart, dateEnd, and dateUpdated
aiBills20172018$SB843$dateStart <- as.Date("2018-01-10")
aiBills20172018$SB843$dateEnd <- as.Date("2018-11-30")
aiBills20172018$SB843$dateUpdated <- Sys.Date()

# measures
aiBills20172018$SB843$version <- "Amended Assembly"
aiBills20172018$SB843$outcome <- "Failed"
aiBills20172018$SB843$chaptered <- FALSE
aiBills20172018$SB843$chapterNo <- NA
aiBills20172018$SB843$active <- FALSE
aiBills20172018$SB843$result <- "Died"
aiBills20172018$SB843$vote <- "Majority"
aiBills20172018$SB843$appropriation <- TRUE
aiBills20172018$SB843$fiscal <- TRUE
aiBills20172018$SB843$local <- TRUE
aiBills20172018$SB843$urgency <- TRUE
aiBills20172018$SB843$tax <- FALSE
aiBills20172018$SB843$action <- "From Assembly without further action"
aiBills20172018$SB843$pdf <- "20170SB843_98.pdf"

# AI properties assessed from the text in aiBills20172018$SB843$text
aiBills20172018$SB843$aiDisposition <- "Neutral"
aiBills20172018$SB843$aiType <- "General"
aiBills20172018$SB843$aiSector <- "Education"
aiBills20172018$SB843$aiSubSector <- "Postsecondary Education"
aiBills20172018$SB843$aiDomain <- "Education"
aiBills20172018$SB843$aiAccountability <- "Moderate"
aiBills20172018$SB843$aiImpact <- "Moderate"
aiBills20172018$SB843$aiEthics <- "Moderate"
aiBills20172018$SB843$aiInnovation <- "Low"
aiBills20172018$SB843$aiPrivacy <- "Low"
aiBills20172018$SB843$aiTransparency <- "Moderate"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 5. Export and Save Data ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Remove unnecessary variables
rm(billList)

# Export the dfCalMembers data frame to the data directory as an RData file
save(aiBills20172018, file = file.path(prjDirs$pathData, "aiBills20172018.RData"))

# Export the calMembers list to the data directory as an RData file
save(calMembers, file = file.path(prjDirs$pathData, "calMembers.RData"))

#~~~~~~~~~~~~~~~~~~~
# End of Script ####
#~~~~~~~~~~~~~~~~~~~
