//
//  CLLocationManager.swift
//  MapSelfPractice
//
//  Created by BoMin Lee on 4/23/25.
//

//import CoreLocation
//import MapKit
//
//@Observable
//class LocationManager: NSObject, CLLocationManagerDelegate {
//    private let manager = CLLocationManager()
//    
//    var region = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
//        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//    )
//    
//    override init() {
//        super.init()
//        manager.delegate = self
//        manager.desiredAccuracy = kCLLocationAccuracyBest
//        manager.requestWhenInUseAuthorization()
//        manager.startUpdatingLocation()
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.first else { return }
//        
//        DispatchQueue.main.async {
//            self.region = MKCoordinateRegion(
//                center: location.coordinate,
//                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
//            )
//        }
//        print(location.coordinate)
//    }
//}
