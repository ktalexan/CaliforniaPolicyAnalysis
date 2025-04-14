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




aiBillsList <- read_json(file.path(prjDirs$pathMetadata, "listBillsAI.json"), simplifyVector = TRUE)






#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


aiBillData20132014 <- createBillData("2013-2014")
aiBillData20172018 <- createBillData("2017-2018")
aiBillData20192020 <- createBillData("2019-2020")
aiBillData20212022 <- createBillData("2021-2022")
aiBillData20232024 <- createBillData("2023-2024")
aiBillData20252026 <- createBillData("2025-2026")


datasetList$Y20252026$dataset_hash
file.path(prjDirs$pathData, "LegiScan", "datasets", "2025-2026", "hash.md5")

# read the file contents of the hash.md5 file
readLines(file.path(prjDirs$pathData, "LegiScan", "datasets", "2025-2026", "hash.md5"), warn = FALSE)



checkHash(datasetList$Y20132014)
checkHash(datasetList$Y20172018)
checkHash(datasetList$Y20192020)
checkHash(datasetList$Y20212022)
checkHash(datasetList$Y20232024)
checkHash(datasetList$Y20252026)

storeDatasetData(datasetList$Y20132014)
storeDatasetData(datasetList$Y20172018)
storeDatasetData(datasetList$Y20192020)
storeDatasetData(datasetList$Y20212022)
storeDatasetData(datasetList$Y20232024)
storeDatasetData(datasetList$Y20252026)

# Construct the URL for the LegiScan API session list
#opUrlDataset <- "&op=getMonitorListRaw&record=current"
opUrlDataset <- "&op=getDataset&access_key=3u7ihXmprOpUBZuS3NVDWp&id="
#datasetUrl <- paste0(baseUrl, apiKey, opUrlDataset)
sessionDatasetUrls <- lapply(sessionList, function(x) {
    sessionId <- x$session_id
    paste0(baseUrl, apiKey, opUrlDataset, sessionId)
})


load(file.path(prjDirs$pathPrj, "aiBillData.RData"))



names(aiBillsData$Y20132014)

test <- aiBillsData$Y20132014$SB860

test$status_date

# Open the test$url in the browser
browseURL(test$url)
browseURL(test$state_link)

# get the first object of test$progress
test$progress[["date"]][1]
# get the last object of test$progress
test$progress[["date"]][length(test$progress[["date"]])]


test$history[["date"]][1]
test$history[["date"]][length(test$history[["date"]])]

browseURL(test$texts[["url"]][length(test$texts[["url"]])])

browseURL(test$texts[["state_link"]][length(test$texts[["state_link"]])])

browseURL(test$state_link)

"https://leginfo.legislature.ca.gov/faces/billPdf.xhtml?bill_id=201320140SB860&version=20130SB86096CHP"

