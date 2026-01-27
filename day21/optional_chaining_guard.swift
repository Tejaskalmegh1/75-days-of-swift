// Day 21: Optional Chaining & Guard

struct Profile {
    var bio: String
}

struct User {
    var name: String
    var profile: Profile?
}

let user = User(name: "Tejas", profile: Profile(bio: "iOS Developer"))

// Optional chaining
if let bio = user.profile?.bio {
    print("Bio:", bio)
} else {
    print("No bio available")
}

// guard let example
func printUserName(_ name: String?) {
    guard let validName = name else {
        print("Name is missing")
        return
    }
    print("User name:", validName)
}

printUserName(user.name)
printUserName(nil)
