@testable import UKPoliceData
import XCTest

class DataSetTests: XCTestCase {

    func testDecodeReturnsDataSet() throws {
        let result = try JSONDecoder.policeDataAPI
            .decode(DataSet.self, fromResource: "data-set", withExtension: "json")

        XCTAssertEqual(result, .mock)
    }

    func testSortReturnsSortedDataSets() {
        let dataSet1 = DataSet(
            date: DateFormatter.yearMonth.date(from: "2019-05")!,
            stopAndSearch: [
                "bedfordshire",
                "cleveland"
            ]
        )
        let dataSet2 = DataSet(
            date: DateFormatter.yearMonth.date(from: "2021-03")!,
            stopAndSearch: [
                "city-of-london",
                "leicestershire"
            ]
        )
        let expectedResult = [dataSet1, dataSet2]

        let result = [dataSet2, dataSet1].sorted()

        XCTAssertEqual(result, expectedResult)
    }

}
