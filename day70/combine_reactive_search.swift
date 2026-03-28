// Day 70: Combine Framework
// Topic: Reactive Programming Basics

import SwiftUI
import Combine

class SearchViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var results: [String] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    private let data = ["Tejas", "Alex", "John", "Emma", "Chris"]
    
    init() {
        setupSearch()
    }
    
    func setupSearch() {
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink { [weak self] query in
                self?.filter(query: query)
            }
            .store(in: &cancellables)
    }
    
    func filter(query: String) {
        if query.isEmpty {
            results = data
        } else {
            results = data.filter {
                $0.lowercased().contains(query.lowercased())
            }
        }
    }
}

struct ContentView: View {
    
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                TextField("Search...", text: $viewModel.searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                List(viewModel.results, id: \.self) { item in
                    Text(item)
                }
            }
            .navigationTitle("Combine Search")
        }
    }
}

#Preview {
    ContentView()
}