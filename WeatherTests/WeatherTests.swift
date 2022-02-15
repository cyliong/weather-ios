import XCTest
@testable import Weather

class WeatherTests: XCTestCase {
    private let weatherService = WeatherService()

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testGetWeather() {
        let expectation = XCTestExpectation(description: "Get weather data")
        
        weatherService.getWeather(cityName: "Singapore") { weather in
            XCTAssertNotNil(weather)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)        
    }

}
