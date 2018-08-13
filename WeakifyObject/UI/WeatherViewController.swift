//
//  Copyright © 2018 Essential Developer. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
	@IBOutlet var label: UILabel!
	@IBOutlet var reloadButton: UIButton!
	var reloadData: () -> Void = {}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		reloadData()
	}
	
	@IBAction private func reload() {
		reloadData()
	}
}
