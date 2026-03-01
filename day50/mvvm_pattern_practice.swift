// Day 50: MVVM Architecture in Swift
// Topic: Clean Separation of Model, ViewModel, and View

import Foundation

// MARK: - Model

struct User {
    let name: String
    let age: Int
}

// MARK: - Service

protocol UserServiceProtocol {
    func fetchUser() -> User
}

class UserService: UserServiceProtocol {
    func fetchUser() -> User {
        return User(name: "Tejas", age: 25)
    }
}

// MARK: - ViewModel

class UserViewModel {
    
    private let service: UserServiceProtocol
    private var user: User?
    
    init(service: UserServiceProtocol) {
        self.service = service
    }
    
    func loadUser() {
        user = service.fetchUser()
    }
    
    var userNameText: String {
        return "Name: \(user?.name ?? "N/A")"
    }
    
    var userAgeText: String {
        return "Age: \(user?.age ?? 0)"
    }
}

// MARK: - View (Simulation)

class UserView {
    
    private let viewModel: UserViewModel
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
    func render() {
        viewModel.loadUser()
        print(viewModel.userNameText)
        print(viewModel.userAgeText)
    }
}

// MARK: - App Entry

let service = UserService()
let viewModel = UserViewModel(service: service)
let view = UserView(viewModel: viewModel)

view.render()