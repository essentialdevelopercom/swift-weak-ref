//
//  Copyright © 2018 Essential Developer. All rights reserved.
//

import XCTest
@testable import WeakifyObject

class WeatherDataPresenterTests: XCTestCase {

	func testDidFetchPassesMessageToOutput() {
		let output = OutputSpy()
		let sut = WeatherDataPresenter(output: output)
		
		XCTAssertEqual(output.messages.count, 0)
		
		sut.didFetch(WeatherData(temperature: Measurement(value: 10, unit: .celsius)))
		XCTAssertEqual(output.messages.count, 1)
		
		sut.didFetch(WeatherData(temperature: Measurement(value: 20, unit: .kelvin)))
		XCTAssertEqual(output.messages.count, 2)
	}

    func testTranslatesDataToViewModelInFahrenheitForUSLocale() {
		let output = OutputSpy()
		let sut = WeatherDataPresenter(output: output, locale: Locale(identifier: "en_US"))

		sut.didFetch(WeatherData(temperature: Measurement(value: 10, unit: .celsius)))
		
		XCTAssertEqual(output.messages, [WeatherViewModel(temperature: "50°F")])
    }
	
	func testTranslatesDataToViewModelInCelsiusForUKLocale() {
		let output = OutputSpy()
		let sut = WeatherDataPresenter(output: output, locale: Locale(identifier: "en_GB"))
		
		sut.didFetch(WeatherData(temperature: Measurement(value: 50, unit: .fahrenheit)))
		
		XCTAssertEqual(output.messages, [WeatherViewModel(temperature: "10°C")])
	}

	// MARK: - Helpers
	
	private class OutputSpy: WeatherDataPresenterOutput {
		typealias Message = (WeatherViewModel)
		
		var messages = [Message]()
		func present(_ weather: WeatherViewModel) {
			messages.append(weather)
		}
	}
}
