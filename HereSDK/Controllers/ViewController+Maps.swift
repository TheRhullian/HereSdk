//
//  ViewController+Maps.swift
//  HereSDK
//
//  Created by Rhullian Damião on 25/05/2018.
//  Copyright © 2018 Rhullian Damião. All rights reserved.
//

import UIKit
import NMAKit

extension ViewController: NMAMapViewDelegate {
    func mapViewDidDraw(_ mapView: NMAMapView) {
//        print("->DESENHOU")
    }
    
    func mapViewDidEndAnimation(_ mapView: NMAMapView) {
        print("->ACABOU ANIMAÇÂO")
    }
    
    func mapViewDidEndMovement(_ mapView: NMAMapView) {
        print("->ACABOU O MOVIMENTO")
    }
    
    func mapViewDidBeginMovement(_ mapView: NMAMapView) {
        print("->COMEÇOU O MOVIMENTO")
    }
    
    func mapViewDidBeginAnimation(_ mapView: NMAMapView) {
        print("->COMEÇOU ANIMAÇÂO")
    }
    
    func mapViewDidSelectObjects(_ mapView: NMAMapView, objects: [NMAMapObject]) {
        print("->SELECIONOU OBJETOS")
    }
}

extension ViewController: NMAMapGestureDelegate {
    func mapViewDidReceiveTap(_ mapView: NMAMapView, at location: CGPoint) {
        print("->GESTURE: Tap")
    }
    func mapViewDidReceiveDoubleTap(_ mapView: NMAMapView, at location: CGPoint) {
        print("->GESTURE: Double Tap")
    }
    func mapViewDidReceiveLongPress(_ mapView: NMAMapView, at location: CGPoint) {
        print("->GESTURE: Long Press")
    }
    func mapViewDidReceiveTwoFingerTap(_ mapView: NMAMapView, at location: CGPoint) {
        print("->GESTURE: Two Finger Tap")
    }
    func mapViewDidReceivePinch(_ mapView: NMAMapView, pinch: Float, at location: CGPoint) {
        print("->GESTURE: Pinch")
    }
    func mapViewDidReceivePan(_ mapView: NMAMapView, translation: CGPoint, at location: CGPoint) {
        print("->GESTURE: Pan")
    }
}
