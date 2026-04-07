%dw 2.0
import * from dw::core::Binaries
output text/plain
---
toBase64("Hello Team,

An error has occurred in the Mule application. Please find the details below:

Application Name : " ++ Mule::p('application.name')
++"\nError Type       : MULE_PROCESSING_FAILED
Error Records: \n" ++ (("<!DOCTYPE html>
<html>
<head>
  <meta charset='UTF-8'/>
  <title>JSON to HTML Table</title>
  <style>
    table { border-collapse: collapse; width: 100%; font-family: Arial, sans-serif; }
    th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
    th { background-color: #4CAF50; color: white; }
    tr:nth-child(even) { background-color: #f2f2f2; }
    tr:hover { background-color: #ddd; }
  </style>
</head>
<body>
  <h2>Data Table</h2>
  <table>
    <thead>
      <tr>" ++
        (payload[0] pluck ((value, key) -> "
        <th>" ++ (key as String) ++ "</th>") joinBy "")
      ++ "
      </tr>
    </thead>
    <tbody>" ++
      ((payload) map ((row) -> "
      <tr>" ++
        (row pluck ((value, key) -> "
        <td>" ++ ((value default "") as String) ++ "</td>") joinBy "")
      ++ "
      </tr>") joinBy "")
    ++ "
    </tbody>
  </table>
</body>
</html>"
) default "")
++ "\nTimestamp        : $(now() as String {format: "yyyy-MM-dd HH:mm:ss"})

Kindly investigate the issue at the earliest.

Regards,  
Atul Sharma  
MuleSoft Integration Team")
