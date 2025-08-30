%dw 2.0
output text/plain
---

"Dear Back End Support Team,

No input files were found in the SFTP directory during the scheduled processing at " ++ (now() as String {format: "yyyy-MM-dd HH:mm:ss"}) ++ ".

Directory checked: data/Input
Expected file format: CSV

Please verify if files are expected at this time or if there are any issues with the file delivery process.

Best regards,
File Processing Application"