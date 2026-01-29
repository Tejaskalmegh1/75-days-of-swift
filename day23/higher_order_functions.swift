// Day 23: Higher-Order Functions in Swift

let numbers = [1, 2, 3, 4, 5]

// map – transform values
let squaredNumbers = numbers.map { $0 * $0 }
print("Squared:", squaredNumbers)

// filter – select values
let evenNumbers = numbers.filter { $0 % 2 == 0 }
print("Even:", evenNumbers)

// reduce – combine values
let totalSum = numbers.reduce(0) { $0 + $1 }
print("Sum:", totalSum)
