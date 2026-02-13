// Day 37: Property Wrappers in Swift

import Foundation

@propertyWrapper
struct Capitalized {
    private var value: String
    
    init(wrappedValue: String) {
        self.value = wrappedValue.capitalized
    }
    
    var wrappedValue: String {
        get { value }
        set { value = newValue.capitalized }
    }
}
struct User {
    @Capitalized var name: String
}

var user = User(name: "tejas kalmegh")
print(user.name)   
