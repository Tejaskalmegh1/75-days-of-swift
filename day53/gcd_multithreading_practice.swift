// Day 53: Grand Central Dispatch 
// Topic: Multithreading in Swift

import Foundation

print("App started")

// Background task
DispatchQueue.global().async {
    
    print("Fetching data in background...")
    
    sleep(2) // Simulating network delay
    
    let result = "Data loaded"
    
    // Back to main thread
    DispatchQueue.main.async {
        print("Update UI with:", result)
    }
}

print("App continues running")