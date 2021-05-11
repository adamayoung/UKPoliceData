@testable import UKPoliceData
import XCTest

class CrimesEndpointTests: XCTestCase {

    func testStreetLevelAtSpecificPointEndpointReturnsURL() {
        let coordinate = Coordinate(latitude: 52.6688, longitude: -0.750049)
        let dateString = "2021-04"
        let date = DateFormatter.yearMonth.date(from: dateString)!
        let expectedURL = URL(
            string: "/crimes-at-location?lat=\(coordinate.latitude)&lng=\(coordinate.longitude)&date=\(dateString)"
        )!

        let url = CrimesEndpoint.streetLevelAtSpecificPoint(coordinate: coordinate, date: date).url

        XCTAssertEqual(url, expectedURL)
    }

    func testStreetLevelAtSpecificPointEndpointWhenNoDateReturnsURL() {
        let coordinate = Coordinate(latitude: 52.6688, longitude: -0.750049)
        let expectedURL = URL(
            string: "/crimes-at-location?lat=\(coordinate.latitude)&lng=\(coordinate.longitude)"
        )!

        let url = CrimesEndpoint.streetLevelAtSpecificPoint(coordinate: coordinate).url

        XCTAssertEqual(url, expectedURL)
    }

    func testStreetLevelInCustomAreaEndpointReturnURL() {
        let coordinates = [
            Coordinate(latitude: 52.6688, longitude: -0.750049),
            Coordinate(latitude: 54.3698, longitude: -0.713541)
        ]
        let coordinatePairs = coordinates.map { "\($0.latitude),\($0.longitude)" }
        let dateString = "2021-04"
        let date = DateFormatter.yearMonth.date(from: dateString)!
        let expectedURL = URL(
            string: "/crimes-at-location?poly=\(coordinatePairs.joined(separator: ":"))&date=\(dateString)"
        )!

        let url = CrimesEndpoint.streetLevelInCustomArea(coordinates: coordinates, date: date).url

        XCTAssertEqual(url, expectedURL)
    }

    func testStreetLevelInCustomAreaEndpointWhenNoDateReturnURL() {
        let coordinates = [
            Coordinate(latitude: 52.6688, longitude: -0.750049),
            Coordinate(latitude: 54.3698, longitude: -0.713541)
        ]
        let coordinatePairs = coordinates.map { "\($0.latitude),\($0.longitude)" }
        let expectedURL = URL(
            string: "/crimes-at-location?poly=\(coordinatePairs.joined(separator: ":"))"
        )!

        let url = CrimesEndpoint.streetLevelInCustomArea(coordinates: coordinates).url

        XCTAssertEqual(url, expectedURL)
    }

    func testCategoriesEndpointReturnsURL() {
        let dateString = "2021-04"
        let date = DateFormatter.yearMonth.date(from: dateString)!
        let expectedURL = URL(string: "/crime-categories?date=\(dateString)")!

        let url = CrimesEndpoint.categories(date: date).url

        XCTAssertEqual(url, expectedURL)
    }

}