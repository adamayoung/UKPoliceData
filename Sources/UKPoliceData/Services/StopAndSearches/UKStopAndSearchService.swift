import Foundation

#if canImport(Combine)
import Combine
#endif

final class UKStopAndSearchService: StopAndSearchService {

    private let apiClient: APIClient

    init(apiClient: APIClient = PoliceDataAPIClient.shared) {
        self.apiClient = apiClient
    }

    func fetchAll(atCoordinate coordinate: Coordinate, date: Date?,
                  completion: @escaping (_ result: Result<[StopAndSearch], PoliceDataError>) -> Void) {
        apiClient.get(endpoint: StopAndSearchesEndpoint.stopAndSearchesByAreaAtSpecificPoint(coordinate: coordinate,
                                                                                             date: date),
                      completion: completion)
    }

    func fetchAll(inArea coordinates: [Coordinate], date: Date?,
                  completion: @escaping (_ result: Result<[StopAndSearch], PoliceDataError>) -> Void) {
        apiClient.get(endpoint: StopAndSearchesEndpoint.stopAndSearchesByAreaInArea(coordinates: coordinates,
                                                                                    date: date),
                      completion: completion)
    }

    func fetchAll(atLocation streetID: Int, date: Date?,
                  completion: @escaping (_ result: Result<[StopAndSearch], PoliceDataError>) -> Void) {
        apiClient.get(endpoint: StopAndSearchesEndpoint.stopAndSearchesAtLocation(streetID: streetID, date: date),
                      completion: completion)
    }

    func fetchAllWithNoLocation(forPoliceForce policeForceID: String, date: Date?,
                                completion: @escaping (_ result: Result<[StopAndSearch], PoliceDataError>) -> Void) {
        apiClient.get(endpoint: StopAndSearchesEndpoint.stopAndSearchesWithNoLocation(policeForceID: policeForceID,
                                                                                      date: date),
                      completion: completion)
    }

    func fetchAll(forPoliceForce policeForceID: String, date: Date?,
                  completion: @escaping (_ result: Result<[StopAndSearch], PoliceDataError>) -> Void) {
        apiClient.get(endpoint: StopAndSearchesEndpoint.stopAndSearchesByPoliceForce(policeForceID: policeForceID,
                                                                                     date: date),
                      completion: completion)
    }

}

#if canImport(Combine)
extension UKStopAndSearchService {

    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func stopAndSearchesPublisher(atCoordinate coordinate: Coordinate,
                                  date: Date?) -> AnyPublisher<[StopAndSearch], PoliceDataError> {
        apiClient.get(endpoint: StopAndSearchesEndpoint.stopAndSearchesByAreaAtSpecificPoint(coordinate: coordinate,
                                                                                             date: date))
    }

    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func stopAndSearchesPublisher(inArea coordinates: [Coordinate],
                                  date: Date?) -> AnyPublisher<[StopAndSearch], PoliceDataError> {
        apiClient.get(endpoint: StopAndSearchesEndpoint.stopAndSearchesByAreaInArea(coordinates: coordinates,
                                                                                    date: date))
    }

    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func stopAndSearchesPublisher(atLocation streetID: Int,
                                  date: Date?) -> AnyPublisher<[StopAndSearch], PoliceDataError> {
        apiClient.get(endpoint: StopAndSearchesEndpoint.stopAndSearchesAtLocation(streetID: streetID, date: date))
    }

    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func stopAndSearchesWithNoLocationPublisher(forPoliceForce policeForceID: String,
                                                date: Date?) -> AnyPublisher<[StopAndSearch], PoliceDataError> {
        apiClient.get(endpoint: StopAndSearchesEndpoint.stopAndSearchesWithNoLocation(policeForceID: policeForceID,
                                                                                      date: date))
    }

    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func stopAndSearchesPublisher(forPoliceForce policeForceID: String,
                                  date: Date?) -> AnyPublisher<[StopAndSearch], PoliceDataError> {
        apiClient.get(endpoint: StopAndSearchesEndpoint.stopAndSearchesByPoliceForce(policeForceID: policeForceID,
                                                                                     date: date))
    }

}
#endif
