//
//  Copyright © 2018 Essential Developer. All rights reserved.
//

import Foundation

public final class WeakRef<T: AnyObject> {
	public weak var object: T?
	
	public init(_ object: T) {
		self.object = object
	}
}
