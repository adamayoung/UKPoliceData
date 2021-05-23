@testable import UKPoliceData
import XCTest

class StopAndSearchesEndpointTests: XCTestCase {

    func testStopAndSearchesByAreaAtSpecificPointEndpointReturnsURL() {
        let coordinate = Coordinate.mock
        let dateString = "2021-04"
        let date = DateFormatter.yearMonth.date(from: dateString)!
        let expectedURL = URL(
            string: "/stops-street?lat=\(coordinate.latitude)&lng=\(coordinate.longitude)&date=\(dateString)"
        )!

        let url = StopAndSearchesEndpoint.stopAndSearchesByAreaAtSpecificPoint(coordinate: coordinate, date: date).url

        XCTAssertEqual(url, expectedURL)
    }

    func testStopAndSearchesByAreaAtSpecificPointEndpointWhenNoDateReturnsURL() {
        let coordinate = Coordinate.mock
        let expectedURL = URL(
            string: "/stops-street?lat=\(coordinate.latitude)&lng=\(coordinate.longitude)"
        )!

        let url = StopAndSearchesEndpoint.stopAndSearchesByAreaAtSpecificPoint(coordinate: coordinate).url

        XCTAssertEqual(url, expectedURL)
    }

}