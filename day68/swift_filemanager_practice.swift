// Day 68: FileManager in Swift
// Topic: Advanced Local Storage using Files

import Foundation

// Model

struct User: Codable {
    let name: String
    let age: Int
}

// FileManager Helper

class FileManagerHelper {
    
    static let fileName = "user.json"
    
    static var fileURL: URL {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentDirectory.appendingPathComponent(fileName)
    }
    
    // Save
    static func save(user: User) {
        do {
            let data = try JSONEncoder().encode(user)
            try data.write(to: fileURL)
            print("File saved at:", fileURL)
        } catch {
            print("Save error:", error)
        }
    }
    
    // Load
    static func load() -> User? {
        do {
            let data = try Data(contentsOf: fileURL)
            let user = try JSONDecoder().decode(User.self, from: data)
            return user
        } catch {
            print("Load error:", error)
            return nil
        }
    }
    
    // Delete
    static func delete() {
        do {
            try FileManager.default.removeItem(at: fileURL)
            print("File deleted")
        } catch {
            print("Delete error:", error)
        }
    }
}

// Test

let user = User(name: "Tejas", age: 22)

// Save
FileManagerHelper.save(user: user)

// Load
if let loadedUser = FileManagerHelper.load() {
    print("Loaded:", loadedUser.name, loadedUser.age)
}

// Delete
FileManagerHelper.delete()