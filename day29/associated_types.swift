// Day 29: Associated Types in Swift

protocol Container {
    associatedtype Item

    var items: [Item] { get }
    mutating func add(_ item: Item)
}

struct IntContainer: Container {
    var items: [Int] = []

    mutating func add(_ item: Int) {
        items.append(item)
    }
}

struct StringContainer: Container {
    var items: [String] = []

    mutating func add(_ item: String) {
        items.append(item)
    }
}

var intBox = IntContainer()
intBox.add(10)
intBox.add(20)
print(intBox.items)

var stringBox = StringContainer()
stringBox.add("Swift")
stringBox.add("iOS")
print(stringBox.items)