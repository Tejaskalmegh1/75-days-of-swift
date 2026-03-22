// Day 64: Loading & Error Handling in SwiftUI
// Topic: Professional UI State Management

import SwiftUI

// Model

struct User: Codable, Identifiable {
    let id: Int
    let name: String
}

// View State

enum ViewState {
    case idle
    case loading
    case success
    case error(String)
}

// ViewModel

class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    @Published var state: ViewState = .idle
    
    func fetchUsers() async {
        state = .loading
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([User].self, from: data)
            
            DispatchQueue.main.async {
                self.users = decoded
                self.state = decoded.isEmpty ? .error("No Data Found") : .success
            }
            
        } catch {
            DispatchQueue.main.async {
                self.state = .error("Something went wrong")
            }
        }
    }
}

// View

struct ContentView: View {
    
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            Group {
                switch viewModel.state {
                    
                case .idle:
                    Text("Start Loading...")
                    
                case .loading:
                    ProgressView("Loading...")
                    
                case .success:
                    List(viewModel.users) { user in
                        Text(user.name)
                    }
                    
                case .error(let message):
                    Text(message)
                        .foregroundColor(.red)
                }
            }
            .navigationTitle("Users")
        }
        .task {
            await viewModel.fetchUsers()
        }
    }
}

#Preview {
    ContentView()
}