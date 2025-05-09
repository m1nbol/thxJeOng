//
//  MapContainerView.swift
//  starbucks
//
//  Created by BoMin Lee on 4/29/25.
//

import SwiftUI
import MapKit

struct MapContainerView: View {
    @State private var cameraCenter: CLLocationCoordinate2D? = nil
    @State private var stores: [StoreAndDistance] = []
    @State private var userDragged = false
    @State private var shouldMove = false
    
    var showFocusButton: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            MapView(cameraCenter: $cameraCenter, stores: $stores, userDragged: $userDragged, shouldMoveToCurrentLocation: $shouldMove)
                .ignoresSafeArea()

            VStack {
                if let center = cameraCenter, userDragged {
                    Button {
                        print("여기서 다시 검색 - 중심 좌표: \(center.latitude), \(center.longitude)")
                        searchNearbyStores(from: center)
                        userDragged = false
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.white)
                                .frame(width: 88, height: 36)
                            Text("이 지역 검색")
                                .font(.mainTextMedium12)
                                .foregroundStyle(.gray06)
                                .padding(.vertical, 7)
                                .padding(.horizontal, 16)
                        }
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                    }
                }
                Spacer()
                HStack {
                    Spacer()
                    if showFocusButton {
                        Button(action: {
                            shouldMove = true
                            print(shouldMove)
                        }) {
                            Image(systemName: "dot.scope")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        }
                    }
                }
                .padding(.trailing, 27)
                .padding(.bottom, 40)
            }
            .padding(.top, 22)
        }
        .onAppear {
            if let current = LocationManager.shared.currentLocation?.coordinate {
                searchNearbyStores(from: current)
            }
        }
    }
    
    private func searchNearbyStores(from center: CLLocationCoordinate2D) {
        let allStores = StoreDataLoader.loadStores()
        let centerLocation = CLLocation(latitude: center.latitude, longitude: center.longitude)
        
        let filtered = allStores
            .map { feature -> StoreAndDistance in
                let storeLocation = CLLocation(latitude: feature.properties.ycoordinate, longitude: feature.properties.xcoordinate)
                let distance = centerLocation.distance(from: storeLocation) / 1000
                return StoreAndDistance(store: feature.properties, distance: distance)
            }
            .filter { $0.distance <= 10 }
            .sorted { $0.distance < $1.distance }
        
        self.stores = filtered
    }
}
