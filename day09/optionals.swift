// Day 9: Optionals in Swift

var userName: String? = "Tejas"
var userAge: Int? = nil

// Optional binding
if let name = userName {
    print("Username:", name)
} else {
    print("No username found")
}

if let age = userAge {
    print("Age:", age)
} else {
    print("Age not provided")
}

// Force unwrapping (use carefully)
let city: String? = "Pune"
print("City:", city!)

// Nil-coalescing operator
let country: String? = nil
let finalCountry = country ?? "India"
print("Country:", finalCountry)
