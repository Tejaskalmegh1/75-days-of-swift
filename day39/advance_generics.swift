// Day 38: Advance Generic function

import Foundation

// MARK: - Generic Function with where Clause

func areEqual<T>(_ a: T, _ b: T) -> Bool
where T: Equatable {
    return a == b
}

print(areEqual(10, 10))          // true
print(areEqual("Hi", "Hello"))   // false

// MARK: - Generic Stack Implementation

struct Stack<T> {
    private var items: [T] = []
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T? {
        return items.popLast()
    }
    
    func peek() -> T? {
        return items.last
    }
}

var intStack = Stack<Int>()
intStack.push(10)
intStack.push(20)
print(intStack.pop() ?? 0)   // 20

// MARK: - Generic Queue Implementation

struct Queue<T> {
    private var elements: [T] = []
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        if elements.isEmpty { return nil }
        return elements.removeFirst()
    }
    
    func peek() -> T? {
        return elements.first
    }
}

var stringQueue = Queue<String>()
stringQueue.enqueue("Tejas")
stringQueue.enqueue("iOS")
print(stringQueue.dequeue() ?? "")  // Tejas

// MARK: - Conditional Extension (where Element: Equatable)

extension Array where Element: Equatable {
    
    func containsDuplicates() -> Bool {
        for (index, element) in self.enumerated() {
            if self[(index + 1)...].contains(element) {
                return true
            }
        }
        return false
    }
}

let numbers = [1, 2, 3, 2]
print(numbers.containsDuplicates())   // true

// MARK: - Protocol with Associated Type

protocol Repository {
    associatedtype Model
    func fetch() -> [Model]
}

// MARK: - Concrete Repository Implementation

struct UserRepository: Repository {
    func fetch() -> [String] {
        return ["Tejas", "Ram", "Sham"]
    }
}

let userRepo = UserRepository()
print(userRepo.fetch())

// MARK: - Generic API Response Model

struct APIResponse<T: Decodable>: Decodable {
    let data: T
    let message: String
}

// MARK: - Type Erasure Basic Example

let value: Any = "Hello World"
print(value)

