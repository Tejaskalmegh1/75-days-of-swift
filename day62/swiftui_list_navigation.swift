// Day 62: SwiftUI Lists & Navigation
// Topic: Building List UI with Navigation

import SwiftUI

// Model

struct Item: Identifiable {
    let id = UUID()
    let name: String
}

// Main View

struct ContentView: View {
    
    let items = [
        Item(name: "iPhone"),
        Item(name: "MacBook"),
        Item(name: "iPad")
    ]
    
    var body: some View {
        
        NavigationStack {
            
            List(items) { item in
                
                NavigationLink(destination: DetailView(item: item)) {
                    Text(item.name)
                }
            }
            .navigationTitle("Products")
        }
    }
}

// Detail View

struct DetailView: View {
    
    let item: Item
    
    var body: some View {
        Text("Selected: \(item.name)")
            .font(.title)
    }
}

// Preview

#Preview {
    ContentView()
}