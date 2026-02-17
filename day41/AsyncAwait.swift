// Day 41: Async/Await & Structured Concurrency
// Topic: Modern Networking using async/await

import Foundation

// MARK: - API Error

enum APIError: Error {
    case invalidURL
    case decodingFailed
    case serverError
}

// MARK: - Models

struct APIResponse<T: Decodable>: Decodable {
    let data: T
}

struct User: Decodable {
    let name: String
    let age: Int
}

// MARK: - Async Network Manager

class NetworkManager {
    
    func request<T: Decodable>(urlString: String) async throws -> T {        
        guard URL(string: urlString) != nil else {
            throw APIError.invalidURL
        }
        
        // Simulated JSON Response
        let jsonString = """
        {
            "data": {
                "name": "Tejas",
                "age": 25
            }
        }
        """
        
        guard let jsonData = jsonString.data(using: .utf8) else {
            throw APIError.serverError
        }
        
        do {
            let decoded = try JSONDecoder().decode(T.self, from: jsonData)
            return decoded
        } catch {
            throw APIError.decodingFailed
        }
    }
}

// MARK: - Usage

let manager = NetworkManager()

Task {
    do {
        let response: APIResponse<User> =
            try await manager.request(urlString: "https://api.example.com/user")
        
        print("Success...")
        print("Name:", response.data.name)
        print("Age:", response.data.age)
        
    } catch {
        print("❌ Error:", error)
    }
}
