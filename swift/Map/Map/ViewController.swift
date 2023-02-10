//
//  ViewController.swift
//  Map
//
//  Created by jung on 2021/12/31.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    //declare outlet
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    //load locationmanager
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
    }
    
    func goLocation(latitudeValue : CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latituteValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span :Double, title strTitle: String, subtitle strSubtitle:String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latituteValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil{
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil{
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        
        locationManager.stopUpdatingLocation()
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        }
        else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latituteValue: 37.52096870036457, longitudeValue: 127.02269097907454, delta: 0.1, title: "Apple 가로수길", subtitle: "서울특별시 강남구 가로수길 43")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "Apple 가로수길"
        }
        else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latituteValue: 37.51204321059246, longitudeValue: 127.0591652926035, delta: 0.1, title: "코엑스", subtitle: "서울특별시 강남구 영동대로 513")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "코엑스"
        }
    }
    
}

