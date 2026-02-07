// Day 31: Closures in Swift

// Basic closure
let add: (Int, Int) -> Int = { (a, b) in
    return a + b
}

print(add(3, 4))

// Shortened syntax
let multiply: (Int, Int) -> Int = { $0 * $1 }
print(multiply(2, 5))

// Trailing closure
let numbers = [1, 2, 3, 4, 5]

let doubled = numbers.map { number in
    number * 2
}

print(doubled)

// Capturing values
func makeCounter() -> () -> Int {
    var count = 0
    return {
        count += 1
        return count
    }
}

let counter = makeCounter()
print(counter())
print(counter())
print(counter())
