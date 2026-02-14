// Day 38: Generic Functions

import Foundation

// MARK: -  Generic Function

func swapValues<T>(a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}

var x = 10
var y = 20
swapValues(a: &x, b: &y)
print("Swapped Ints:", x, y)

var str1 = "Hello"
var str2 = "World"
swapValues(a: &str1, b: &str2)
print("Swapped Strings:", str1, str2)


// MARK: - Generic Struct

struct Box<T> {
    var value: T
}

let intBox = Box(value: 100)
let stringBox = Box(value: "Tejas")

print("Int Box:", intBox.value)
print("String Box:", stringBox.value)


// MARK: -  Generic Constraint

func printIfEqual<T: Equatable>(_ a: T, _ b: T) {
    if a == b {
        print("Equal")
    } else {
        print("Not Equal")
    }
}

printIfEqual(10, 10)
printIfEqual("Swift", "iOS")


// MARK: -  Generic Model (Real iOS Example)

struct APIResponse<T: Decodable>: Decodable {
    let data: T
    let message: String
}

struct User: Decodable {
    let name: String
    let age: Int
}


// MARK: -  Generic Stack (Practice)

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

// Test Stack with Int
var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
intStack.push(3)

print("Popped from Int Stack:", intStack.pop() ?? "nil")

// Test Stack with String
var stringStack = Stack<String>()
stringStack.push("Apple")
stringStack.push("Banana")

print("Peek String Stack:", stringStack.peek() ?? "nil")
