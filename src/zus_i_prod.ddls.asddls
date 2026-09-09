@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Products'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZUS_I_PROD as select from zvkfeb01_dt_prod
{
    key prod_id as ProdId,
    descpt as Descpt,
    @Semantics.amount.currencyCode: 'Currency'
    price as Price,
    currency as Currency
}
