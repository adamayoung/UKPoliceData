import Foundation

enum OutcomesEndpoint {

    private static let basePath = URL(string: "/")!
    private static let outcomesAtLocationBasePath = basePath.appendingPathComponent("outcomes-at-location")
    private static let outcomesForCrimeBasePath = basePath.appendingPathComponent("outcomes-for-crime")

    case streetLevelOutcomesForStreet(streetID: Int, date: Date? = nil)
    case streetLevelOutcomesAtSpecificPoint(coordinate: Coordinate, date: Date? = nil)
    case streetLevelOutcomesInArea(coordinates: [Coordinate], date: Date? = nil)
    case caseHistory(crimeID: String)

}

extension OutcomesEndpoint: Endpoint {

    var url: URL {
        switch self {
        case .streetLevelOutcomesForStreet(let streetID, let date):
            return Self.outcomesAtLocationBasePath
                .appendingQueryItem(name: "location_id", value: streetID)
                .appendingQueryItem(name: "date", date: date)

        case .streetLevelOutcomesAtSpecificPoint(let coordinate, let date):
            return Self.outcomesAtLocationBasePath
                .appendingQueryItem(name: "lat", value: coordinate.latitude)
                .appendingQueryItem(name: "lng", value: coordinate.longitude)
                .appendingQueryItem(name: "date", date: date)

        case .streetLevelOutcomesInArea(let coordinates, let date):
            return Self.outcomesAtLocationBasePath
                .appendingQueryItem(name: "poly", coordinates: coordinates)
                .appendingQueryItem(name: "date", date: date)

        case .caseHistory(let crimeID):
            return Self.outcomesForCrimeBasePath
                .appendingPathComponent(crimeID)
        }
    }

}
