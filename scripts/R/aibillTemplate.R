# billID ####
bill <- list(
    bblType <- "BILL", # Zotero type
    purpose = "AI", # Purpose of the analysis (AI/LC)
    id = , # Bill ID (same as the billNumber in Zotero)
    no = , # Numeric bill number (e.g., 21, 22, etc.)
    type = , # Bill type (e.g., Assembly Bill, Senate Bill, etc.)
    section = , # Legislative section (e.g., 2025-2026)
    body = , # Legislative body (e.g., California Legislature)
    session = , # Legislative session (e.g., 2025-2026 Regular Session)
    text = , # URL link for the bill full text
    history = , # URL link for the bill history
    status = , # URL link for the bill status
    votes = , # URL link for the votes
    analysis = , # URL link for the analysis
    todaysLaw = , # URL link for the Today's Law
    compare = , # URL link for the bill version comparison
    topic = , # Short title of the bill (topic)
    title = , # Full title of the bill (title)
    digest = , # Digest of the bill (summary)
    tldr = , # TLDR of the bill (summary)
    tags = list("artificial-intelligence"), # Tags for the bill (lowercase, words separated by dash)
    sponsors = list(
        c("lastName", "firstName", "district", "party", "url")
    ), # List of sponsors (list of lists)
    cosponsors = list(
        c("lastName", "firstName", "district", "party", "url")
    ), # List of cosponsors (list of lists)
    dateStart = , # Date of the bill (e.g., 2024-12-02)
    dateEnd = , # Last legislative update date (e.g., 2024-12-02)
    dateUpdated = Sys.Date(), # Last update date (e.g., 2024-12-02)
    outcome = , # Outcome of the bill (e.g., In Progress/Failed/Chaptered)
    chaptered = , # Outcome chapter (e.g., true/false)
    chapterNo = , # Chapter number (e.g., 35)
    version = , # Legislative code (e.g., Introduced)
    active = , # Active bill (e.g., true/false)
    result = , # Legislative code volume (e.g., Died, Pending Referral, Vetoed etc.)
    vote = , # Measure vote type (e.g., Majority/Two Thirds/Three Fourths)
    appropriation = , # Measure appropriation (e.g., true/false)
    fiscal = , # Measure fiscal (e.g., true/false)
    local = , # Measure local (e.g., true/false)
    urgency = , # Measure urgency (e.g., true/false)
    tax = , # Measure tax (e.g., true/false)
    action = , # Last action description
    pdf = "", # File PDF link (the name of the pdf in the data directory)
    aiDisposition = , # AI disposition (e.g., Neutral/Supportive/Restrictive)
    aiType = , # AI type (category)
    aiSector = , # AI sector (main sector/theme of AI)
    aiSubSector = , # AI subSector (subSector/subTheme of AI)
    aiDomain = , # AI domain (domain of AI)
    aiAccountability = , # AI accountability (Low/Moderate/High)
    aiImpact = , # AI impact (Low/Moderate/High)
    aiEthics = , # AI ethics (Significant/Not Significant)
    aiInnovation = , # AI innovation (Low/Moderate/High)
    aiPrivacy = , # AI privacy (Low/Moderate/High)
    aiTransparency =  # AI transparency (Low/Moderate/High)
)
