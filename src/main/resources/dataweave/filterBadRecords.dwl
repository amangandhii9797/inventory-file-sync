
%dw 2.0
output application/csv
---
payload flatMap $ filter (
    $.SKU != null and $.SKU != "" and
    $.StoreId != null and $.StoreId != "" and
    $.Quantity != null and $.Quantity != "" and
    $.'Type' != null and $.'Type' != "" and
     ($.Quantity as Number) is Number and
    ($.'Type' == "Standard" or $.'Type' == "Backorder")
)
