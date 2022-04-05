# weather-ios
This is a simple weather app built with UIKit, 
showcasing various iOS programming techniques, including:
- Asynchronous network requests using `URLSession`
- Deserialize JSON response using `JSONSerialization`
- Update main thread using `DispatchQueue.main`
- Layouts with `UIStackView` and `UISearchBar`
- Type aliases
- Singleton design pattern

## Features
- Search by city name
- Display the city's weather condition

## Requirements
- Xcode 13.3 or higher
- iOS 10.0 or higher
- Swift 5 or higher

## Setup
1. Get your API key 
   from [OpenWeatherMap](https://openweathermap.org/api).
2. Replace the `apiKey` constant in `WeatherService.swift` 
   with your API key.