// Day 61: SwiftUI State Management
// Topic: @State and @Binding

import SwiftUI

// Parent View

struct ParentView: View {
    
    @State private var count = 0
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("Count: \(count)")
                .font(.title)
            
            Button("Increment") {
                count += 1
            }
            
            ChildView(count: $count) 
        }
        .padding()
    }
}

// Child View

struct ChildView: View {
    
    @Binding var count: Int
    
    var body: some View {
        
        Button("Increment from Child") {
            count += 1
        }
    }
}

// Preview

#Preview {
    ParentView()
}