//
//  Copyright © 2018 Essential Developer. All rights reserved.
//

import Foundation

public final class WeakRef<T: AnyObject> {
    
    private let queue = DispatchQueue(label: "ThreadSafeWeakRef.queue", attributes: .concurrent)
    
    private(set) weak var _object: T?
    
    weak var object: T? {
        var result: T?
        
        queue.sync {
            result = _object
        }
        
        return result
    }
    
    
    init(object: T?) {
        queue.async(flags: .barrier) {
            self._object = object
        }
    }
}
