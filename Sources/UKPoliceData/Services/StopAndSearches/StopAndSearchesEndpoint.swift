import Foundation

enum StopAndSearchesEndpoint {

    private static let basePath = URL(string: "/")!
    private static let stopsStreetBasePath = Self.basePath.appendingPathComponent("stops-street")
    private static let stopsAtLocationBasePath = Self.basePath.appendingPathComponent("stops-at-location")
    private static let stopsNoLocationBasePath = Self.basePath.appendingPathComponent("stops-no-location")
    private static let stopsForceBasePath = Self.basePath.appendingPathComponent("stops-force")

    case stopAndSearchesByAreaAtSpecificPoint(coordinate: Coordinate, date: Date? = nil)
    case stopAndSearchesByAreaInArea(coordinates: [Coordinate], date: Date? = nil)
    case stopAndSearchesAtLocation(streetID: Int, date: Date? = nil)
    case stopAndSearchesWithNoLocation(policeForceID: String, date: Date? = nil)
    case stopAndSearchesByPoliceForce(policeForceID: String, date: Date? = nil)

}

extension StopAndSearchesEndpoint: Endpoint {

    var url: URL {
        switch self {
        case .stopAndSearchesByAreaAtSpecificPoint(let coordinate, let date):
            return Self.stopsStreetBasePath
                .appendingQueryItem(name: "lat", value: coordinate.latitude)
                .appendingQueryItem(name: "lng", value: coordinate.longitude)
                .appendingQueryItem(name: "date", date: date)

        case .stopAndSearchesByAreaInArea(let coordinates, let date):
            return Self.stopsStreetBasePath
                .appendingQueryItem(name: "poly", coordinates: coordinates)
                .appendingQueryItem(name: "date", date: date)

        case .stopAndSearchesAtLocation(let streetID, let date):
            return Self.stopsAtLocationBasePath
                .appendingQueryItem(name: "location_id", value: streetID)
                .appendingQueryItem(name: "date", date: date)

        case .stopAndSearchesWithNoLocation(let policeForceID, let date):
            return Self.stopsNoLocationBasePath
                .appendingQueryItem(name: "force", value: policeForceID)
                .appendingQueryItem(name: "date", date: date)

        case .stopAndSearchesByPoliceForce(let policeForceID, let date):
            return Self.stopsForceBasePath
                .appendingQueryItem(name: "force", value: policeForceID)
                .appendingQueryItem(name: "date", date: date)
        }
    }

}
