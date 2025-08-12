@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_BD_Flight
  as select from /dmo/flight
  association [0..1] to ZI_BD_Carrier as _Carrier on $projection.CarrierId = _Carrier.CarrierId
{
      @UI.facet: [{ type: #IDENTIFICATION_REFERENCE,
      label: 'Flight Detail',
      id: 'FlightInfo' }]
      @UI: { lineItem: [{ position: 10 , label: 'Airline'}], identification: [{ position: 10 }] }
      @ObjectModel.text.association: '_Carrier'
  key carrier_id     as CarrierId,
      @UI: { lineItem: [{ position: 20}] , identification: [{ position: 20 }] }
  key connection_id  as ConnectionId,
      @UI: { lineItem: [{ position: 30}] , identification: [{ position: 30 }] }
  key flight_date    as FlightDate,
      @UI: { lineItem: [{ position: 40}] , identification: [{ position: 40 }]  }
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      currency_code  as CurrencyCode,
      @UI: { identification: [{ position: 50 }] }
      plane_type_id  as PlaneTypeId,
      @UI: { identification: [{ position: 60 }] }
      seats_max      as SeatsMax,
      @UI: { identification: [{ position: 70 }] }
      seats_occupied as SeatsOccupied,
      _Carrier
}
