# Create RIS Function ####

#' @title Create RIS File
#' @description Generates an RIS file for a given bill and its metadata.
#' @param name A string representing the name of the RIS file.
#' @param billData A list containing metadata about the bill, such as title, sponsors, and session details.
#' @return None. The function creates an RIS file in the specified directory.
#' @examples
#' createRis("AB-123", billData)
#' @export createRis
createRis <- function(name, billData) {

    # create a new folder for the RIS files
    dir.create(file.path(prjDirs$pathDataRis, name), showWarnings = FALSE)
    
    # Change the working directory to the new folder
    curPath <- setwd(file.path(prjDirs$pathDataRis, name))
    
    # add a folder named "files"
    dir.create(file.path(curPath, "files"), showWarnings = FALSE)
    
    # add a new file named "name.ris"
    file.create(file.path(curPath, paste0(name, ".ris")))
    
    # create a new connection to the file
    conn <- file(file.path(curPath, paste0(name, ".ris")), open = "w")
    
    # write the RIS header
    writeLines(c(
        "TY  - BILL",
        paste0("M1  - ", billData$billNumber),
        paste0("ST  - ", billData$shortTitle),
        paste0("TI  - ", billData$title)
        ), conn)
    
    # loop through the sponsors
    for (i in 1:length(billData$sponsor)) {
        writeLines(paste0("A2  - ", billData$sponsors[i]), conn)
    }
    
    # loop through the cosponsors
    for (i in 1:length(billData$cosponsors)) {
        writeLines(paste0("A3  - ", billData$cosponsors[i]), conn)
    }
    
    # Write additional lines
    writeLines(c(
        paste0("SE  - ", billData$section),
        paste0("T3  - ", billData$legislativeBody),
        paste0("ET  - ", billData$session),
        paste0("T2  - ", billData$code),
        paste0("VL  - ", billData$codeVolume),
        paste0("DA  - ", billData$date),
        paste0("Y2  - ", billData$accessDated),
        paste0("UR  - ", billData$url),
        paste0("OP  - ", billData$history),
        paste0("AB  - ", billData$abstractNote),
        paste0("N1  - ", billData$digest),
    ), conn)
    
    # Loop through the ocea meetings
    for (i in 1:length(billData$oceaLc)) {
        writeLines(c(
            paste0("N1  - <dif data-schema-version='9'><h3>OCEA LC Meeting: ", billData$ocea[i], "</h3>"),
            "<p><strong>Discussion:</strong></p>",
            billData$oceaLc[i]$discussion,
            "<p><strong>Disposition:</strong></p>",
            billData$oceaLc[i]$disposition,
        ), conn)
    }
    
    # Continue writing lines
    writeLines(c(
        paste0("M2  - sponsorUrl: ", billData$sponsorUrl),
        paste0("M2  - district: ", billData$district),
        paste0("M2  - party: ", billData$party),
        paste0("M2  - outcome: ", billData$outcome),
        paste0("M2  - chapterNo: ", billData$chapterNo),
        paste0("M2  - measureVote: ", billData$measureVote),
        paste0("M2  - measureAppropriation: ", billData$measureAppropriation),
        paste0("M2  - measureFiscal: ", billData$measureFiscal),
        paste0("M2  - measureLocal: ", billData$measureLocal),
        paste0("M2  - measureUrgency: ", billData$measureUrgency),
        paste0("M2  - measureTax: ", billData$measureTax),
        paste0("M2  - outcomeChapter: ", billData$outcomeChapter),
        paste0("M2  - votesLink: ", billData$votesLink),
        paste0("M2  - analysisLink: ", billData$analysisLink),
        paste0("M2  - todaysLawLink: ", billData$todaysLawLink),
        paste0("M2  - statusLink: ", billData$statusLink),
        paste0("M2  - billPdfLink: ", billData$billPdfLink),
        paste0("M2  - lcMeetings: ", billData$lcMeetings),
        paste0("M2  - lcDisposition: ", billData$lcDisposition),
    ), conn)
    
    # Copy the pdf files to the "files" folder
    file.copy(file.path(prjDirs$pathDataDocs, billData$filePdf), file.path(curPath, "files"))
    
    writeLines(c(
        paste0("L1  - files/", billData$filePdf),
        paste0("KW  - ", tolower(gsub(" ", "-", billData$legislativeBody))),
        paste0("KW  - ", tolower(gsub(" ", "-", billData$session))),
        paste0("KW  - ", tolower(gsub(" ", "-", billData$type))),
        paste0("KW  - ", tolower(gsub(" ", "-", billData$party)))
    ),conn)
    
    # if the billNumber starts with AB, add the keyword "assembly-bill"
    if (startsWith(billData$billNumber, "A")) {
        writeLines(paste0("KW  - assembly-district-", billData$district), conn)
    } else if (startsWith(billData$billNumber, "S")) {
        writeLines(paste0("KW  - senate-district-", billData$district), conn)
    }
    
    # Bill outcome keywords
    if (billData$outcome == "In-Progress") {
        writeLines("KW  - active-bill-in-progress", conn)
        writeLines(paste0("KW  - active-bill", billData$code), conn)
    } else if (billData$outcome == "Failed") {
        writeLines("KW  - active-bill-failed", conn)
    } else if (billData$outcome == "Chaptered") {
        writeLines("KW  - chaptered-bill", conn)
        writeLines(paste0("KW  - chapter-", billData$chapterNo), conn)
    }
    
    # Write the final line
    writeLines("ER  - ", conn)
    
    # Close the connection
    close(conn)
    
    # Return
    return()
}

