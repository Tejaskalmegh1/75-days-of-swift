// Day 30: Type Erasure in Swift

// Any example
let values: [Any] = [1, "Swift", 3.14, true]

for value in values {
    switch value {
    case let intValue as Int:
        print("Int:", intValue)
    case let stringValue as String:
        print("String:", stringValue)
    default:
        print("Other type")
    }
}

// AnyObject example
class Developer {
    let name: String
    init(name: String) {
        self.name = name
    }
}

let dev1 = Developer(name: "Tejas")
let dev2 = Developer(name: "iOS Dev")

let objects: [AnyObject] = [dev1, dev2]

for obj in objects {
    if let developer = obj as? Developer {
        print("Developer:", developer.name)
    }
}
