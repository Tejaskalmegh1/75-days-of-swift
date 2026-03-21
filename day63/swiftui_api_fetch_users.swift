// Day 63: SwiftUI + API Integration
// Topic: Displaying API Data in SwiftUI

import SwiftUI

// Model

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
}

// ViewModel

class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    func fetchUsers() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedUsers = try JSONDecoder().decode([User].self, from: data)
            
            DispatchQueue.main.async {
                self.users = decodedUsers
            }
            
        } catch {
            print("Error:", error)
        }
    }
}

// View

struct ContentView: View {
    
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            List(viewModel.users) { user in
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.headline)
                    
                    Text(user.email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
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