// Day 19: Initializers in Swift

struct Person {
    var name: String
    var age: Int

    // Custom initializer
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let person1 = Person(name: "Tejas", age: 25)
print("Name:", person1.name)
print("Age:", person1.age)

// Default initializer example
struct Car {
    var brand: String = "BMW"
    var year: Int = 1967
}

let car1 = Car()
print("Car Brand:", car1.brand)
print("Car Year:", car1.year)
