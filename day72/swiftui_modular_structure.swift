// Day 72: Modular Architecture
// Topic: Code Organization & Reusability

import SwiftUI

struct User: Codable, Identifiable {
    let id: Int
    let name: String
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

struct CustomButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct ContentView: View {
    
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                List(viewModel.users) { user in
                    Text(user.name)
                }
                
                CustomButton(title: "Reload Data") {
                    Task {
                        await viewModel.loadUsers()
                    }
                }
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