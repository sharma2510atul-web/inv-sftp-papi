%dw 2.0
import * from dw::core::Binaries
output text/plain
---
toBase64("Hello Team,

An error has occurred in the Mule application. Please find the details below:

Application Name : " ++ Mule::p('application.name')
++"\nError Type       : $(error.errorType.namespace default 'N/A'):$(error.errorType.identifier default 'N/A')
Error Description: $(error.description default 'N/A')
Timestamp        : $(now() as String {format: "yyyy-MM-dd HH:mm:ss"})

Kindly investigate the issue at the earliest.

Regards,  
Atul Sharma  
MuleSoft Integration Team")
