import Foundation

#if canImport(Combine)
import Combine
#endif

/// Get information about a Police Force Neighbourhoods.
public protocol NeighbourhoodService {

    /// Fetches a list of all the neighbourhoods in a police force.
    ///
    /// - Note: [Police API | List of neighbourhoods for a force](https://data.police.uk/docs/method/neighbourhoods/)
    ///
    /// - Parameters:
    ///     - policeForceID: Police Force identifier.
    ///     - completion: Completion handler.
    ///     - result: A list of Neighbourhoods.
    func fetchAll(inPoliceForce policeForceID: String,
                  completion: @escaping (_ result: Result<[NeighbourhoodReference], PoliceDataError>) -> Void)

    /// Fetches details of a neighbourhood in a police force.
    ///
    /// - Note: [Police API | Specific neighbourhood](https://data.police.uk/docs/method/neighbourhood/)
    ///
    /// - Parameters:
    ///     - id: Neighbourhood identifier.
    ///     - policeForceID: Police Force identifier.
    ///     - completion: Completion handler.
    ///     - result: The matching Neighbourhood.
    func fetchDetails(forNeighbourhood id: String, inPoliceForce policeForceID: String,
                      completion: @escaping (_ result: Result<Neighbourhood, PoliceDataError>) -> Void)

    /// Fetches a list of coordinates that make up the boundary of a neighbourhood.
    ///
    /// - Note: [Police API | Neighbourhood boundary](https://data.police.uk/docs/method/neighbourhood-boundary/)
    ///
    /// - Parameters:
    ///     - neighbourhoodID: Neighbourhood identifier.
    ///     - policeForceID: Police Force identifier.
    ///     - completion: Completion handler.
    ///     - result: A list of coordinates that make up the boundary of the matching neighbourhood.
    func fetchBoundary(forNeighbourhood neighbourhoodID: String, inPoliceForce policeForceID: String,
                       completion: @escaping (_ result: Result<[Coordinate], PoliceDataError>) -> Void)

    /// Fetches a list of Police Officers who are members of the neighbourhood team for a neighbourhood.
    ///
    /// - Note: [Police API | Neighbourhood team](https://data.police.uk/docs/method/neighbourhood-team/)
    ///
    /// - Parameters:
    ///     - neighbourhoodID: Neighbourhood identifier.
    ///     - policeForceID: Police Force identifier.
    ///     - completion: Completion handler.
    ///     - result: A list of police officers who are members of the neighbourhood team for the matching neighbourhood.
    func fetchPoliceOfficers(forNeighbourhood neighbourhoodID: String, inPoliceForce policeForceID: String,
                             completion: @escaping (_ result: Result<[PoliceOfficer], PoliceDataError>) -> Void)

    #if canImport(Combine)
    /// Publishes a list of all the neighbourhoods in a police force.
    ///
    /// - Note: [Police API | List of neighbourhoods for a force](https://data.police.uk/docs/method/neighbourhoods/)
    ///
    /// - Parameters:
    ///     - policeForceID: Police Force identifier.
    ///
    /// - Returns: A publisher with a list of Neighbourhoods.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func neighbourhoodsPublisher(
        inPoliceForce policeForceID: String) -> AnyPublisher<[NeighbourhoodReference], PoliceDataError>

    /// Publishes details of a neighbourhood in a police force.
    ///
    /// - Note: [Police API | Specific neighbourhood](https://data.police.uk/docs/method/neighbourhood/)
    ///
    /// - Parameters:
    ///     - id: Neighbourhood identifier.
    ///     - policeForceID: Police Force identifier.
    ///
    /// - Returns: A publisher with the matching Neighbourhood.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func detailsPublisher(forNeighbourhood id: String,
                          inPoliceForce policeForceID: String) -> AnyPublisher<Neighbourhood, PoliceDataError>

    /// Publishes a list of coordinates that make up the boundary of a neighbourhood.
    ///
    /// - Note: [Police API | Neighbourhood boundary](https://data.police.uk/docs/method/neighbourhood-boundary/)
    ///
    /// - Parameters:
    ///     - neighbourhoodID: Neighbourhood identifier.
    ///     - policeForceID: Police Force identifier.
    ///
    /// - Returns: A publisher with a list of coordinates that make up the boundary of the matching neighbourhood.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func boundaryPublisher(forNeighbourhood neighbourhoodID: String,
                           inPoliceForce policeForceID: String) -> AnyPublisher<[Coordinate], PoliceDataError>

    /// Publishes a list of Police Officers who are members of the neighbourhood team for a neighbourhood.
    ///
    /// - Note: [Police API | Neighbourhood team](https://data.police.uk/docs/method/neighbourhood-team/)
    ///
    /// - Parameters:
    ///     - neighbourhoodID: Neighbourhood identifier.
    ///     - policeForceID: Police Force identifier.
    /// - Returns: A publisher with a list of police officers who are members of the neighbourhood team for the matching neighbourhood.
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func policeOfficersPublisher(forNeighbourhood neighbourhoodID: String,
                                 inPoliceForce policeForceID: String) -> AnyPublisher<[PoliceOfficer], PoliceDataError>
    #endif

}
