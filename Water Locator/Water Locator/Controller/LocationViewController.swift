//
//  LocationViewController.swift
//  Water Locator
//
//  Created by Nguyen, William on 9/26/19.
//  Copyright © 2019 CTEC. All rights reserved.
//
import MapKit
import UIKit

class LocationViewController: UIViewController {

    @IBOutlet weak var globalMap: MKMapView!
    @IBOutlet weak var aboutLabel: UILabel!
   
    override func viewDidLoad() {
    
        super.viewDidLoad()

        // Do any additional setup after loading the view.
   
        let currentLocation = MKCoordinateRegion(center: globalMap.userLocation.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
        globalMap.setRegion(currentLocation, animated: true)
        globalMap.mapType = .satelliteFlyover
        let personalText : String = """
        This app was confusing at first, however things had started to change and was easy to get going. There were still errors I ran into, but they were eventually fixed.

    """
        aboutLabel.text = personalText
    }
    
    @IBAction func mapClick(_ sender: UIButton)-> Void
    {
        let impactLocation = CLLocationCoordinate2D(latitude: 49.334, longitude: 10.9796)
        let mapSpan = MKCoordinateSpan(latitudeDelta: 10.05, longitudeDelta : 10.05)
        let impactRegion = MKCoordinateRegion(center: impactLocation, span: mapSpan)
        globalMap.animatedZoom(zoomRegion: impactRegion, duration: 2.5)
        
    }
}
    extension MKMapView
    {
        public func animatedZoom(zoomRegion:MKCoordinateRegion, duration:TimeInterval)-> Void
        {
            MKMapView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 10, options: UIView.AnimationOptions.curveEaseIn, animations: {self.setRegion(zoomRegion, animated: true)}, completion: nil)
        }
    }



