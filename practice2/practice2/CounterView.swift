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
    var viewModel: CounterViewModel = .init()
    
    var body: some View {
        VStack {
            Text("\(viewModel.count)")
            Button {
                viewModel.count += 1
            } label: {
                Text("카운트 증가 버튼")
            }
        }
        .padding()
    }
}

#Preview {
    CounterView()
}
