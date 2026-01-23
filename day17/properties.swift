// Day 17: Properties in Swift

struct Rectangle {
    // Stored properties
    var width: Double
    var height: Double

    // Computed property
    var area: Double {
        return width * height
    }

    var description: String {
        return "Width: \(width), Height: \(height)"
    }
}

var rect = Rectangle(width: 10, height: 5)

print(rect.description)
print("Area:", rect.area)

// Modify stored property
rect.width = 20
print("Updated Area:", rect.area)
