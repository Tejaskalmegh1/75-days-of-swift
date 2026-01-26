// Day 20: Optionals in Swift

var username: String? = "Tejas"
var age: Int? = nil

// Optional binding
if let validUsername = username {
    print("Username:", validUsername)
} else {
    print("No username found")
}

// Nil-coalescing operator
let userAge = age ?? 25
print("User age:", userAge)

// Force unwrapping (dangerous if nil)
if username != nil {
    print("Force unwrapped username:", username!)
}
