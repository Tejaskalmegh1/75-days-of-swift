// Day 54: Networking in Swift
// Topic: Fetching API Data using URLSession

import Foundation

// Model

struct User: Codable {
    let id: Int
    let name: String
    let email: String
}

// API URL

let urlString = "https://jsonplaceholder.typicode.com/users"

guard let url = URL(string: urlString) else {
    fatalError("Invalid URL")
}

// Network Request

let task = URLSession.shared.dataTask(with: url) { data, response, error in
    
    if let error = error {
        print("Error:", error)
        return
    }
    
    guard let data = data else {
        print("No data received")
        return
    }
    
    do {
        let users = try JSONDecoder().decode([User].self, from: data)
        
        for user in users {
            print("Name:", user.name)
            print("Email:", user.email)
            print("----")
        }
        
    } catch {
        print("Decoding error:", error)
    }
}

task.resume()

// Keep program running for async task
RunLoop.main.run()