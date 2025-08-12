@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier Details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity ZI_BD_Carrier
  as select from /dmo/carrier as Carrier
{
  key carrier_id as CarrierId,
      @Semantics.text: true
      @Search.fuzzinessThreshold: 0.7
      @Search.defaultSearchElement: true
      name       as Name
      //    currency_code as CurrencyCode,
      //    local_created_by as LocalCreatedBy,
      //    local_created_at as LocalCreatedAt,
      //    local_last_changed_by as LocalLastChangedBy,
      //    local_last_changed_at as LocalLastChangedAt,
      //    last_changed_at as LastChangedAt
}
