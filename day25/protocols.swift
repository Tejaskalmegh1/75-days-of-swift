// Day 25: Protocols in Swift

protocol Greetable {
    var name: String { get }
    func greet()
}

struct Person: Greetable {
    var name: String

    func greet() {
        print("Hello, my name is \(name)")
    }
}

class Developer: Greetable {
    var name: String

    init(name: String) {
        self.name = name
    }

    func greet() {
        print("Hi, I'm \(name) and I write Swift code")
    }
}

let person = Person(name: "Tejas")
person.greet()

let dev = Developer(name: "Swift Dev")
dev.greet()