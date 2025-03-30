#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Policy Analysis R Data Processing #
# Project Functions ####
# v 1.0, March 2025
# Dr. Kostas Alexandridis, GISP
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Empty the R environment before running the code
rm(list = ls())

# Define the libraries to use in the script
liblist <- c("glue", "lubridate")

# Load the libraries
sapply(liblist, require, character.only = TRUE)

# Set version
ver = 1.0


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 1. Metadata ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Define the global project settings by creating a function that returns a list of the project's metadata
projectMetadata <- function(prjComponent, prjPart) { # nolint: object_name_linter.
    
    # Set the project component
    if (prjComponent == "LC") {
        prjTitle = "OCEA Legislative Committee Analysis"
        prjYears = "2025-2026"
        startDate = "2024-12-02"
    } else if (prjComponent == "AI") {
        prjTitle = "AI Legislative Policy Analysis"
        prjYears = c("2011-2012","2013-2014","2015-2016","2017-2018","2019-2020","2021-2022","2023-2024","2025-2026")
        startDate = "2010-12-02"
    }
    
    # Set the title based on the part
    if (prjPart == 0) {
        prjStep = "Project Maintenance Operations"
    } else if (prjPart == 1) {
        prjStep = "Part 1: Preliminary Operations"
    } else if (prjPart == 2) {
        prjStep = "Part 2: Creating Bibliography Entries and Databases"
    } else if (prjPart == 3) {
        prjStep = "Part 3: Analysis Markdown Documents"
    } else if (prjPart == 4) {
        prjStep = "Part 4: Data Analysis and Visualization"
    }
    
    # create a new list
    data <- list(
        "name" = prjTitle,
        "title" = prjStep,
        "version" = glue("Version {ver}, {format(Sys.Date(), '%B %Y')}"),
        "author" = "Dr. Kostas Alexandridis, GISP",
        "projectYears" = prjYears,
        "startDate" = startDate,
        "endDate" = Sys.Date()
    )
    # Set this program's metadata
    cat("Project Global Settings:\n")
    print(glue("\r\tName: \t{data$name}\n\r\tTitle: \t{data$title} \n\r\tVersion: {data$version} \n\r\tAuthor: {data$author}\n"))
    cat("Data Dates:\n")
    # join the prjYears with commas
    prjYears = paste(data$projectYears, collapse = ", ")
    
    print(glue("\r\tStart Date: \t{data$startDate}\n\r\tEnd Date: \t{data$endDate}\n\r\tPeriods: \t{paste(data$projectYears, collapse = ', ')}"))
    # Return the data list
    return(data)
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 2. Directories ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Define the global directory settings using the following function that returns a list of the project's directories
projectDirectories <- function() {
    # Get the basic project directory on the OneDrive Documents directory
    setwd(file.path(Sys.getenv("OneDriveCommercial"), "Documents", "PolicyAnalysis"))
    # Create a new data list
    data <- list(
        "pathPrj" = getwd(),
        "pathAdmin" = file.path(getwd(), "admin"),
        "pathAnalysis" = file.path(getwd(), "analysis"),
        "pathData" = file.path(getwd(), "data"),
        "pathDataDocs" = file.path(getwd(), "data", "documents"),
        "pathDataMd" = file.path(getwd(), "data", "markdown"),
        "pathDataRis" = file.path(getwd(), "data", "ris"),
        "pathGraphics" = file.path(getwd(), "graphics"),
        "pathMetadata" = file.path(getwd(), "metadata"),
        "pathScripts" = file.path(getwd(), "scripts"),
        "pathScriptsR" = file.path(getwd(), "scripts", "R"),
        "pathScriptsPy" = file.path(getwd(), "scripts", "python"),
        "pathScriptsMd" = file.path(getwd(), "scripts", "markdown"),
        "pathScriptsRis" = file.path(getwd(), "scripts", "ris"),
        "pathNotebooks" = file.path(getwd(), "metadata", "notebooks")
    )
    # Print output in console
    cat("Directory Global Settings:\n")
    print(glue(
        "\nGeneral:",
        "\n\tDefault: \t{data$pathScriptsR}",
        "\n\tProject: \t{data$pathPrj}",
        "\nData: ",
        "\n\tMain Data: \t{data$pathData}",
        "\n\tDocuments: \t{data$pathDataDocs}",
        "\n\tMarkdown: \t{data$pathDataMd}",
        "\n\tRIS: \t{data$pathDataRis}",
        "\nAnalysis: ",
        "\n\tAnalysis: \t{data$pathAnalysis}",
        "\n\tGraphics: \t{data$pathGraphics}",
        "\nScripts: ",
        "\n\tR Scripts: \t{data$pathScriptsR}",
        "\n\tPython Scripts: {data$pathScriptsPy}",
        "\n\tMarkdown Scripts: {data$pathScriptsMd}",
        "\n\tRIS Scripts: \t{data$pathScriptsRis}",
        "\nOther: ",
        "\n\tMetadata: \t{data$pathMetadata}",
        "\n\tNotebooks: \t{data$pathNotebooks}",
    ))
    # Return the data list
    return(data)
}

# check if a file in the global environment
if (!exists("prjDirs")) {
    # if not, load the project directories
    prjDirs <- projectDirectories()
}


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 3. Save Functions ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Save the metadata function to disk
save(projectMetadata, file = file.path(prjDirs$pathData, "projectMetadata.RData"))

# Save the project directories function to disk
save(projectDirectories, file = file.path(prjDirs$pathData, "projectDirectories.RData"))

# Clear the workspace
rm(list = ls())


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# End of Script ####
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
