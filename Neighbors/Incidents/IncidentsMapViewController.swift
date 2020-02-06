//
//  IncidentsMapViewController.swift
//  Neighbors
//
//  Created by Robert Gillett on 2/5/20.
//  Copyright © 2020 Robert Gillett. All rights reserved.
//

import Foundation
import UIKit
import Mapbox

class IncidentsMapViewController: UIViewController {
    
    var mapView: MGLMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupMap()
        
    }
    
    func setupMap() {
        self.mapView = MGLMapView(frame: self.view.frame)
        self.mapView.delegate = self
        self.view.addSubview(self.mapView)
        self.mapView.constrainToParent()
    }
}

extension IncidentsMapViewController: MGLMapViewDelegate {
    
}
