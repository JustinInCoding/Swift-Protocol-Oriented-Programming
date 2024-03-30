import Foundation

class Distribution {
	// Virtual method with Virtual dispatch
	func sample() -> Double {
		fatalError("Must override")
	}
	
	func sample(count: Int) -> [Double] {
		return (1...count).map { _ in sample() }
	}
}

class UniformDistribution: Distribution {
	var range: ClosedRange<Int>
	
	init(range: ClosedRange<Int>) {
		self.range = range
	}
	
	override func sample() -> Double {
		return Double(Int.random(in: range))
	}
}

let d20 = UniformDistribution(range: 1...20)
d20.sample(count: 10)

// ---------------

class GeometryBase {
	func area() -> Double {
		fatalError("derived class must implement this")
	}
}

extension GeometryBase {
	// use @objc 是因为不标注的话这个方法不会被写到 V-Table 中，子类就无法 override 这个方法
	@objc func perimeter() -> Double {
		fatalError("derived class must implement this")
	}
}

// --------------

class DrawableBase: NSObject {
	// 即使我们继承了 NSObject ，该方法也只支持动态分发，dynamic dispath, 并不支持 message dispath
	// 需要添加 @objc 来支持 message dispatch
	// 添加 final 来支持 静态分发 static dispatch
	@objc func draw() {
		fatalError("derive")
	}
}

//: [Next](@next)
