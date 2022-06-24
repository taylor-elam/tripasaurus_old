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

    case flightAdd = "trip.flight.add"
    case flightArrivalCityPlaceholder = "trip.flight.arrivalCityPlaceholder"
    case flightArrivalDate = "trip.flight.arrivalDate"
    case flightArrive = "trip.flight.arrive"
    case flightCarrier = "trip.flight.carrier"
    case flightConfirmationNumber = "trip.flight.confirmationNumber"
    case flightCost = "trip.flight.cost"
    case flightDelete = "trip.flight.delete"
    case flightDepartureCityPlaceholder = "trip.flight.departureCityPlaceholder"
    case flightDepartureDate = "trip.flight.departureDate"
    case flightDepart = "trip.flight.depart"
    case flightNew = "trip.flight.new"
    case flightNotes = "trip.flight.notes"
    case flightNumber = "trip.flight.number"
    case flightReservation = "trip.flight.reservation"
    case flightSectionHeader = "trip.flight.sectionHeader"
    
    case transportationAdd = "trip.transportation.add"
    case transportationArrivalCityPlaceholder = "trip.transportation.arrivalCityPlaceholder"
    case transportationArrivalDate = "trip.transportation.arrivalDate"
    case transportationArrive = "trip.transportation.arrive"
    case transportationCarrier = "trip.transportation.carrier"
    case transportationConfirmationNumber = "trip.transportation.confirmationNumber"
    case transportationCost = "trip.transportation.cost"
    case transportationDelete = "trip.transportation.delete"
    case transportationDepartureCityPlaceholder = "trip.transportation.departureCityPlaceholder"
    case transportationDepartureDate = "trip.transportation.departureDate"
    case transportationDepart = "trip.transportation.depart"
    case transportationNew = "trip.transportation.new"
    case transportationNotes = "trip.transportation.notes"
    case transportationRouteNumber = "trip.transportation.routeNumber"
    case transportationReservation = "trip.transportation.reservation"
    case transportationSectionHeader = "trip.transportation.sectionHeader"

    var name: String { self.rawValue }
}
