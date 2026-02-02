// Day 27: Generics in Swift
// Generic function
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var x = 10
var y = 20
swapValues(&x, &y)
print("x:", x, "y:", y)

var first = "Hello"
var second = "Swift"
swapValues(&first, &second)
print("first:", first, "second:", second)

// Generic type
struct Stack<T> {
    var items: [T] = []

    mutating func push(_ item: T) {
        items.append(item)
    }

    mutating func pop() -> T {
        return items.removeLast()
    }
}

var numberStack = Stack<Int>()
numberStack.push(1)
numberStack.push(2)
print(numberStack.pop())

var stringStack = Stack<String>()
stringStack.push("A")
stringStack.push("B")
print(stringStack.pop())