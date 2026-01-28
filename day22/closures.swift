// Day 22: Closures in Swift

// Simple closure
let greet = {
    print("Hello, Swift!")
}

greet()

// Closure with parameters
let addNumbers = { (a: Int, b: Int) -> Int in
    return a + b
}

let result = addNumbers(5, 3)
print("Sum:", result)

// Function accepting a closure
func performOperation(_ operation: () -> Void) {
    operation()
}

// Trailing closure
performOperation {
    print("Operation completed")
}
