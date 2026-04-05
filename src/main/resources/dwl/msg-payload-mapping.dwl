%dw 2.0
output application/json
---
(payload groupBy $.StoreId) pluck ((value, key, index) -> {
    "StoreId": (key),
    "recordDetails": value
} )