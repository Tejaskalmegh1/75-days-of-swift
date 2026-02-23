// Day 45: GCD vs Structured Concurrency
// Topic: Modern Swift Concurrency Comparison

import Foundation

// MARK: - GCD Example

func gcdExample() {
    DispatchQueue.global().async {
        print("GCD: Running on background thread")
        
        DispatchQueue.main.async {
            print("GCD: Back to main thread")
        }
    }
}

// MARK: - Async/Await Example

func asyncExample() async {
    print("Async/Await: Running async task")
    
    await MainActor.run {
        print("Async/Await: Back to main thread safely")
    }
}

// MARK: - Run Both

gcdExample()

Task {
    await asyncExample()
}