import UIKit

class ViewController: UIViewController {

    @IBOutlet private var searchBar: UISearchBar!
    
    @IBOutlet private var emptyDataLabel: UILabel!
    
    @IBOutlet private var weatherStackView: UIStackView!
    @IBOutlet private var cityLabel: UILabel!
    @IBOutlet private var temperatureLabel: UILabel!
    @IBOutlet private var conditionLabel: UILabel!
    @IBOutlet private var humidityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchBar.delegate = self
    }

}

// MARK: - UISearchBarDelegate

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let city = searchBar.text ?? ""
        guard city != "" else {
            let alert = UIAlertController(
                title: "",
                message: "Please enter a city name.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            return
        }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        WeatherService().getWeather(cityName: city) { weather in
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                if let weather = weather {
                    self.emptyDataLabel.isHidden = true
                    
                    self.weatherStackView.isHidden = false
                    self.cityLabel.text = "\(weather.city), \(weather.countryCode)"
                    self.temperatureLabel.text = String(
                        format: "%.0f°C",
                        weather.temperature.rounded()
                    )
                    self.conditionLabel.text = weather.condition
                    self.humidityLabel.text = "Humidity: \(weather.humidity)%"
                } else {
                    let alert = UIAlertController(
                        title: "Unable to load weather data",
                        message: nil,
                        preferredStyle: .alert
                    )
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true)
                }
            }
        }
        
        searchBar.resignFirstResponder()
    }
    
}

