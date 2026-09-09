@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for SO Header'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZUS_I_SO 
    as select from zvkfeb01_dt_so
    
    association to zvkfeb01_dt_soit as _Item 
    on $projection.Soid = _Item.soid
    
    association to zvkfeb01_dt_cust as _Buyer
    on $projection.Buyer = _Buyer.cust_id
{
    key soid as Soid,
    buyer as Buyer,
    sales_person as SalesPerson,
    sales_timestamp as SalesTimestamp,
    sales_manager as SalesManager,
    approval_timestamp as ApprovalTimestamp,
    created_by as CreatedBy,
    created_on as CreatedOn,
    changed_by as ChangedBy,
    changed_on as ChangedOn,
    url as Url,
    _Item,
    _Buyer
}
