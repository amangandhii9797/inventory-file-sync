%dw 2.0
output text/plain
---
"Dear Backend Support Team,

A system error occurred during file processing at " ++ (now() as String {format: "yyyy-MM-dd HH:mm:ss"}) ++ ".

Error Details:
- Error Type: " ++ error.errorType.identifier default " "++ "
- Error Description: " ++ error.description default ""++ "
- Detailed Description: " ++ error.detailedDescription default "" ++ "
" ++ (if (vars.filePath != null) "- File Being Processed: " ++ vars.filePath else "- No specific file (system-level error)") ++ "

Please investigate and take appropriate action.

Best regards,
File Processing Application"