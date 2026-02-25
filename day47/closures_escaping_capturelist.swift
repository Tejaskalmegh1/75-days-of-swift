// Day 47: Closures Deep Dive
// Topic: Escaping, Capture Lists, Autoclosure

import Foundation

// MARK: - Escaping Closure Example

func performTask(completion: @escaping () -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
        completion()
    }
}

// MARK: - Retain Cycle Safe Example

class Worker {
    var name = "Tejas"
    
    func startWork() {
        performTask { [weak self] in
            guard let self = self else { return }
            print("Work done by:", self.name)
        }
    }
    
    deinit {
        print("Worker deallocated")
    }
}

// MARK: - Autoclosure Example

func printIfTrue(_ condition: @autoclosure () -> Bool) {
    if condition() {
        print("Condition is true")
    }
}

// MARK: - Test

var worker: Worker? = Worker()
worker?.startWork()

printIfTrue(5 > 3)

worker = nil