@testable import UKPoliceData
import XCTest

class UKCrimeServiceTests: XCTestCase {

    var service: UKCrimeService!
    var apiClient: MockAPIClient!

    override func setUp() {
        super.setUp()
        apiClient = MockAPIClient()
        service = UKCrimeService(apiClient: apiClient)
    }

    override func tearDown() {
        apiClient = nil
        service = nil
        super.tearDown()
    }

    func testFetchStreetLevelCrimesAtCoorindateReturnsCrimes() {
        let coordinate = Coordinate.mock
        let date = Date()
        let expectedResult = Crime.mocks
        apiClient.response = expectedResult

        let expectation = XCTestExpectation(description: "await")
        service.fetchStreetLevelCrimes(atCoordinate: coordinate, date: date) { result in
            XCTAssertEqual(try? result.get(), expectedResult)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)

        XCTAssertEqual(apiClient.lastPath,
                       CrimesEndpoint.streetLevelCrimesAtSpecificPoint(coordinate: coordinate, date: date).url)
    }

    func testFetchStreetLevelCrimesAtCoorindateWhenNoDateReturnsCrimes() {
        let coordinate = Coordinate.mock
        let expectedResult = Crime.mocks
        apiClient.response = expectedResult

        let expectation = XCTestExpectation(description: "await")
        service.fetchStreetLevelCrimes(atCoordinate: coordinate) { result in
            XCTAssertEqual(try? result.get(), expectedResult)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)

        XCTAssertEqual(apiClient.lastPath, CrimesEndpoint.streetLevelCrimesAtSpecificPoint(coordinate: coordinate).url)
    }

    func testFetchStreetLevelCrimesInAreaReturnsCrimes() {
        let coordinates = Coordinate.mocks
        let date = Date()
        let expectedResult = Crime.mocks
        apiClient.response = expectedResult

        let expectation = XCTestExpectation(description: "await")
        service.fetchStreetLevelCrimes(inArea: coordinates, date: date) { result in
            XCTAssertEqual(try? result.get(), expectedResult)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)

        XCTAssertEqual(apiClient.lastPath,
                       CrimesEndpoint.streetLevelCrimesInArea(coordinates: coordinates, date: date).url)
    }

    func testFetchStreetLevelCrimesInAreaWhenNoDateReturnsCrimes() {
        let coordinates = Coordinate.mocks
        let expectedResult = Crime.mocks
        apiClient.response = expectedResult

        let expectation = XCTestExpectation(description: "await")
        service.fetchStreetLevelCrimes(inArea: coordinates) { result in
            XCTAssertEqual(try? result.get(), expectedResult)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)

        XCTAssertEqual(apiClient.lastPath, CrimesEndpoint.streetLevelCrimesInArea(coordinates: coordinates).url)
    }

    func testFetchCrimesForStreetReturnsCrimes() {
        let expectedResult = Crime.mocks
        let streetID = expectedResult[0].location.street.id
        let date = Date()
        apiClient.response = expectedResult

        let expectation = XCTestExpectation(description: "await")
        service.fetchCrimes(forStreet: streetID, date: date) { result in
            XCTAssertEqual(try? result.get(), expectedResult)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)

        XCTAssertEqual(apiClient.lastPath, CrimesEndpoint.crimesAtLocationForStreet(streetID: streetID, date: date).url)
    }

    func testFetchCrimesForStreetWhenNoDateReturnsCrimes() {
        let expectedResult = Crime.mocks
        let streetID = expectedResult[0].location.street.id
        apiClient.response = expectedResult

        let expectation = XCTestExpectation(description: "await")
        service.fetchCrimes(forStreet: streetID) { result in
            XCTAssertEqual(try? result.get(), expectedResult)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)

        XCTAssertEqual(apiClient.lastPath, CrimesEndpoint.crimesAtLocationForStreet(streetID: streetID).url)
    }

    func testFetchCrimesAtCoordinateReturnsCrimes() {
        let coordinate = Coordinate.mock
        let date = Date()
        let expectedResult = Crime.mocks
        apiClient.response = expectedResult

        let expectation = XCTestExpectation(description: "await")
        service.fetchCrimes(atCoordinate: coordinate, date: date) { result in
            XCTAssertEqual(try? result.get(), expectedResult)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)

        XCTAssertEqual(apiClient.lastPath,
                       CrimesEndpoint.crimesAtLocationAtSpecificPoint(coordinate: coordinate, date: date).url)
    }

    func testFetchCrimesAtCoordinateWhenNoDateReturnsCrimes() {
        let coordinate = Coordinate.mock
        let expectedResult = Crime.mocks
        apiClient.response = expectedResult

        let expectation = XCTestExpectation(description: "await")
        service.fetchCrimes(atCoordinate: coordinate) { result in
            XCTAssertEqual(try? result.get(), expectedResult)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)

        XCTAssertEqual(apiClient.lastPath, CrimesEndpoint.crimesAtLocationAtSpecificPoint(coordinate: coordinate).url)
    }

    func testFetchCrimesWithNoLocationReturnsCrimes() {
        let categoryID = CrimeCategory.mock.id
        let policeForceID = PoliceForce.mock.id
        let date = Date()
        let expectedResult = Crime.mocks
        apiClient.response = expectedResult

        let expectation = XCTestExpectation(description: "await")
        service.fetchCrimesWithNoLocation(forCategory: categoryID, inPoliceForce: policeForceID, date: date) { result in
            XCTAssertEqual(try? result.get(), expectedResult)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)

        XCTAssertEqual(apiClient.lastPath,
                       CrimesEndpoint.crimesWithNoLocation(categoryID: categoryID, policeForceID: policeForceID,
                                                           date: date).url)
    }

    func testFetchCrimesWithNoLocationWhenNoCategoryOrDateReturnsCrimes() {
        let policeForceID = PoliceForce.mock.id
        let expectedResult = Crime.mocks
        apiClient.response = expectedResult

        let expectation = XCTestExpectation(description: "await")
        service.fetchCrimesWithNoLocation(inPoliceForce: policeForceID) { result in
            XCTAssertEqual(try? result.get(), expectedResult)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)

        XCTAssertEqual(apiClient.lastPath, CrimesEndpoint.crimesWithNoLocation(categoryID: CrimeCategory.defaultID,
                                                                               policeForceID: policeForceID).url)
    }

    func testFetchCrimeCategoriesReturnsCrimeCategories() {
        let expectedResult = CrimeCategory.mocks
        let date = Date()
        apiClient.response = expectedResult

        let expectation = XCTestExpectation(description: "await")
        service.fetchCrimeCategories(forDate: date) { result in
            XCTAssertEqual(try? result.get(), expectedResult)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)

        XCTAssertEqual(apiClient.lastPath, CrimesEndpoint.categories(date: date).url)
    }

}
