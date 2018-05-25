//
//  ViewController.swift
//  HereSDK
//
//  Created by Rhullian Damião on 25/05/2018.
//  Copyright © 2018 Rhullian Damião. All rights reserved.
//

import UIKit
import NMAKit

private struct SchemesOfTheMap {
    static let normalDay = NMAMapSchemeNormalDay
    static let normalNight = NMAMapSchemeNormalNight
    static let satelliteDay = NMAMapSchemeSatelliteDay
    static let hybridDay = NMAMapSchemeHybridDay
    static let terrainDay = NMAMapSchemeTerrainDay
    static let reducedDay = NMAMapSchemeReducedDay
    static let reducedNight = NMAMapSchemeReducedNight
    static let pedestrianDay = NMAMapSchemePedestrianDay
    static let pedestrianNight = NMAMapSchemePedestrianNight
}

class ViewController: UIViewController {

    //Map View
    @IBOutlet weak var mapView: NMAMapView!
    //Location Manager
    let locationManager = CLLocationManager()
    //Buttons
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var hybridButton: UIButton!
    @IBOutlet weak var reducedButton: UIButton!
    @IBOutlet weak var satelliteButton: UIButton!
    @IBOutlet weak var nightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        playingWithTheMap()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /// Functio tha plays with the map settings
    func playingWithTheMap(){
        //For test define a accessibilityIdentifier
        self.mapView.accessibilityIdentifier = "mapView"
        //Set the delegate of the map
        self.mapView.delegate = self
        //Set the gestures delegate of the map
        self.mapView.gestureDelegate = self
        //Set the location manager authorization
        self.locationManager.delegate = self
        
        playingWithZoom(13)
        
        playingWithTheMap(geoLatitude: -22.877611, geoLongitude: -47.165110)
        
        playingWithResolution(highResolution: true)
        
        playingWithText(isTextBigger: NMAMapPPI.low)
        
        playingWithScheme(schemeToUse:SchemesOfTheMap.reducedDay)
        
        requestUserPosition()
    }
    ///Set the amount of zoom
    ///
    /// - Parameter amount: Amount of zoom
    private func playingWithZoom(_ amount: Float) {
        self.mapView.zoomLevel = amount
    }
    ///Set the coordinates and the region of focus
    ///
    /// - Parameters:
    ///   - latitude: Latitude Coordinates
    ///   - longitude: Longitude Coordinates
    private func playingWithTheMap(geoLatitude latitude: Double, geoLongitude longitude: Double) {
        //Set the region to focus
        let coordinates = NMAGeoCoordinates(latitude: latitude, longitude: longitude)
        self.mapView.set(geoCenter: coordinates, animation: .linear)
    }
    ///Set the resolution of the Map
    ///
    /// - Parameter resolution: True (Yes) or False (No)
    private func playingWithResolution(highResolution resolution:Bool) {
        self.mapView.useHighResolutionMap = resolution
    }
    /// Set the size of the labels
    ///
    /// - Parameter bigger: True (Yes) or False (No)
    private func playingWithText(isTextBigger bigger:NMAMapPPI) {
        self.mapView.mapPPI = bigger
    }
    ///Request user Location for the map
    private func requestUserPosition() {
        locationManager.requestWhenInUseAuthorization()
    }
    /// Function that manipulates the user location
    private func playingWithUserPosition() {
        let manager = NMAPositioningManager.shared()
        print(manager.isActive)
        manager.startPositioning()
        guard let userPosition = manager.rawPosition?.coordinates else {
            print("->ERROR: Not get the user coordinates")
            return
        }
        playingWithTheMap(geoLatitude: userPosition.latitude, geoLongitude: userPosition.longitude)
        self.mapView.positionIndicator.isVisible = true
    }
    ///Function that manipulates the scheme theme of the map
    private func playingWithScheme(schemeToUse scheme: String){
        self.mapView.mapScheme = scheme
    }
    
    //Actions
    @IBAction func changeSchemeAction(_ sender: UIButton){
        switch sender.restorationIdentifier {
        case "normal":
            self.mapView.mapScheme = SchemesOfTheMap.normalDay
        case "hybrid":
            self.mapView.mapScheme = SchemesOfTheMap.hybridDay
        case "reduced":
            self.mapView.mapScheme = SchemesOfTheMap.reducedDay
        case "satellite":
            self.mapView.mapScheme = SchemesOfTheMap.satelliteDay
        case "night":
            self.mapView.mapScheme = SchemesOfTheMap.normalNight
        default:
            return
        }
    }
    
    func makeACountForUnityTest(_ number: Int) -> Int {
        return 100 - number
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            NotificationCenter.default.post(name: NSNotification.Name.NMAPositioningManagerDidUpdatePosition, object: nil)
            playingWithUserPosition()
        }
        else{
            NotificationCenter.default.post(name: NSNotification.Name.NMAPositioningManagerDidLosePosition, object: nil)
            requestUserPosition()
        }
        
    }
}

