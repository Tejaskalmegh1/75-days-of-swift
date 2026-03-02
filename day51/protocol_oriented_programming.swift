// Day 51: Protocol-Oriented Programming in Swift
// Topic: Protocols + Extensions + Default Implementations

import Foundation

// MARK: - Protocol Definition

protocol Vehicle {
    var speed: Double { get set }
    func description() -> String
}

// MARK: - Default Implementation

extension Vehicle {
    func description() -> String {
        return "This vehicle moves at \(speed) km/h"
    }
}

// MARK: - Conforming Types

struct Car: Vehicle {
    var speed: Double
}

struct Bike: Vehicle {
    var speed: Double
}

// MARK: - Usage

let car = Car(speed: 120)
let bike = Bike(speed: 60)

print(car.description())
print(bike.description())