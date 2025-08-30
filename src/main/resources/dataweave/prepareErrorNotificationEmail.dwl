%dw 2.0
output text/plain
var filePath = "sdd"
---
"Dear Backend Support Team,

A  validiation error occurred during file processing at " ++ (now() as String {format: "yyyy-MM-dd"}) ++ ".

Error Details:
- Error Type: " ++ "Data Validation Error" ++ "
- Error record:" ++ write(payload,"application/json") ++ "
" ++ (if (vars.filePath != null) "- File Being Processed: " ++ vars.filePath else "- No specific file (system-level error)") ++ "

Please investigate and take appropriate action.

Best regards,
File Processing Application"