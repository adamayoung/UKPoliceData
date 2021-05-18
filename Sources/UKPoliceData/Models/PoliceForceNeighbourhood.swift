import Foundation

/// A Police Force's Neighbourhood.
public struct PoliceForceNeighbourhood: Decodable, Equatable {

    /// Unique force identifier.
    public let force: String
    /// Force specific team identifier.
    public let neighbourhood: String

    /// Creates a a new `PoliceForceNeighbourhood`.
    ///
    /// - Parameters:
    ///     - force: Unique force identifier.
    ///     - neighbourhood: Force specific team identifier.
    public init(force: String, neighbourhood: String) {
        self.force = force
        self.neighbourhood = neighbourhood
    }

}