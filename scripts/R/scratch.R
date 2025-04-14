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

aiBillData20132014 <- createBillData("2013-2014")
aiBillData20172018 <- createBillData("2017-2018")
aiBillData20192020 <- createBillData("2019-2020")
aiBillData20212022 <- createBillData("2021-2022")
aiBillData20232024 <- createBillData("2023-2024")
aiBillData20252026 <- createBillData("2025-2026")


datasetList$Y20252026$dataset_hash
file.path(prjDirs$pathData, "LegiScan", "datasets", "2025-2026", "hash.md5")

# read the file contents of the hash.md5 file
hashStored <- file.path(prjDirs$pathData, "LegiScan", "datasets", "2025-2026", "hash.md5")

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


