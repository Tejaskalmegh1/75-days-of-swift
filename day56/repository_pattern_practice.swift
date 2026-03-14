// Day 56: Repository Pattern in Swift
// Topic: Clean Architecture for Data Layer

import Foundation

// Model

struct User: Codable {
    let id: Int
    let name: String
    let email: String
}

// Repository Protocol

protocol UserRepository {
    func fetchUsers() async throws -> [User]
}

// Repository Implementation

class UserRepositoryImpl: UserRepository {
    
    func fetchUsers() async throws -> [User] {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode([User].self, from: data)
    }
}

// ViewModel

class UserViewModel {
    
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func loadUsers() async {
        do {
            let users = try await repository.fetchUsers()
            
            for user in users {
                print("Name:", user.name)
                print("Email:", user.email)
                print("-----")
            }
            
        } catch {
            print("Error:", error)
        }
    }
}

// App Entry

let repository = UserRepositoryImpl()
let viewModel = UserViewModel(repository: repository)

Task {
    await viewModel.loadUsers()
}

RunLoop.main.run()