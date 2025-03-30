# Set Current Directory
setwd(file.path(Sys.getenv("OneDriveCommercial"), "Documents", "PolicyAnalysis", "scripts", "R"))

# LC Bills Data ####
lcData <- list(
    ## AB21 ####
    ab21 = list(
        type = "BILL",
        billNumber = "AB-21",
        shortTitle = "AB-21 Taxpayer Protection Act of 2025",
        title = "AB-21: An act relating to taxation.",
        sponsors = "DeMaio, Carl",
        cosponsors = NA,
        section = "2025-2026",
        legislativeBody = "California Legislature",
        session = "2025-2026 Regular Session",
        code = "Introduced",
        codeVolume = "Active Bill - Pending Referral",
        date = "2024-12/02",
        accessDated = "2024-12-02",
        url = "https://leginfo.legislature.ca.gov/faces/billTextClient.xhtml?bill_id=202520260AB21",
        history = "https://leginfo.legislature.ca.gov/faces/billHistoryClient.xhtml?bill_id=202520260AB21",
        abstractNote = "This bill intends to propose a constitutional amendment to limit state and local governments' ability to raise taxes. It aims to restore a 2/3 vote requirement for local special tax increases, impose voter approval requirements on certain new taxes, and regulate the titles on state and local ballot measures related to tax increases.",
        digest = "The California Constitution requires a state statute that would result in any taxpayer paying a higher tax to be imposed by an act passed by 2/3 vote of the each house of the Legislature.
The California Constitution also provides that all taxes imposed by a local government are either general taxes or special taxes, as defined, and requires that taxes imposed, extended, or increased by a local government be submitted to the electorate and approved by a majority vote, in the case of general taxes, or a 2/3 vote, in the case of special taxes.
Existing law imposes specified requirements on state and local ballots, including, among other things, on the contents of the ballot label, ballot title, and summary.
This bill would declare the intent of the Legislature to enact a constitutional amendment to limit the ability of state and local governments to raise taxes, restore a 2/3 vote requirement on local special tax increases, impose voter approval requirements on specific categories of new taxes, and regulate the titles on state and local ballot measures relating to tax increases.",
        sponsorUrl = "https://ballotpedia.org/Carl_DeMaio",
        district = "75",
        party = "Republican",
        outcome = "In Progress",
        chapterNo = NA,
        measureVote = "Majority",
        measureAppropriation = "false",
        measureFiscal = "true",
        measureLocal = "false",
        measureUrgency = "false",
        measureTax = "false",
        outcomeChapter = "false",
        aiDisposition = "M2 (Neutral/Supportive/Restrictive)",
        aiType = "M2",
        aiSector = "M2",
        aiSubsector = "M2",
        aiDomain = "M2",
        aiAccountability = "M2 (Low/Moderate/High)",
        aiImpact = "M2 (Low/Moderate/High)",
        aiEthics = "M2 (Significant/Not Significant)",
        aiInnovation = "M2 (Low/Moderate/High)",
        aiPrivacy = "M2 (Low/Moderate/High)",
        aiTransparency = "M2 (Low/Moderate/High)",
        zoteroPdf = "L1",
        tags = c("taxation", "2025-2026-regular-session", "active-bill-in-progress", "active-bill-introduced", "assembly-bill", "california-legislature", "ocea-lc-25-03", "republican", "voter-approval", "ocea-lc-25-02", "financial", "assembly-district-75", "ballot-measures", "constitutional-amendment", "local-government", "special-taxes", "state-government", "tax-increases", "taxpayer", "two-thirds-vote-requirement"),
        zoteroKey = "demaioAB21ActRelating2024",
        
    )
)
