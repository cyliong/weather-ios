import XCTest
@testable import Weather

class WeatherTests: XCTestCase {
    private let weatherService = WeatherService()

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testGetWeather() {
        let weather = weatherService.getWeather(cityName: "Singapore")
        XCTAssertNotNil(weather)
    }

}
