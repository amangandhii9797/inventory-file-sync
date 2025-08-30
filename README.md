# inventory-file-sync
# Mule Inventory File Processor

## Overview
This Mule 4 application automates the processing of large inventory files received via SFTP (or local folder for development).  
The application validates, transforms, and segregates inventory records into store-specific files for Salesforce Commerce Cloud (SFCC) to consume.

It is designed to handle **large files (up to 1GB)** on a minimal **0.2 vCore** runtime within **30 minutes**.

---

## Features
1. **Scheduled Job** – Runs automatically every day at **4 AM**.
2. **File Pickup** – Retrieves the source file from an SFTP folder (or local folder during development).
3. **File Not Found Handling** – Sends a notification email to the backend support team if the input file is missing.
4. **Validation Rules**:
   - All fields are mandatory.  
   - Quantity must be a whole number.  
   - Type must be either `Standard` or `Backorder`.  
5. **Invalid Record Handling** – Invalid records are filtered out and emailed to the backend support team. Processing continues for valid records.
6. **Store-Level Segregation** – Generates one output file per store (`inventory_<storeId>_<DD-MM-YYYY>.csv`).  
   - If the input file contains records for `X` unique stores, then `X` output files are generated.  
7. **Error Handling** – All system errors are gracefully handled with appropriate notifications and retry mechanisms.  
8. **Scalable Processing** – Optimized to process large input files (up to 1GB) efficiently on limited resources.  

---

## File Naming Convention
Output files follow this pattern:
