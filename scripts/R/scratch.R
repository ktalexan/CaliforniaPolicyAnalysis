#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rm(list = ls())
ver <- 1.0

liblist <- c("lubridate", "jsonlite", "dplyr", "magrittr", "R6", "haven", "labelr", "plyr", "stringr", "purrr", "glue", "Hmisc", "psych", "tibble", "here", "tidyr", "knitr", "labelled", "collapse", "formattable")
sapply(liblist, require, character.only = TRUE)

setwd(file.path(Sys.getenv("OneDriveConsumer"), "Documents", "Projects", "PolicyAnalysis", "data"))

loadlist <- c("projectMetadata.RData", "projectDirectories.RData", "dfCalMembers.RData", "calMembers.RData", "addBillStructure.RData", "addSponsors.RData", "calMembers.RData", "aiBills20232024.RData")
for (f in loadlist) {
  load(file = f)
}

metadata <- projectMetadata(prjComponent = "AI", prjPart = 0)
prjDirs <- projectDirectories()

rm(liblist, loadlist, f)
setwd(prjDirs$pathData)

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
