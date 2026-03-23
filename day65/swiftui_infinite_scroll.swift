// Day 65: Pagination in SwiftUI
// Topic: Infinite Scroll Implementation

import SwiftUI

// Model

struct User: Codable, Identifiable {
    let id: Int
    let name: String
}

// ViewModel

class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    @Published var isLoading = false
    
    private var page = 1
    private let limit = 5
    
    func fetchUsers() async {
        guard !isLoading else { return }
        
        isLoading = true
        
        let urlString = "https://jsonplaceholder.typicode.com/users?_page=\(page)&_limit=\(limit)"
        
        guard let url = URL(string: urlString) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let newUsers = try JSONDecoder().decode([User].self, from: data)
            
            DispatchQueue.main.async {
                self.users.append(contentsOf: newUsers)
                self.page += 1
                self.isLoading = false
            }
            
        } catch {
            DispatchQueue.main.async {
                self.isLoading = false
                print("Error:", error)
            }
        }
    }
}