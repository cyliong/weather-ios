import UIKit

class ViewController: UIViewController {

    @IBOutlet private var emptyDataLabel: UILabel!
    
    @IBOutlet private var weatherStackView: UIStackView!
    @IBOutlet private var cityLabel: UILabel!
    @IBOutlet private var temperatureLabel: UILabel!
    @IBOutlet private var conditionLabel: UILabel!
    @IBOutlet private var humidityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

