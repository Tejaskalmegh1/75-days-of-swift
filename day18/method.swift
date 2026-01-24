// Day 18: Methods in Swift

struct Counter {
    var count: Int = 0

    func show() {
        print("Current count:", count)
    }

    mutating func increment() {
        count += 1
    }

    mutating func reset() {
        count = 0
    }
}

var counter = Counter()

counter.show()
counter.increment()
counter.increment()
counter.show()
counter.reset()
counter.show()
