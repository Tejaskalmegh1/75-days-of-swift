// Day 74: Final Mini Project (User Directory App)
// Topic: MVVM + API + Search + UI States + Clean UI

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

struct LoadingView: View {
    var body: some View {
        ProgressView("Loading...")
            .padding()
    }
}

struct ErrorView: View {
    let message: String
    let retry: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            Text(message)
                .foregroundColor(.red)
            
            Button("Retry", action: retry)
        }
        .padding()
    }
}

struct EmptyViewUI: View {
    var body: some View {
        Text("No users found")
            .foregroundColor(.gray)
            .padding()
    }
}

struct UserRowView: View {
    
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(user.name)
                .font(.headline)
            
            Text(user.email)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
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
                    LoadingView()
                    
                } else if let error = viewModel.errorMessage {
                    ErrorView(message: error) {
                        Task {
                            await viewModel.loadUsers()
                        }
                    }
                    
                } else if viewModel.filteredUsers.isEmpty {
                    EmptyViewUI()
                    
                } else {
                    List(viewModel.filteredUsers) { user in
                        UserRowView(user: user)
                            .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    .refreshable {
                        await viewModel.loadUsers()
                    }
                }
            }
            .navigationTitle("User Directory")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            await viewModel.loadUsers()
        }
    }
}

#Preview {
    ContentView()
}