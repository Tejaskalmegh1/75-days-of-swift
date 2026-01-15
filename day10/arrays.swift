// Day 10: Arrays in Swift

// Creating arrays
var numbers = [1, 2, 3, 4, 5]
var fruits = ["Apple", "Banana", "Mango"]

// Access elements
print("First number:", numbers[0])
print("Second fruit:", fruits[1])

// Add elements
numbers.append(6)
fruits.append("Orange")

// Remove element
fruits.remove(at: 0)

// Loop through array
for fruit in fruits {
    print("Fruit:", fruit)
}

// Array properties
print("Total numbers:", numbers.count)
print("Is fruits empty?", fruits.isEmpty)

