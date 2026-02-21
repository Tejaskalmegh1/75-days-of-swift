// Day 43: Actors in Swift
// Topic: Data Race Protection & Thread Safety

import Foundation

// MARK: - Actor Example
actor BankAccount {
    
    private var balance: Int = 0
    
    func deposit(amount: Int) {
        balance += amount
    }
    
    func withdraw(amount: Int) {
        balance -= amount
    }
    
    func getBalance() -> Int {
        balance
    }
}

// MARK: - Testing Actor
let account = BankAccount()

Task {
    await account.deposit(amount: 1000)
}

Task {
    await account.withdraw(amount: 200)
}

Task {
    let finalBalance = await account.getBalance()
    print("Final Balance:", finalBalance)
}