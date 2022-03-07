import Foundation

class WeatherService {
    private static let apiKey = ""
    private static let serviceURL =
        "https://api.openweathermap.org/data/2.5/weather?appid=\(apiKey)&units=metric"
    
    func getWeather(
        cityName: String,
        completionHandler: @escaping (Weather?) -> Void
    ) {
        completionHandler(nil)
    }
    
    private func getWeatherURL(cityName: String) -> URL? {
        let encodedCityName = cityName.addingPercentEncoding(
            withAllowedCharacters: .urlQueryAllowed
        ) ?? ""
        return URL(string: "\(WeatherService.serviceURL)&q=\(encodedCityName)")
    }
    
}
