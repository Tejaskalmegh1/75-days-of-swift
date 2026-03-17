// Day 59: Advanced JSON Parsing
// Topic: Nested JSON, CodingKeys, Optional Handling

import Foundation

// Models

struct Address: Codable {
    let city: String
    let zip: String
}

struct User: Codable {
    let id: Int
    let userName: String
    let address: Address
    let phone: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case userName = "user_name"
        case address
        case phone
    }
}

// Sample JSON

let jsonString = """
{
  "id": 1,
  "user_name": "Tejas",
  "address": {
    "city": "Pune",
    "zip": "411001"
  },
  "phone": null
}
"""

// Decode JSON

let jsonData = Data(jsonString.utf8)

do {
    let user = try JSONDecoder().decode(User.self, from: jsonData)
    
    print("Name:", user.userName)
    print("City:", user.address.city)
    print("Phone:", user.phone ?? "No phone")
    
} catch {
    print("Decoding error:", error)
}