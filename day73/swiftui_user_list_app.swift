// Day 73: Mini Project - User List App
// Topic: API + MVVM + Search + State

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
    @Published var filteredUsers: [User] = []
    @Published var searchText: String = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let service = APIService()
    
    func loadUsers() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let data = try await service.fetchUsers()
            
            DispatchQueue.main.async {
                self.users = data
                self.filteredUsers = data
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "Failed to load users"
                self.isLoading = false
            }
        }
    }
    
    func filterUsers() {
        if searchText.isEmpty {
            filteredUsers = users
        } else {
            filteredUsers = users.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

struct ContentView: View {
    
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                TextField("Search users...", text: $viewModel.searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .onChange(of: viewModel.searchText) { _ in
                        viewModel.filterUsers()
                    }
                
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.errorMessage {
                    Text(error).foregroundColor(.red)
                } else {
                    List(viewModel.filteredUsers) { user in
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.email)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
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