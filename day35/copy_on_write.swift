// Day 35: Copy-on-Write in Swift

var arrayA = [1, 2, 3]
var arrayB = arrayA   // No copy yet (shared memory)

// Modify arrayB
arrayB.append(4)      // Now a copy happens

print("Array A:", arrayA)
print("Array B:", arrayB)

// String example
var stringA = "Swift"
var stringB = stringA

stringB.append(" Programming")

print("String A:", stringA)
print("String B:", stringB)
