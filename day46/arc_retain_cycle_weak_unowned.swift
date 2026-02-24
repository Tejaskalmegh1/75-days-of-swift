// Day 46: Memory Management in Swift
// Topic: ARC, Retain Cycles, weak vs unowned

import Foundation

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) initialized")
    }
    
    deinit {
        print("\(name) deallocated")
    }
}

// MARK: - Retain Cycle Example

class Owner {
    let name: String
    var pet: Pet?
    
    init(name: String) {
        self.name = name
        print("Owner initialized")
    }
    
    deinit {
        print("Owner deallocated")
    }
}

class Pet {
    let name: String
    weak var owner: Owner?
    
    init(name: String) {
        self.name = name
        print("Pet initialized")
    }
    
    deinit {
        print("Pet deallocated")
    }
}

// MARK: - Test

var owner: Owner? = Owner(name: "Tejas")
var pet: Pet? = Pet(name: "Buddy")

owner?.pet = pet
pet?.owner = owner

owner = nil
pet = nil