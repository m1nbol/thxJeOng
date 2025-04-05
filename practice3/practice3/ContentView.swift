//
//  ContentView.swift
//  practice3
//
//  Created by BoMin Lee on 4/5/25.
//

import SwiftUI

struct ContentView: View {
//    let fruits = ["🍎 Apple", "🍌 Banana", "🍊 Orange", "🍇 Grape", "🍓 Strawberry"]
//    let fruits = [
//        Fruit(name: "Apple", emoji: "🍎"),
//        Fruit(name: "Banana", emoji: "🍌"),
//        Fruit(name: "Orange", emoji: "🍊"),
//        Fruit(name: "Grape", emoji: "🍇"),
//        Fruit(name: "Strawberry", emoji: "🍓")
//    ]
    
//    let rows = Array(repeating: GridItem(.fixed(80)), count: 2)
    
//    @State private var scrollToIndex: Int = 0

//    @State private var scrollOffset: CGFloat = 0
    
//    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
//    let columns = Array(repeating: GridItem(.fixed(80)), count: 3)
    
    let rows = Array(repeating: GridItem(.fixed(80)), count: 2)
    
    var body: some View {
//        VStack {
//            ForEach(1..<6) { index in
//                Text("항목 \(index)")
//                    .font(.headline)
//            }
//        }
//
//        List {
//            ForEach(fruits, id: \.self) { fruit in
//                Text(fruit)
//                    .font(.title2)
//            }
//        }
        
//        List {
//            ForEach(fruits) { fruit in
//                HStack {
//                    Text(fruit.emoji)
//                    Text(fruit.name)
//                }
//            }
//        }
        
//        ScrollView {
//            VStack(spacing: 20) {
//                ForEach(1...50, id: \.self) { index in
//                    Text("Item \(index)")
//                        .frame(maxWidth: .infinity)
//                        .background(Color.pink.opacity(0.3))
//                }
//            }
//        }
//        .scrollIndicators(.visible, axes: .vertical)
//        .safeAreaPadding(.horizontal)
//        .contentMargins(.horizontal, 100, for: .scrollIndicators)
//        .contentMargins(.horizontal, 0, for: .scrollIndicators)
        
//        VStack {
//            ScrollViewReader { proxy in
//                ScrollView {
//                    LazyVStack {
//                        ForEach(0..<50, id: \.self) { index in
//                            Text("Item \(index)")
//                                .frame(maxWidth: .infinity)
//                                .background(Color.blue.opacity(0.3))
//                                .id(index) // 각 항목에 ID 부여
//                                .padding()
//                        }
//                    }
//                }
//                .onChange(of: scrollToIndex) { oldIndex, newIndex in
//                    withAnimation {
//                        proxy.scrollTo(newIndex, anchor: .top) // 지정된 index로 스크롤 이동
//                    }
//                }
//            }
//            
//            HStack {
//                Button("Top") { scrollToIndex = 0 }
//                Button("Middle") { scrollToIndex = 25 }
//                Button("Bottom") { scrollToIndex = 49 }
//            }
//        }
        
//        ScrollViewReader { proxy in
//            ScrollView {
//                LazyVStack {
//                    ForEach(1...50, id: \.self) { index in
//                        Text("Item \(index)")
//                            .font(.title)
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.blue.opacity(0.2))
//                            .padding(.horizontal)
//                            .id(index) // 각 아이템에 ID를 부여해야 scrollTo가 동작!!
//                    }
//                }
//            }
//            .onAppear {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                    withAnimation {
//                        proxy.scrollTo(30, anchor: .center) // 25번 아이템으로 이동!!
//                    }
//                }
//            }
//        }
        
//        VStack {
//            Text("Offset: \(Int(scrollOffset))")
//                .font(.headline)
//            
//            ScrollView {
//                LazyVStack {
//                    ForEach(0..<50, id: \.self) { index in
//                        Text("Item \(index)")
//                            .frame(maxWidth: .infinity)
//                            .background(Color.green.opacity(0.3))
//                    }
//                }
//                .background(
//                    GeometryReader { proxy in
//                        Color.clear
//                            .onAppear {
//                                scrollOffset = proxy.frame(in: .global).minY
//                            }
//                            .onChange(of: proxy.frame(in: .global).minY) { oldValue, newValue in
//                                scrollOffset = newValue
//                            }
//                    }
//                )
//            }
//        }
        
        
//        ScrollView {
//            LazyVGrid(columns: columns, spacing: 10) {
//                ForEach(1...20, id: \.self) { index in
//                    Text("Item \(index)")
//                        .frame(height: 80)
//                        .frame(maxWidth: .infinity)
//                        .background(Color.blue.opacity(0.7))
//                }
//            }
//        }
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 10) {
                ForEach(1...15, id: \.self) { index in
                    Text("Item \(index)")
                        .frame(width: 80)
                        .frame(maxHeight: .infinity)
                        .background(Color.green.opacity(0.7))
                }
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
