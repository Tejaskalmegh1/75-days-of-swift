// Day 13: Tuples in Swift

// Simple tuple
let person = ("Tejas", 21)
print("Name:", person.0)
print("Age:", person.1)

// Named tuple
let user = (name: "Tejas", age: 21, isDeveloper: true)
print("Name:", user.name)
print("Age:", user.age)
print("Developer:", user.isDeveloper)

// Tuple decomposition
let (username, userAge, _) = user
print("Username:", username)
print("User age:", userAge)

// Function returning tuple
func getUserInfo() -> (String, Int) {
    return ("Swift Learner", 75)
}

let info = getUserInfo()
print("Title:", info.0)
print("Days:", info.1)
