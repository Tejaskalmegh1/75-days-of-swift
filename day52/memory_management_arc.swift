// Day 52: Memory Management in Swift
// Topic: Automatic Reference Counting (ARC)

import Foundation

class Person {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
        print("\(name) initialized")
    }
    
    deinit {
        print("\(name) deinitialized")
    }
}

class Apartment {
    let unit: String
    weak var tenant: Person?
    
    init(unit: String) {
        self.unit = unit
        print("Apartment \(unit) initialized")
    }
    
    deinit {
        print("Apartment \(unit) deinitialized")
    }
}

// MARK: - Test ARC

var person: Person? = Person(name: "Tejas")
var apartment: Apartment? = Apartment(unit: "101")

person?.apartment = apartment
apartment?.tenant = person

// Remove references
person = nil
apartment = nil