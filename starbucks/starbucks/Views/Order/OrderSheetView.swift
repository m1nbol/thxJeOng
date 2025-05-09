//
//  OrderSheetView.swift
//  starbucks
//
//  Created by BoMin Lee on 4/28/25.
//

import CoreLocation
import SwiftUI
import MapKit

struct OrderSheetView: View {
    @State private var isMapView = false
    @State private var searchText = ""
    @State private var selectedSegment: StoreSegment = .nearest

    @State private var storeListViewModel = StoreListViewModel()
    @State private var storeMapViewModel = StoreMapViewModel()
    @State private var addresses: [String] = []

    @Bindable private var locationManager = LocationManager.shared
    
    var body: some View {
        NavigationStack {
            VStack {
                topController
                    .padding(.horizontal, 32.5)
                if !isMapView {
                    storeList
                        .padding(.horizontal, 32.5)
                } else {
                    MapContainerView()
                }
            }
            .task {
                while locationManager.currentLocation == nil {
                    try? await Task.sleep(nanoseconds: 200_000_000) // 0.2초 기다리기
                }
                storeListViewModel.sortStoresByDistance()
            }
            .navigationTitle("매장 설정")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            isMapView.toggle()
                        }
                    } label: {
                        Image(systemName: isMapView ? "list.bullet" : "map")
                            .foregroundStyle(.gray04)

                    }
                }
            }
        }
    }

    private var topController: some View {
        VStack(spacing: 22) {
            searchBar
            storeSegmentBar
        }
    }

    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("검색", text: $searchText)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.vertical, 8)
                .font(.mainTextSemiBold14)
        }
        .padding(.horizontal, 16)
        .background(Color.gray08)
        .cornerRadius(10)
    }

    private var storeSegmentBar: some View {
        HStack(spacing: 10) {
            ForEach(StoreSegment.allCases) { segment in
                Button {
                    withAnimation(.easeInOut) {
                        selectedSegment = segment
                    }
                } label: {
                    HStack(spacing: 10) {
                        Text(segment.rawValue)
                            .font(.mainTextSemiBold14)
                            .foregroundColor(
                                selectedSegment == segment ? .gray06 : .gray03
                            )
                            .padding(.vertical, 13)
                        if segment == .nearest {
                            Rectangle()
                                .fill(Color.gray03)
                                .frame(width: 1, height: 12)
                        }
                    }
                }
            }
            Spacer()
        }
    }

    private var storeList: some View {
        VStack(spacing: 28) {
            Divider()
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(storeListViewModel.nearbyStores) { storeAndDistance in
                        StoreRow(store: storeAndDistance.store, distance: storeAndDistance.distance)
                    }
                }
                .padding(.top, 16)
            }
        }
    }
}

#Preview {
    OrderSheetView()
}
