%dw 2.0
output application/java
var today = now() as Date {format: "dd-MM-yyyy"}
---
payload groupBy ((item, index) -> item.StoreId ) pluck ((item, index) ->
{
fileName: "inventory_" ++ item[0].StoreId ++ "_" ++ today ++ ".csv",
withHeader: write(item, "application/csv", {header: true}),
withoutHeader: write(item, "application/csv", {header: false})

} ) 
 
