//
//  Copyright © 2018 Essential Developer. All rights reserved.
//

import XCTest
@testable import WeakifyObject

class AppDelegateTests: XCTestCase {
	private weak var weakSUT: WeatherViewController?
	private weak var weakVC: WeatherViewController?
	
	override func tearDown() {
		super.tearDown()
		
//		assertNoMemoryLeaks()
	}
	
	private func assertNoMemoryLeaks() {
		XCTAssertNil(weakVC)
		XCTAssertNil(weakSUT)
	}
	
	func testDidFinishLaunchingConfiguresWeatherViewController() {
		let vc = makeWeatherViewController()
		let sut = makeSUT(withRoot: vc)

		XCTAssertNil(vc.reloadData)
		
		_ = sut.application(.shared, didFinishLaunchingWithOptions: [:])
		
		XCTAssertNotNil(vc.reloadData)
	}
	
    func testWeatherViewControllerReloadDataShouldUpdateLabel() {
		let vc = makeWeatherViewController()
        let sut = makeSUT(withRoot: vc)
		
		_ = sut.application(.shared, didFinishLaunchingWithOptions: [:])
		
		let initialLabelValue = vc.label.text
		
		vc.reloadData?()
		
		XCTAssertNotEqual(vc.label.text, initialLabelValue)
    }
	
	// MARK: - Helpers
	
	private func makeSUT(withRoot vc: UIViewController) -> AppDelegate {
		let sut = AppDelegate()
		sut.window = UIWindow()
		sut.window?.rootViewController = vc
		return sut
	}
	
	private func makeWeatherViewController() -> WeatherViewController {
		let sb = UIStoryboard(name: "Main", bundle: nil)
		let vc = sb.instantiateInitialViewController() as! WeatherViewController
		vc.loadViewIfNeeded()
		self.weakVC = vc
		return vc
	}
}
