// Day 71: MVVM Architecture in SwiftUI
// Topic: Clean Project Structure

import SwiftUI

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
}

class APIService {
    
    func fetchUsers() async throws -> [User] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([User].self, from: data)
    }
}

class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    private let service = APIService()
    
    func loadUsers() async {
        do {
            users = try await service.fetchUsers()
        } catch {
            print("Error:", error)
        }
    }
}

struct ContentView: View {
    
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            List(viewModel.users) { user in
                Text(user.name)
            }
            .navigationTitle("Users")
        }
        .task {
            await viewModel.loadUsers()
        }
    }
}

#Preview {
    ContentView()
}