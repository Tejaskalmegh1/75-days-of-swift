// Day 33: Closures & Memory Management

class ViewModel {
    let name = "Swift VM"

    func loadData(completion: @escaping () -> Void) {
        print("Loading data...")
        completion()
    }

    deinit {
        print("ViewModel deallocated")
    }
}

var viewModel: ViewModel? = ViewModel()

viewModel?.loadData { [weak viewModel] in
    guard let viewModel = viewModel else {
        print("ViewModel no longer exists")
        return
    }
    print("Data loaded for:", viewModel.name)
}

viewModel = nil
