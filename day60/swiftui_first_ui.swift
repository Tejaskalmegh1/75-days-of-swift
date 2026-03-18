// Day 60: SwiftUI Basics
// Topic: Building First UI using SwiftUI

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("Welcome to SwiftUI")
                .font(.title)
                .fontWeight(.bold)
            
            Image(systemName: "star.fill")
                .font(.largeTitle)
            
            Text("Learning iOS Development")
                .foregroundColor(.gray)
            
            Button("Tap Me") {
                print("Button tapped")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}