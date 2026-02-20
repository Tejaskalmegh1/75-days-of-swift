// Day 42: MainActor & Task Groups
// Topic: Parallel API Calls with Structured Concurrency

import Foundation

// MARK: - Mock APIs

func fetchUser() async -> String {
    try? await Task.sleep(nanoseconds: 1_000_000_000)
    return "Tejas"
}

func fetchPosts() async -> [String] {
    try? await Task.sleep(nanoseconds: 1_000_000_000)
    return ["Post 1", "Post 2", "Post 3"]
}

// MARK: - Parallel Execution using Task Group

func loadDashboard() async {
    
    await withTaskGroup(of: Void.self) { group in
        
        group.addTask {
            let user = await fetchUser()
            print("User:", user)
        }
        
        group.addTask {
            let posts = await fetchPosts()
            print("Posts:", posts)
        }
    }
    
    print("Dashboard Loaded...")
}

// MARK: - MainActor Example

@MainActor
func updateUI(message: String) {
    print("UI Updated:", message)
}

// MARK: - Run

Task {
    await loadDashboard()
    await updateUI(message: "All data loaded safely on main thread")
}