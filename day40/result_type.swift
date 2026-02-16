// Day 40: Result Type & Modern Error Handling in Swift

import Foundation

// MARK: - API Error Definition

enum APIError: Error, CustomStringConvertible {
    case invalidURL
    case decodingFailed
    case serverError
    case emptyData
    
    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .decodingFailed:
            return "Decoding Failed"
        case .serverError:
            return "Server Error"
        case .emptyData:
            return "Empty Data"
        }
    }
}

// MARK: - Generic API Response

struct APIResponse<T: Decodable>: Decodable {
    let data: T
}

// MARK: - Sample Model

struct User: Decodable {
    let name: String
    let age: Int
}

// MARK: - Network Manager

class NetworkManager {
    
    func request<T: Decodable>(
        urlString: String,
        completion: @escaping (Result<T, APIError>) -> Void
    ) {
        guard URL(string: urlString) != nil else {
            completion(.failure(.invalidURL))
            return
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
            completion(.failure(.emptyData))
            return
        }
        
        do {
            let decodedObject = try JSONDecoder().decode(T.self, from: jsonData)
            completion(.success(decodedObject))
        } catch {
            completion(.failure(.decodingFailed))
        }
    }
}

// MARK: - Usage

let networkManager = NetworkManager()

networkManager.request(
    urlString: "https://api.example.com/user"
) { (result: Result<APIResponse<User>, APIError>) in
    
    switch result {
    case .success(let response):
        print("Success...")
        print("Name:", response.data.name)
        print("Age:", response.data.age)
        
    case .failure(let error):
        print("Error...:", error.description)
    }
}
