//
//  MapViewViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-6-30.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class MapViewViewController: BaseViewController,MKMapViewDelegate,CLLocationManagerDelegate {

    var locationManager: CLLocationManager?
    var mapView: MKMapView?
    init()
    {
       super.init(coder:nil)
//        locationManager = CLLocationManager()
//        locationManager!.desiredAccuracy = kCLDistanceFilterNone
//        locationManager!.delegate = self
        
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView = MKMapView(frame: UIScreen.mainScreen().applicationFrame)
        self.mapView!.showsUserLocation = true
        self.mapView!.delegate = self
        self.view.addSubview(self.mapView);
        locationManager = CLLocationManager()
        locationManager!.desiredAccuracy = kCLDistanceFilterNone
        locationManager!.delegate = self
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status != CLAuthorizationStatus.NotDetermined {
            mapView!.showsUserLocation = true
        }
    
    }
    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
        var location = CLLocation(latitude: userLocation!.coordinate.latitude,
            longitude: userLocation!.coordinate.longitude)
        var equatorMeridian = CLLocation(latitude: 0, longitude: 0)
        if (equatorMeridian.distanceFromLocation(location) > 0) { //Resolve observed inaccurate position fix
            centerMap(location)
            //self.updateLocation(location)
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: AnyObject[]!) {
        println("Did update location")
         let location = (locations as NSArray).lastObject as CLLocation
         //var location = locations[locations.count-1] as CLLocation
        self.centerMap(location)
       // self.updateLocation(location)
    }
    func centerMap(location: CLLocation) {
        var region = MKCoordinateRegion(center:location.coordinate, span:MKCoordinateSpanMake(0.1, 0.1))
        self.mapView!.setRegion(region, animated: true)
    }
    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
