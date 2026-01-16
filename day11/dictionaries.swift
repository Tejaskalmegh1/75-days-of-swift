// Day 11: Dictionaries in Swift

// Creating a dictionary
var student: [String: String] = [
    "name": "Tejas",
    "course": "Swift",
    "level": "Beginner"
]

// Access values (returns optional)
if let name = student["name"] {
    print("Name:", name)
}

// Add new key-value pair
student["country"] = "India"

// Update value
student["level"] = "Intermediate"

// Remove value
student["course"] = nil

// Loop through dictionary
for (key, value) in student {
    print("\(key): \(value)")
}

// Dictionary properties
print("Total keys:", student.count)
print("Is dictionary empty?", student.isEmpty)
