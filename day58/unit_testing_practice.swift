// Day 58: Unit Testing in Swift
// Topic: Testing business logic using XCTest

import Foundation

class CalculatorViewModel {
    
    func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func multiply(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
}