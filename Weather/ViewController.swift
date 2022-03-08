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
        
    }
    
}

