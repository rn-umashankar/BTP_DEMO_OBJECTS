@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for SO Items'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZUS_I_SOIT 
    as select from zvkfeb01_dt_soit 
    association to zvkfeb01_dt_prod as _Prod
    on $projection.Product = _Prod.prod_id
{
    key soid as Soid,
    key item_id as ItemId,
    product as Product,
    @Semantics.amount.currencyCode: 'Currency'
    amount as Amount,
    currency as Currency,
    sales_person as SalesPerson,
    sales_timestamp as SalesTimestamp,
    sales_manager as SalesManager,
    approval_timestamp as ApprovalTimestamp,
    changed_by as ChangedBy,
    changed_on as ChangedOn,
    image_item as ImageItem,
    _Prod
}
