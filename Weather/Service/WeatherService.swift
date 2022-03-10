import Foundation

class WeatherService {
    private static let apiKey = ""
    private static let serviceURL =
        "https://api.openweathermap.org/data/2.5/weather?appid=\(apiKey)&units=metric"
    
    private typealias JSONDictionary = [String: Any]
    
    func getWeather(
        cityName: String,
        completionHandler: @escaping (Weather?) -> Void
    ) {
        let url = getWeatherURL(cityName: cityName)!
        let task = URLSession.shared.dataTask(with: url) {
            [weak self] (data, response, error) in
            
            let weather: Weather?
            if let data = data,
               error == nil,
               let httpResponse = response as? HTTPURLResponse,
               (200...299).contains(httpResponse.statusCode)
            {
                weather = self?.deserializeJSON(data: data)
            } else {
                weather = nil
            }
            completionHandler(weather)
        }
        task.resume()
    }
    
    private func deserializeJSON(data: Data) -> Weather? {
        guard
            let jsonDictionary = try? JSONSerialization.jsonObject(
                with: data,
                options: []
            ) as? JSONDictionary,
            let mainDictionary = jsonDictionary["main"] as? JSONDictionary,
            let temperature = mainDictionary["temp"] as? Double,
            let humidity = mainDictionary["humidity"] as? Int,
            let weatherDictionary = (
                jsonDictionary["weather"] as? [JSONDictionary]
            )?.first,
            let condition = weatherDictionary["main"] as? String,
            let city = jsonDictionary["name"] as? String,
            let systemDictionary = jsonDictionary["sys"] as? JSONDictionary,
            let countryCode = systemDictionary["country"] as? String
        else {
            return nil
        }
        
        return Weather(
            city: city,
            countryCode: countryCode,
            temperature: temperature,
            humidity: humidity,
            condition: condition
        )
    }
    
    private func getWeatherURL(cityName: String) -> URL? {
        let encodedCityName = cityName.addingPercentEncoding(
            withAllowedCharacters: .urlQueryAllowed
        ) ?? ""
        return URL(string: "\(WeatherService.serviceURL)&q=\(encodedCityName)")
    }
    
}
