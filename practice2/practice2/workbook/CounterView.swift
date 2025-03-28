//
//  CounterView.swift
//  practice2
//
//  Created by BoMin LEE on 3/28/25.
//

import SwiftUI

struct CounterView: View {
    // @ObservedObject var viewModel: CounterViewModel = .init()
    // @StateObject var viewModel: CounterViewModel = .init()
    // var viewModel: CounterViewModel = .init()
    private var counter = Counter()
    
    var body: some View {
        VStack {
            Text("Count: \(counter.count)")
            Button("Increment") {
                counter.count += 1
            }
            ChildView(counter: counter)
        }
    }
}

struct ChildView: View {
    @Bindable var counter: Counter
    
    var body: some View {
        Button("Child Increment") {
            counter.count += 1
        }
    }
}

#Preview {
    CounterView()
}
