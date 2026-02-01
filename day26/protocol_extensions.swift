// Day 26: Protocol Extensions in Swift

protocol Greetable {
    var name: String { get }
    func greet()
}

// Default implementation
extension Greetable {
    func greet() {
        print("Hello, my name is \(name)")
    }
}

struct Person: Greetable {
    var name: String
}

class Developer: Greetable {
    var name: String

    init(name: String) {
        self.name = name
    }
}

let person = Person(name: "Tejas")
person.greet()

let dev = Developer(name: "Swift Developer")
dev.greet()