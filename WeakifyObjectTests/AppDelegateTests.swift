//
//  Copyright © 2018 Essential Developer. All rights reserved.
//

import XCTest
@testable import WeakifyObject

class AppDelegateTests: XCTestCase {
	private weak var weakVC: WeatherViewController?
	
	override func tearDown() {
		super.tearDown()
		
//		assertNoMemoryLeaks()
	}
	
	private func assertNoMemoryLeaks() {
		XCTAssertNil(weakVC)
	}
	
    func testDidFinishLaunchingConfiguresWeatherViewController() {
		let vc = makeWeatherViewController()
		
        let sut = AppDelegate()
		sut.window = UIWindow()
		sut.window?.rootViewController = vc
		
		_ = sut.application(UIApplication.shared, didFinishLaunchingWithOptions: [:])
		
		let initialLabelValue = vc.label.text
		
		vc.reloadData?()
		
		XCTAssertNotEqual(vc.label.text, initialLabelValue)
    }
	
	private func makeWeatherViewController() -> WeatherViewController {
		let sb = UIStoryboard(name: "Main", bundle: nil)
		let vc = sb.instantiateInitialViewController() as! WeatherViewController
		vc.loadViewIfNeeded()
		self.weakVC = vc
		return vc
	}
}
