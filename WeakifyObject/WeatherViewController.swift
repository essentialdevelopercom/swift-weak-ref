//
//  Copyright © 2018 Essential Developer. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
	@IBOutlet var label: UILabel!
	@IBOutlet var reloadButton: UIButton!
	var reloadData: () -> Void = {}
	
	@IBAction private func reload() {
		reloadData()
	}
}
