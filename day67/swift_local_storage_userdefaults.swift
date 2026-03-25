// Day 67: Local Data Persistence
// Topic: UserDefaults in Swift

import Foundation

struct User: Codable {
    let name: String
    let age: Int
}

// Save Function

func saveUser(_ user: User) {
    do {
        let data = try JSONEncoder().encode(user)
        UserDefaults.standard.set(data, forKey: "saved_user")
        print("User saved")
    } catch {
        print("Save error:", error)
    }
}

// Load Function

func loadUser() {
    guard let data = UserDefaults.standard.data(forKey: "saved_user") else {
        print("No user found")
        return
    }
    
    do {
        let user = try JSONDecoder().decode(User.self, from: data)
        print("Loaded User:", user.name, user.age)
    } catch {
        print("Load error:", error)
    }
}

let user = User(name: "Tejas", age: 25)

saveUser(user)
loadUser()