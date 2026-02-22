// Day 44: Sendable & Concurrency Safety
// Topic: Safe Data Transfer Between Tasks

import Foundation

// MARK: - Sendable Struct
struct User: Sendable {
    let name: String
    let age: Int
}

// MARK: - Unsafe Class Example
class UnsafeCounter {
    var value = 0
}

// MARK: - Safe Final Class
final class SafeConfig: Sendable {
    let baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
}

// MARK: - Using Sendable in Task
func printUser(_ user: User) async {
    print("User:", user.name, user.age)
}

let user = User(name: "Tejas", age: 25)

Task {
    await printUser(user)
}
