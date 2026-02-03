// Day 28: Generic Type Constraints in Swift

// Generic function with constraint
func findMax<T: Comparable>(_ a: T, _ b: T) -> T {
    return a > b ? a : b
}

print(findMax(10, 20))
print(findMax("Apple", "Banana"))

// Generic struct with constraint
struct Pair<T: Equatable> {
    let first: T
    let second: T

    func areEqual() -> Bool {
        return first == second
    }
}

let intPair = Pair(first: 5, second: 5)
print(intPair.areEqual())

let stringPair = Pair(first: "Swift", second: "Swift")
print(stringPair.areEqual())