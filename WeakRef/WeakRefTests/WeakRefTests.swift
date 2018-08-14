//
//  Copyright © 2018 Essential Developer. All rights reserved.
//

import XCTest
import WeakRef

class WeakRefTests: XCTestCase {
	
	func testWeakRefHoldsAWeakReferenceToTheGivenObject() {
		var anObject: MockObject? = MockObject() // anObject retain count = 1
		
		let sut = WeakRef(anObject!)
		
		XCTAssertEqual(ObjectIdentifier(sut.object!), ObjectIdentifier(anObject!), "Object reference should not be nil while it's still in memory")
		
		anObject = nil // retain count = 0 (memory should be freed now)
		
		XCTAssertNil(sut.object, "Object reference should be nil after the object has been freed")
	}
	
	private class MockObject {}
}
