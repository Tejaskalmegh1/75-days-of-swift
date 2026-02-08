// Day 32: Memory Management & ARC

class Person {
    let name: String
    var apartment: Apartment?

    init(name: String) {
        self.name = name
        print("\(name) initialized")
    }

    deinit {
        print("\(name) deallocated")
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
        print("Apartment \(unit) deallocated")
    }
}

var person: Person? = Person(name: "Tejas")
var apartment: Apartment? = Apartment(unit: "A-101")

person?.apartment = apartment
apartment?.tenant = person

person = nil
apartment = nil
