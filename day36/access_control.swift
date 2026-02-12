// Day 36: Access Control in Swift

public class Vehicle {
    
    public var brand: String
    private var engineNumber: String
    internal var model: String
    
    public init(brand: String, engineNumber: String, model: String) {
        self.brand = brand
        self.engineNumber = engineNumber
        self.model = model
    }
    
    public func start() {
        print("Vehicle started")
    }
    
    private func checkEngine() {
        print("Checking engine:", engineNumber)
    }
}

let car = Vehicle(brand: "Toyota", engineNumber: "12345", model: "Corolla")

print(car.brand)