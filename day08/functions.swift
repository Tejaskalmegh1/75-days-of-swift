// Day 8: Functions in Swift

// Function without parameters
func greet() {
    print("Hello, Swift!")
}

greet()

// Function with parameters
func greetUser(name: String) {
    print("Hello, \(name)!")
}

greetUser(name: "Tejas")

// Function with return value
func addNumbers(a: Int, b: Int) -> Int {
    return a + b
}

let sum = addNumbers(a: 10, b: 20)
print("Sum:", sum)

// Function returning Bool
func isEven(number: Int) -> Bool {
    return number % 2 == 0
}

print("Is 4 even?", isEven(number: 4))
