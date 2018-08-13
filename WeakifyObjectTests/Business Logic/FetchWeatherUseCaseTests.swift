//
//  Copyright © 2018 Essential Developer. All rights reserved.
//

import XCTest
@testable import WeakifyObject

class FetchWeatherUseCaseTests: XCTestCase {

    func testFetchSendsRandomWeatherDataOutput() {
		let output = OutputSpy()
		let sut = FetchWeatherUseCase(output: output)
		
		XCTAssertEqual(output.messages.count, 0)
		
		for i in 1...10 {
			sut.fetch()
			XCTAssertEqual(output.messages.count, i)
		}
		
		XCTAssertGreaterThan(output.uniqueMessages.count, 3, "Should have generated at least 3 unique random weather data from 10 tries")
    }
	
	// MARK: - Helpers

	private class OutputSpy: FetchWeatherUseCaseOutput {
		typealias Message = (WeatherData)
		
		var messages = [Message]()
		func didFetch(_ weather: Message) {
			messages.append(weather)
		}
		
		var uniqueMessages: Set<WeatherData> {
			return Set(messages)
		}
	}
}
