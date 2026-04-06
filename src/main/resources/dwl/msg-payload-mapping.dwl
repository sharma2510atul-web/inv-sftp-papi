%dw 2.0
output application/json
---
(flatten(payload) groupBy $.StoreId) pluck ((value, key, index) -> {
    "StoreId": (key),
    "recordDetails": value
} )