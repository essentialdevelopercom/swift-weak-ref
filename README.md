# `WeakRef`: A Swift type-safe alternative to `weak` properties

`WeakRef` is a type-safe alternative to `weak` properties that maintains a clean cross-boundary separation of concerns. 

```
final class WeakRef<T: AnyObject> {
	weak var object: T?
	
	init(_ object: T) {
		self.object = object
	}
}
```

Usage example:

```
let vc = WeatherViewController()
let presenter = WeatherPresenter(view: WeakRef(vc))
vc.presenter = presenter
```

Learn more at: https://www.essentialdeveloper.com/articles/clean-ios-architecture-pt-4-clean-memory-management-in-swift-with-weakref