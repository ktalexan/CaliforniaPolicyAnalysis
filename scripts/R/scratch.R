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


test <- content(GET("https://api.legiscan.com/?key=3b3da9d10022157f9deb36b0748bf608&op=getMonitorListRaw&record=2023"), as = "parsed", type = "application/json")$monitorlist



# Fetch the monitor bills from the LegiScan API
if () {
    monitorBills <- content(GET(monitorBillsUrl), as = "parsed", type = "application/json")$monitorlist
    # Create a new list with the bill number as the name for each object
    namedMonitorBills <- lapply(monitorBills, function(x) {
        x$bill_number <- x$bill_number  # Ensure bill_number is included
        x
    })
    names(namedMonitorBills) <- sapply(monitorBills, function(x) x$number)
} else {
    stop("Failed to fetch data from LegiScan API.")
}

monitorBills <- content(GET(monitorBillsUrl), as = "parsed", type = "application/json")$monitorlist

names(monitorBills) <- sapply(monitorBills, function(x) x$bill_id)


# import the listBillsLC.json file from the metadata directory
listBillsLC <- fromJSON(file.path(prjDirs$pathMetadata, "listBillsLC.json"))


"https://api.legiscan.com/?key=3b3da9d10022157f9deb36b0748bf608&op=getMonitorListRaw&record=2014"
"https://api.legiscan.com/?key=3b3da9d10022157f9deb36b0748bf608&op=getMonitorListRaw&record=2018"
"https://api.legiscan.com/?key=3b3da9d10022157f9deb36b0748bf608&op=getMonitorListRaw&record=2020"
"https://api.legiscan.com/?key=3b3da9d10022157f9deb36b0748bf608&op=getMonitorListRaw&record=2022"
"https://api.legiscan.com/?key=3b3da9d10022157f9deb36b0748bf608&op=getMonitorListRaw&record=2024"
"https://api.legiscan.com/?key=3b3da9d10022157f9deb36b0748bf608&op=getMonitorListRaw&record=2026"
