//
//  Copyright © 2018 Essential Developer. All rights reserved.
//

import Foundation
import WeakRef

extension WeakRef: WeatherDataPresenterOutput where T: WeatherDataPresenterOutput {
	func present(_ weather: WeatherViewModel) {
		object?.present(weather)
	}
}
