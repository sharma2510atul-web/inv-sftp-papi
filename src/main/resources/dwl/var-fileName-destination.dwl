output application/json
---
"inventory_$(payload.StoreId)_$(now() as Date as String {format : "dd-MM-yyyy"}).csv"