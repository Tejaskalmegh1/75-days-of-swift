// Day 16: Classes in Swift

class User {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func describe() {
        print("Name:", name)
        print("Age:", age)
    }
}

let user1 = User(name: "Tejas", age: 25)
let user2 = user1   // Reference copy

user2.name = "Swift Developer"

user1.describe()
print("----")
user2.describe()
