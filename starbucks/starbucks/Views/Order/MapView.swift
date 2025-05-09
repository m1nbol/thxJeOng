//
//  MapView.swift
//  starbucks
//
//  Created by BoMin Lee on 4/29/25.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @Binding var cameraCenter: CLLocationCoordinate2D?
    @Binding var stores: [StoreAndDistance]
    @Binding var userDragged: Bool
    @Binding var shouldMoveToCurrentLocation: Bool

    private let mapView = MKMapView()

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .none
        
        // 초기 센터 설정
//        if let current = LocationManager.shared.currentLocation {
//            let region = MKCoordinateRegion(
//                center: current.coordinate,
//                span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
//            )
//            mapView.setRegion(region, animated: false)
//        }
        moveToCurrentLocation()
        
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // 마커 업데이트
        uiView.removeAnnotations(uiView.annotations.filter { !($0 is MKUserLocation) })
        
        for storeDistance in stores {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(
                latitude: storeDistance.store.ycoordinate,
                longitude: storeDistance.store.xcoordinate
            )
            annotation.title = storeDistance.store.sotreNm
            uiView.addAnnotation(annotation)
        }
        
        cameraCenter = uiView.centerCoordinate
        
        if shouldMoveToCurrentLocation {
            if let location = LocationManager.shared.currentLocation {
                let region = MKCoordinateRegion(
                    center: location.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                )
                uiView.setRegion(region, animated: true)
            }
            
            DispatchQueue.main.async {
                self.shouldMoveToCurrentLocation = false
            }
        }
    }
    
    func moveToCurrentLocation() {
        guard let userLocation = LocationManager.shared.currentLocation else { return }
        
        DispatchQueue.main.async {
            let region = MKCoordinateRegion(
                center: userLocation.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            )
            mapView.setRegion(region, animated: true)
        }
    }

    // MARK: - Coordinator
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        private var hasUserInteracted = false

        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {

            if let view = mapView.subviews.first,
               let gestureRecognizers = view.gestureRecognizers {
                for gesture in gestureRecognizers {
                    if gesture.state == .began || gesture.state == .changed {
                        hasUserInteracted = true
                        break
                    }
                }
            }
        }

        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.cameraCenter = mapView.centerCoordinate
            if hasUserInteracted {
                parent.userDragged = true
            }
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation is MKUserLocation {
                return nil
            }
            
            let identifier = "StoreAnnotation"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
            } else {
                annotationView?.annotation = annotation
            }
            
            annotationView?.image = UIImage(named: "starbucksMarker")
            
            return annotationView
        }
    }
}
