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


content(GET(sessionListUrl), as = "parsed", type = "application/json")$zip

# Construct the URL for the LegiScan API session list
opUrlDataset <- "&op=getMonitorListRaw&record=current"
#opUrlDataset <- "&op=getDataset&access_key=3u7ihXmprOpUBZuS3NVDWp&id=2172"
datasetUrl <- paste0(baseUrl, apiKey, opUrlDataset)

temp <- file.path(prjDirs$pathData, "test.zip")

download.file(url = datasetUrl, destfile = temp, method = "curl", quiet = FALSE, mode = "wb")
unzip(temp)

"https://api.legiscan.com/?key=3b3da9d10022157f9deb36b0748bf608&op=getMonitorListRaw&record=current"

"https://api.legiscan.com/?key=3b3da9d10022157f9deb36b0748bf608&op=getDataset&access_key=3u7ihXmprOpUBZuS3NVDWp&id=2172"


datasetList <- lookupDatasets()


#' Get dataset archive
#'
#' This is the API wrapper function for the getDataset operation.
#' It retrieves the ZIP archive of the requested session dataset, then unzip
#' the content to a specified local directory.
#'
#' @param dataset_list List object returned from \code{\link{get_dataset_list}}
#' @param save_to_dir Local directory to save the unzipped dataset.
#' Default to working directory \code{"."}
#' @param api_key Your LegiScan API key (see \code{\link{legiscan_api_key}})
#'
#' @importFrom fs dir_create
#' @importFrom purrr flatten
#' @importFrom utils unzip
#' @import httr
#' @import jsonlite
#'
#' @examples
#' \dontrun{
#' # One dataset
#' get_dataset(one_dataset, save_to_dir = "data_json")
#'
#' # Multiple datasets. Use walk() to avoid printing NULL to console.
#' # But lapply() and map() works too
#' walk(multiple_datasets, get_dataset, save_to_dir = "data_json")
#' }
#'
#' @seealso \code{\link{get_dataset_list}}, \code{\link{legiscan_api_key}},
#' \href{https://legiscan.com/gaits/documentation/legiscan}{LegiScan API manual}.
#'
#' @return NULL. No return value. Dataset will be unzipped to local disk.
#'
#' @export
get_dataset <- function(dataset_list,
                        save_to_dir = ".",
                        api_key = legiscan_api_key()){

  # Create directory to save the dataset
  fs::dir_create(save_to_dir)

  #df <- data.table::rbindlist(dataset_list, fill = TRUE)
  dataset_list <- purrr::flatten(dataset_list)

  # Chek for internet
  check_internet()

  resp <- httr::GET(
    url = base_url,
    query = list(key = api_key,
                 op = "getDataset",
                 id = dataset_list$session_id,
                 access_key = dataset_list$access_key))

  # Get the content
  content <- httr::content(resp)

  # Check for errors in http status, API errors
  check_http_status(resp)
  check_API_response(content)

  # Decode the dataset from Base64
  data_decode <- jsonlite::base64_dec(content[["dataset"]][["zip"]])

  # Write the decoded data to temp file, then unzip to local directory
  tmp <- tempfile()
  writeBin(data_decode, tmp)
  utils::unzip(tmp, exdir = save_to_dir)

  message("Saved: ",
          "state id - ", content[["dataset"]][["state_id"]], ", ",
          "session - ", content[["dataset"]][["session_name"]])
}



storeDatasetData <- function(dataset) {
    # Get the years string
    years <- paste0(dataset$year_start, "-", dataset$year_end)
    # Construct the URL for the LegiScan API dataset list
    datasetUrl <- paste0(baseUrl, apiKey,"&op=getDataset&access_key=", dataset$access_key, "&id=", dataset$session_id)
    
    # get the response
    resp <- GET(datasetUrl)
    # check the response status
    if (http_error(resp)) {
        stop("Failed to retrieve dataset for session ID: ", dataset$session_id)
    }
    # parse the content
    content <- content(resp)
    dataDecode <- base64_dec(content[["dataset"]][["zip"]])
    temp <- file.path(prjDirs$pathData, "temp.zip")
    writeBin(dataDecode, temp)

    # Using the unzip function extract only the contents of a subdirectory in the zipped file, to a new directory
    unzip(temp, exdir = file.path(prjDirs$pathData, "temp"))

    # Read the folders in the temp directory
    tempFolder <- list.files(file.path(prjDirs$pathData, "temp", "CA"))

    # Read the files in the temp folder
    tempFiles <- list.files(file.path(prjDirs$pathData, "temp", "CA", tempFolder))

    # Check if the destination directory exists, if not create it
    if (!dir.exists(file.path(prjDirs$pathData, "legiscan", "datasets", years))) {
        dir.create(file.path(prjDirs$pathData, "legiscan", "datasets", years), recursive = TRUE)
    }

    # copy the files in the tempFolder to a new directory
    file.copy(file.path(prjDirs$pathData, "temp", "CA", tempFolder, tempFiles), file.path(prjDirs$pathData, "legiscan", "datasets", years), overwrite=TRUE, recursive = TRUE)

    # Delete the temp folder and zip file from the data directory
    unlink(file.path(prjDirs$pathData, "temp"), recursive = TRUE)
    unlink(file.path(prjDirs$pathData, "temp.zip"))

    cat("Dataset for session ID: ", dataset$session_id, " downloaded and extracted successfully.\n")
    cat("Files saved to: ", file.path(prjDirs$pathData, "legiscan", "datasets", years), "\n")
}

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


