// Day 14: Enums in Swift

enum Direction {
    case north
    case south
    case east
    case west
}

let move = Direction.north

switch move {
case .north:
    print("Moving North")
case .south:
    print("Moving South")
case .east:
    print("Moving East")
case .west:
    print("Moving West")
}

// Enum with raw values
enum Status: String {
    case success = "Success"
    case failure = "Failure"
    case pending = "Pending"
}

let currentStatus = Status.success
print("Status:", currentStatus.rawValue)
