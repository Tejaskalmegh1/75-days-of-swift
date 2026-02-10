// Day 34: Value Types vs Reference Types

// Struct example (Value Type)
struct CounterStruct {
    var count: Int
}

// Class example (Reference Type)
class CounterClass {
    var count: Int
    init(count: Int) {
        self.count = count
    }
}

// Struct behavior
var structA = CounterStruct(count: 0)
var structB = structA
structB.count = 10

print("Struct A:", structA.count) // 0
print("Struct B:", structB.count) // 10

// Class behavior
var classA = CounterClass(count: 0)
var classB = classA
classB.count = 10

print("Class A:", classA.count) // 10
print("Class B:", classB.count) // 10
