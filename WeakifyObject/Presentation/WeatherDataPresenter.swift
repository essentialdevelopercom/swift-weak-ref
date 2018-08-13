//
//  Copyright © 2018 Essential Developer. All rights reserved.
//

import Foundation

struct WeatherViewModel: Equatable {
	let temperature: String
}

protocol WeatherPresenterOutput {
	func present(_ weather: WeatherViewModel)
}

final class WeatherDataPresenter: FetchWeatherOutput {
	let output: WeatherPresenterOutput
	private let converter: MeasurementFormatter
	
	init(output: WeatherPresenterOutput, locale: Locale = .current) {
		self.output = output
		self.converter = MeasurementFormatter()
		self.converter.locale = locale
	}
	
	func didFetch(_ weather: WeatherData) {
		output.present(WeatherViewModel(
			temperature: converter.string(
				from: weather.temperature)))
	}
}
