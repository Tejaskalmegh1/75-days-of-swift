// Day 12: Sets in Swift

// Creating a set
var languages: Set<String> = ["Swift", "Python", "Java"]

// Insert element
languages.insert("C++")

// Remove element
languages.remove("Java")

// Check for existence
print("Contains Swift?", languages.contains("Swift"))

// Loop through set
for language in languages {
    print("Language:", language)
}

// Set operations
let backend: Set<String> = ["Java", "Python", "Node"]
let mobile: Set<String> = ["Swift", "Kotlin", "Java"]

print("Common:", backend.intersection(mobile))
print("All:", backend.union(mobile))
