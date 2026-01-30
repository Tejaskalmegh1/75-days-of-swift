// Day 24: Error Handling in Swift

enum LoginError: Error {
    case invalidUsername
    case invalidPassword
}

func login(username: String, password: String) throws {
    if username.isEmpty {
        throw LoginError.invalidUsername
    }

    if password.count < 6 {
        throw LoginError.invalidPassword
    }

    print("Login successful")
}

do {
    try login(username: "Tejas", password: "123456")
} catch LoginError.invalidUsername {
    print("Username is invalid")
} catch LoginError.invalidPassword {
    print("Password is too short")
} catch {
    print("Unknown error occurred")
}