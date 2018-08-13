//
//  Copyright © 2018 Essential Developer. All rights reserved.
//

import XCTest
@testable import WeakifyObject

class WeatherViewControllerTests: XCTestCase {
	private let sb = UIStoryboard(name: "Main", bundle: nil)
	
	func testCanCreateFromStoryboard() {
		let sut = sb.instantiateInitialViewController()
		
		XCTAssertTrue(sut is WeatherViewController)
	}
	
	func testLabelOutletIsConnected() {
		XCTAssertNotNil(makeSUT().label)
	}
	
	func testReloadButtonOutletIsConnected() {
		XCTAssertNotNil(makeSUT().reloadButton)
	}
	
	func testReloadButtonTapTriggersReloadDataClosure() {
		let sut = makeSUT()
		
		var callCount = 0
		sut.reloadData = { callCount += 1 }
		
		XCTAssertEqual(callCount, 0)
		
		sut.reloadButton.sendActions(for: .touchUpInside)
		XCTAssertEqual(callCount, 1)
		
		sut.reloadButton.sendActions(for: .touchUpInside)
		XCTAssertEqual(callCount, 2)
	}
	
	// MARK: - Helpers
	
	private func makeSUT() -> WeatherViewController {
		let sut = sb.instantiateInitialViewController() as! WeatherViewController
		sut.loadViewIfNeeded()
		return sut
	}
}
