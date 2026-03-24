// Day 66: Search + Debouncing in SwiftUI
// Topic: Efficient Search Implementation

import SwiftUI

// Model

struct User: Identifiable {
    let id = UUID()
    let name: String
}

// ViewModel

class UserViewModel: ObservableObject {
    
    @Published var users: [User] = [
        User(name: "Tejas"),
        User(name: "Alex"),
        User(name: "John"),
        User(name: "Emma"),
        User(name: "Chris")
    ]
    
    @Published var searchText: String = ""
    @Published var filteredUsers: [User] = []
    
    private var workItem: DispatchWorkItem?
    
    init() {
        filteredUsers = users
    }
    
    func search() {
        workItem?.cancel()
        
        let task = DispatchWorkItem { [weak self] in
            guard let self = self else { return }
            
            if self.searchText.isEmpty {
                self.filteredUsers = self.users
            } else {
                self.filteredUsers = self.users.filter {
                    $0.name.lowercased().contains(self.searchText.lowercased())
                }
            }
        }
        
        workItem = task
        
        // Debounce delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: task)
    }
}