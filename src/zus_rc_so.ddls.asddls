@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Projection & Consumption View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZUS_RC_SO 
    provider contract transactional_query
    as projection on zus_RI_SO
{
    key Soid,
    Buyer,
    SalesPerson,
    SalesTimestamp,
    SalesManager,
    ApprovalTimestamp,
    CreatedBy,
    CreatedOn,
    ChangedBy,
    ChangedOn,
    Url,
    /* Associations */
    _Cust,
    _Item : redirected to composition child ZUS_RC_SOIT
}
