// Day 57: Dependency Injection in Swift
// Topic: Decoupling Components using Protocols

import Foundation

// Model

struct User {
    let id: Int
    let name: String
}

// Repository Protocol

protocol UserRepository {
    func fetchUsers() -> [User]
}

// Real Repository

class UserRepositoryImpl: UserRepository {
    
    func fetchUsers() -> [User] {
        return [
            User(id: 1, name: "Tejas"),
            User(id: 2, name: "Alex")
        ]
    }
}

// Mock Repository (For Testing)

class MockUserRepository: UserRepository {
    
    func fetchUsers() -> [User] {
        return [
            User(id: 99, name: "Mock User")
        ]
    }
}

// ViewModel with Dependency Injection

class UserViewModel {
    
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func loadUsers() {
        let users = repository.fetchUsers()
        
        for user in users {
            print("User:", user.name)
        }
    }
}

// App Entry

let repository = UserRepositoryImpl()
let viewModel = UserViewModel(repository: repository)

viewModel.loadUsers()