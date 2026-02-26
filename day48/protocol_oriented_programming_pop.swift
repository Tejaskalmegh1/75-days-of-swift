// Day 48: Protocol-Oriented Programming
// Topic: Composition over Inheritance

import Foundation

// MARK: - Protocol Definition

protocol Drivable {
    func startEngine()
}

protocol Electric {
    func chargeBattery()
}

// MARK: - Default Implementation

extension Drivable {
    func startEngine() {
        print("Engine started")
    }
}

// MARK: - Struct Conformance

struct Tesla: Drivable, Electric {
    func chargeBattery() {
        print("Battery charging...")
    }
}

struct BMW: Drivable { }

// MARK: - Usage

let tesla = Tesla()
tesla.startEngine()
tesla.chargeBattery()

let bmw = BMW()
bmw.startEngine()