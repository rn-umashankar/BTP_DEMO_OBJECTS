@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Projection & Consumption View fo Item'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZUS_RC_SOITU as projection on ZUS_IE_SOITU
{
    key Soid,
    key ItemId,
    Product,
    @Semantics.amount.currencyCode: 'Currency'
    Amount,
    Currency,
    SalesPerson,
    SalesTimestamp,
    SalesManager,
    ApprovalTimestamp,
    ChangedBy,
    ChangedOn,
    ImageItem,
    /* Associations */
    _Header : redirected to parent ZUS_RC_SOU,
    _Prod
}
