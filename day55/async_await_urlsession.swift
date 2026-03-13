// Day 55: Networking with async
// Topic: Modern Swift Concurrency with URLSession

import Foundation

// Model

struct User: Codable {
    let id: Int
    let name: String
    let email: String
}

// API Service

func fetchUsers() async throws -> [User] {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
    
    let (data, _) = try await URLSession.shared.data(from: url)
    
    let users = try JSONDecoder().decode([User].self, from: data)
    
    return users
}

// Execute Async Task

Task {
    do {
        let users = try await fetchUsers()
        
        for user in users {
            print("Name:", user.name)
            print("Email:", user.email)
            print("------")
        }
        
    } catch {
        print("Error:", error)
    }
}

RunLoop.main.run()