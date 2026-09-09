@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root Entity: SO Header'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zus_RI_SO 
    as select from zvkfeb01_dt_so
composition [1..*] of ZUS_IE_SOIT as _Item

association [1..1] to ZUS_I_CUST as _Cust
    on $projection.Buyer = _Cust.CustId
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
    _Cust // Make association public
}
