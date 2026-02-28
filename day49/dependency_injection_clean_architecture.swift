// Day 49: Dependency Injection & Clean Architecture Basics
// Topic: Loose Coupling using Protocols

import Foundation

// MARK: - Network Protocol

protocol NetworkServiceProtocol {
    func fetchUser() -> String
}

// MARK: - Real Network Service

class NetworkService: NetworkServiceProtocol {
    func fetchUser() -> String {
        return "User from API"
    }
}

// MARK: - Mock Service (For Testing)

class MockNetworkService: NetworkServiceProtocol {
    func fetchUser() -> String {
        return "Mock User"
    }
}

// MARK: - ViewModel using Dependency Injection

class UserViewModel {
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getUser() {
        let user = networkService.fetchUser()
        print("Fetched:", user)
    }
}

// MARK: - Usage

let realViewModel = UserViewModel(networkService: NetworkService())
realViewModel.getUser()

let mockViewModel = UserViewModel(networkService: MockNetworkService())
mockViewModel.getUser()