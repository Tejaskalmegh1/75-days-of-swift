// Day 15: Structs in Swift

struct User {
    var name: String
    var age: Int
    var isDeveloper: Bool

    func describe() {
        print("Name:", name)
        print("Age:", age)
        print("Developer:", isDeveloper)
    }
}

// Create instance
let user1 = User(name: "Tejas", age: 25, isDeveloper: true)
user1.describe()

// Value type behavior
var user2 = user1
user2.name = "Swift Learner"

print("User1 Name:", user1.name)
print("User2 Name:", user2.name)
