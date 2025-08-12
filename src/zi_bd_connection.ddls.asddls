@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection Details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #TRANSACTIONAL
}
@UI.headerInfo: {
    typeName: 'Connection',
    typeNamePlural: 'Connections'
}
@Search.searchable: true
define view entity ZI_BD_Connection
  as select from /dmo/connection as Connection
  association [1..*] to ZI_BD_Flight  as _Flight  on  $projection.CarrierId    = _Flight.CarrierId
                                                  and $projection.ConnectionId = _Flight.ConnectionId
  association [0..1] to ZI_BD_Carrier as _Carrier on  $projection.CarrierId = _Carrier.CarrierId
{
      @UI.facet: [{
          id: 'Connection',
          purpose: #STANDARD,
          position: 10,
          type:#IDENTIFICATION_REFERENCE,
          label: 'Connection'
      },
      {
          id: 'Flight',
          purpose: #STANDARD,
          position: 20,
          type: #LINEITEM_REFERENCE,
          label: 'Flights',
          targetElement: '_Flight'
      }]
      @UI: { lineItem: [{ position: 10 , label: 'Airline'}],
      identification: [{ position: 10 }]}
      @EndUserText.label: 'Airline'
      @ObjectModel.text.association: '_Carrier'
      @Search.defaultSearchElement: true
  key carrier_id      as CarrierId,
      @UI: { lineItem: [{ position: 20 }] , identification: [{ position: 20 }] }
  key connection_id   as ConnectionId,
      @UI: { lineItem: [{ position: 30 }],
      selectionField: [{ position: 10 }] ,
      identification: [{ position: 30 }]}
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{
          entity: {
              name: 'ZI_BD_Airport',
              element: 'AirportId'
          },
          useForValidation: true
      }]
      airport_from_id as AirportFromId,
      @UI: { lineItem: [{ position: 40 }],
      selectionField: [{ position: 20 }],
      identification: [{ position: 40 }]}
      @Consumption.valueHelpDefinition: [{
          entity: {
              name: 'ZI_BD_Airport',
              element: 'AirportId'
          },
          useForValidation: true
      }]
      airport_to_id   as AirportToId,
      @Search.defaultSearchElement: true
      @UI: { lineItem: [{ position: 50 }], identification: [{ position: 50 }] }
      departure_time  as DepartureTime,
      @UI: { lineItem: [{ position: 60 }], identification: [{ position:  60 }] }
      arrival_time    as ArrivalTime,
      @UI: { lineItem: [{ position: 70 }], identification: [{ position: 70 }] }
      //@Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      distance        as Distance,
      @UI: { lineItem: [{ position: 80 }], identification: [{ position: 80 }] }
      distance_unit   as DistanceUnit,
      _Flight,
      _Carrier
}
