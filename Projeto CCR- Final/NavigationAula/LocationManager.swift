//
//  LocationManager.swift
//  NavigationAula
//
//  Created by anthony gianeli on 14/06/20.
//  Copyright © 2020 Luma Gabino Vasconcelos. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

struct LocationNotifications {
    static let sharing = Notification.Name(rawValue: "sharingLocation")
    static let notSharing = Notification.Name(rawValue: "notSharingLocation")
}

class LocationManager: NSObject {
    static var shared = LocationManager()
    var locationManager: CLLocationManager?
    var currentLocation: CLLocation!
    
    /// Função usada para instanciar de locationManager
    func startSingleton() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self

        if self.isSharingLocation() {
            start()
        } else {
            self.requestAuthorization()
        }
    }
    
    /// Função usada para pedir autorização de uso da localização
    func requestAuthorization() {
        locationManager?.requestAlwaysAuthorization()
        locationManager?.requestWhenInUseAuthorization()
    }

    
    /// Função usada para iniciar o serviço de localização
    func start() {
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager?.allowsBackgroundLocationUpdates = true
        locationManager?.pausesLocationUpdatesAutomatically = false
        self.startMonitoringInBackground()
        locationManager?.startMonitoringVisits()
        locationManager?.startUpdatingLocation()
    }
    
    /// Função usada para ser chamada no willTerminate do appDelegate
    func startMonitoringInBackground() {
        locationManager?.startMonitoringSignificantLocationChanges()
        createRegionMonitor()
    }
    
    /// Função usada para criar uma região de monitoramento
    func createRegionMonitor() {
        guard let location = locationManager?.location else { return }
        let region = CLCircularRegion(center: location.coordinate,
                                      radius: 50, identifier: "current_location")
        region.notifyOnExit = true
        locationManager?.startMonitoring(for: region)
    }
    
    /// Função usada para parar o serviço de localização
    func stop() {
        locationManager?.stopUpdatingLocation()
    }
    
    
    /// Função usada para checar se o app está autorizado a usar a localização do usuário
    func isSharingLocation() -> Bool {
        switch CLLocationManager.authorizationStatus() {
        case .denied, .restricted:
            return false
        case .authorizedAlways, .authorizedWhenInUse:
            return true
        default:
            return false
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        var notification: Notification.Name
        if isSharingLocation() {
            notification = LocationNotifications.sharing
        } else {
            notification = LocationNotifications.notSharing
        }
        NotificationCenter.default.post(name: notification,
                                        object: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        manager.stopMonitoring(for: region)
        createRegionMonitor()
    }
    
    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
    }
}
