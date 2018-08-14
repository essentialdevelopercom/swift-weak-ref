//
//  Copyright © 2018 Essential Developer. All rights reserved.
//

import Foundation

struct WeatherData: Hashable {
	let temperature: Measurement<UnitTemperature>
}

protocol FetchWeatherUseCaseOutput {
	func didFetch(_ weather: WeatherData)
}

final class FetchWeatherUseCase {
	let output: FetchWeatherUseCaseOutput
	
	init(output: FetchWeatherUseCaseOutput) {
		self.output = output
	}
	
	func fetch() {
		let temperature = Double(arc4random_uniform(21) + 15) // random between 15 - 35
		output.didFetch(WeatherData(temperature: Measurement(value: temperature, unit: .celsius)))
	}
}
