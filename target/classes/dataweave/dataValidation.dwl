%dw 2.0
output application/json

// Function to validate a single record
fun isValidRecord(record: Object):Boolean = (
    !isEmpty(record.SKU) and
    !isEmpty(record.StoreId) and
    !isEmpty(record.Quantity) and
    !isEmpty(record.'Type') and
    (record.Quantity as Number) is Number and
    (record.'Type' == "Standard" or record.'Type' == "Backorder")
)

// Function to get validation errors for a record
fun getValidationErrors(record: Object) = [
    if (isEmpty(record.SKU)) "SKU is mandatory" else null,
    if (isEmpty(record.StoreId)) "StoreId is mandatory" else null,
    if (isEmpty(record.Quantity)) "Quantity is mandatory" else null,
    if (isEmpty(record.'Type')) "Type is mandatory" else null,
    if (record.Quantity != null and record.Quantity != "" and not (record.Quantity as String matches /^\d+$/)) "Quantity must be a whole number" else null,
    if (record.'Type' != null and record.'Type' != "" and not (record.'Type' == "Standard" or record.'Type' == "Backorder")) "Type must be Standard or Backorder" else null
] filter ($ != null)

---
{
    isValid: payload flatMap $ map ((item, index) -> 
    {
   isValid:  isValidRecord(item),
    errors: getValidationErrors(item),
    errorRecord: if(isValidRecord(item))"" else item.SKU ,
   }) filter ($.isValid == false)
}