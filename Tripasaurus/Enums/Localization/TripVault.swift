import Foundation

enum TripVault: String {
    case add = "trip.add"
    case delete = "trip.delete"
    case endDate = "trip.endDate"
    case `new` = "trip.new"
    case startDate = "trip.startDate"
    case titlePlaceholder = "trip.titlePlaceholder"

    case budgetEdit = "trip.budget.edit"
    case budgetSectionHeader = "trip.budget.sectionHeader"
    case budgetTotal = "trip.budget.total"
    
    case flightHeader = "trip.flight.header"
    case flightNumber = "trip.flight.number"
    case flightSearchAirports = "Search for Airports"
    case flightSectionHeader = "trip.flight.sectionHeader"
    
    case transportAdd = "Add Reservation"
    case transportArrivalCityPlaceholder = "trip.transport.arrivalCityPlaceholder"
    case transportArrivalDate = "trip.transport.arrivalDate"
    case transportArrive = "trip.transport.arrive"
    case transportCarrier = "trip.transport.carrier"
    case transportConfirmationNumber = "trip.transport.confirmationNumber"
    case transportCost = "trip.transport.cost"
    case transportDelete = "trip.transport.delete"
    case transportDepartureCityPlaceholder = "trip.transport.departureCityPlaceholder"
    case transportDepartureDate = "trip.transport.departureDate"
    case transportDepart = "trip.transport.depart"
    case transportNew = "trip.transport.new"
    case transportNoLocationsFound = "trip.transport.noLocationsFound"
    case transportNotes = "trip.transport.notes"
    
    case transportationHeader = "trip.transportation.header"
    case transportationMode = "trip.transportation.mode"
    case transportationRouteNumber = "trip.transportation.routeNumber"
    case transportationSectionHeader = "trip.transportation.sectionHeader"

    var name: String { self.rawValue }
}
