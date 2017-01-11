//
//  DetailCountryVC.swift
//  Mapi
//
//  Created by Mavi on 04/01/17.
//  Copyright © 2017 mario. All rights reserved.
//

import UIKit
import MapKit

class DetailCountryVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var cardView1: UIView!
    @IBOutlet weak var cardView2: UIView!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentCountry = country {
            
            currentCountry.downloadCountryDetails {
                self.capitalLabel.text = currentCountry.capital
                
                let lat = currentCountry.latlong[0]
                let long = currentCountry.latlong[1]
                
                let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                
                self.mapView.centerCoordinate = coordinate
                self.mapView.region.span = MKCoordinateSpanMake(10, 10)
            }
        }
        
    }

}
